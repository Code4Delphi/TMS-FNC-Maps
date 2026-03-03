unit Sentinel2.Utils;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  System.JSON,
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
    class var FResults: TStrings;

    class function CalcBBox(const ALat, ALon, ARadiusKm: Double): string;
    class function ListarLinksTCI_NoMemo(const AJSON: string): string;
  public
    class procedure GetLinks(const ALat, ALon, ARadiusKm: Double; AResults: TStrings);
  end;

implementation

class procedure TSentinel2Utils.GetLinks(const ALat, ALon, ARadiusKm: Double; AResults: TStrings);
var
  JsonBody: string;
  LBbox: string;
begin
  FResults := AResults;
  FResults.Clear;

  LBbox := Self.CalcBBox(ALat, ALon, ARadiusKm);

  HTTPClearHeaders;
  HTTPAddHeader('Content-Type', 'application/json');
  HTTPAddHeader('Accept', 'application/json');
  JsonBody :=
    '{"collections":["sentinel-2-l2a"],' +
      '"bbox":'+ LBbox +',' +
      '"limit":2,'+
      '"query": {'+
      '  "eo:cloud_cover": {'+
      '    "lt": 10'+
      '  }'+
      '}'+
    '}';

  HTTPCloudRequest(
    'https://earth-search.aws.element84.com', // host
    '/v1/search',                              // path
    '',                                        // query
    JsonBody,                                  // post data
    rrtString,
    rmPOST,
    procedure(const AReq: TTMSFNCCloudBaseRequestResult)
    begin
      //mmLog.Lines.Add('HTTP ' + AReq.ResponseCode.ToString);
      //mmLog.Lines.Add(AReq.ResultString);
      if AReq.Success then
        Self.ListarLinksTCI_NoMemo(AReq.ResultString)
      else
        FResults.Add('Erro: ' + AReq.ResultString);
    end
  );
end;

class function TSentinel2Utils.CalcBBox(const ALat, ALon, ARadiusKm: Double): string;
var
  DegLat, DegLon: Double;
  LatRad: Double;
  MinLat, MaxLat, MinLon, MaxLon: Double;
begin
  // km → graus latitude
  DegLat := ARadiusKm / 110.574;

  // km → graus longitude (depende da latitude)
  LatRad := DegToRad(ALat);
  DegLon := ARadiusKm / (111.320 * Cos(LatRad));

  MinLat := ALat - DegLat;
  MaxLat := ALat + DegLat;
  MinLon := ALon - DegLon;
  MaxLon := ALon + DegLon;

  // Formato padrão bbox: [minLon, minLat, maxLon, maxLat]
  Result := Format('[%.6f, %.6f, %.6f, %.6f]',
    [MinLon, MinLat, MaxLon, MaxLat]);
end;

class function TSentinel2Utils.ListarLinksTCI_NoMemo(const AJSON: string): string;
var
  Root: TJSONObject;
  Features: TJSONArray;
  Feature: TJSONObject;
  Assets: TJSONObject;
  Pair: TJSONPair;
  Href: string;
  I: Integer;
begin
  FResults.BeginUpdate;
  try
    FResults.Clear;

    Root := TJSONObject.ParseJSONValue(AJSON) as TJSONObject;
    try
      if not Assigned(Root) then
        Exit;

      Features := Root.GetValue<TJSONArray>('features');
      if not Assigned(Features) then
        Exit;

      for I := 0 to Features.Count - 1 do
      begin
        Feature := Features.Items[I] as TJSONObject;
        if not Assigned(Feature) then
          Continue;

        Assets := Feature.GetValue<TJSONObject>('assets');
        if not Assigned(Assets) then
          Continue;

        // percorre todos assets e pega qualquer href que termine com TCI.tif
        for Pair in Assets do
        begin
          if Pair.JsonValue is TJSONObject then
          begin
            Href := (Pair.JsonValue as TJSONObject).GetValue<string>('href', '');
            if (Href <> '') and Href.EndsWith('TCI.tif', True) then
              FResults.Add(Href);
          end;
        end;
      end;

    finally
      Root.Free;
    end;

  finally
    FResults.EndUpdate;
  end;
end;

end.
