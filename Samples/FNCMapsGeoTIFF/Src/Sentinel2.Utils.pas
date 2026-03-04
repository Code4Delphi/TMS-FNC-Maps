unit Sentinel2.Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  System.JSON,
  System.Generics.Collections,
  VCL.TMSFNCCloudBase;

type
  TSentinel2Params = record
    Latitude: Double;
    Longitude: Double;
    RadiusKM: Double;
    Limit: Integer;
    CloudCover: Integer;
    Results: TStrings
  end;

  TSentinel2Utils = class
  private
    class var FSentinel2Params: TSentinel2Params;
    class function CalcBBox: string;
    class function ListarLinksTCI_NoMemo(const AJSON: string): string;
  public
    class procedure GetLinks(const ASentinel2Params: TSentinel2Params);
  end;

implementation

class procedure TSentinel2Utils.GetLinks(const ASentinel2Params: TSentinel2Params);
var
  LJsonBody: string;
  LBbox: string;
begin
  FSentinel2Params := ASentinel2Params;
  FSentinel2Params.Results.Clear;

  LBbox := Self.CalcBBox;

  HTTPClearHeaders;
  HTTPAddHeader('Content-Type', 'application/json');
  HTTPAddHeader('Accept', 'application/json');
  LJsonBody :=
    '{"collections":["sentinel-2-l2a"],' +
      '"bbox":'+ LBbox +',' +
      '"limit":'+ ASentinel2Params.Limit.ToString +','+
      '"query": {'+
      '  "eo:cloud_cover": {'+
      '    "lt": '+ ASentinel2Params.CloudCover.ToString +
      '  }'+
      '}'+
    '}';

  HTTPCloudRequest(
    'https://earth-search.aws.element84.com', // host
    '/v1/search',                              // path
    '',                                        // query
    LJsonBody,                                  // post data
    rrtString,
    rmPOST,
    procedure(const AReq: TTMSFNCCloudBaseRequestResult)
    begin
      //mmLog.Lines.Add('HTTP ' + AReq.ResponseCode.ToString);
      //mmLog.Lines.Add(AReq.ResultString);
      if AReq.Success then
        Self.ListarLinksTCI_NoMemo(AReq.ResultString)
      else
        FSentinel2Params.Results.Add('Erro: ' + AReq.ResultString);
    end
  );
end;

class function TSentinel2Utils.CalcBBox: string;
var
  LDegLat, LDegLon: Double;
  LatRad: Double;
  LMinLat, LMaxLat, LMinLon, LMaxLon: Double;
begin
  // km → graus latitude
  LDegLat := (FSentinel2Params.RadiusKM / 2) / 110.574;

  // km → graus longitude (depende da latitude)
  LatRad := FSentinel2Params.Latitude * (Pi / 180);
  LDegLon := (FSentinel2Params.RadiusKM / 2) / (111.320 * Cos(LatRad));

  LMinLat := FSentinel2Params.Latitude - LDegLat;
  LMaxLat := FSentinel2Params.Latitude + LDegLat;
  LMinLon := FSentinel2Params.Longitude - LDegLon;
  LMaxLon := FSentinel2Params.Longitude + LDegLon;

  // Formato padrão bbox: [minLon, minLat, maxLon, maxLat]
  Result := Format('[%.6f, %.6f, %.6f, %.6f]', [LMinLon, LMinLat, LMaxLon, LMaxLat]);
end;

class function TSentinel2Utils.ListarLinksTCI_NoMemo(const AJSON: string): string;
var
  LJsonRoot: TJSONObject;
  LJsonFeatures: TJSONArray;
  LJsonFeature: TJSONObject;
  LJsonAssets: TJSONObject;
  LJsonPair: TJSONPair;
  LHref: string;
  I: Integer;
begin
  FSentinel2Params.Results.BeginUpdate;
  try
    FSentinel2Params.Results.Clear;

    LJsonRoot := TJSONObject.ParseJSONValue(AJSON) as TJSONObject;
    try
      if not Assigned(LJsonRoot) then
        Exit;

      LJsonFeatures := LJsonRoot.GetValue<TJSONArray>('features');
      if not Assigned(LJsonFeatures) then
        Exit;

      for I := 0 to LJsonFeatures.Count - 1 do
      begin
        LJsonFeature := LJsonFeatures.Items[I] as TJSONObject;
        if not Assigned(LJsonFeature) then
          Continue;

        LJsonAssets := LJsonFeature.GetValue<TJSONObject>('assets');
        if not Assigned(LJsonAssets) then
          Continue;

        // percorre todos LJsonAssets e pega qualquer LHref que termine com TCI.tif
        for LJsonPair in LJsonAssets do
        begin
          if LJsonPair.JsonValue is TJSONObject then
          begin
            LHref := (LJsonPair.JsonValue as TJSONObject).GetValue<string>('href', '');
            if (LHref <> '') and LHref.EndsWith('TCI.tif', True) then
              FSentinel2Params.Results.Add(LHref);
          end;
        end;
      end;
    finally
      LJsonRoot.Free;
    end;
  finally
    FSentinel2Params.Results.EndUpdate;
  end;
end;

end.
