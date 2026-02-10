unit GPXGeoJSON.Main.View;

interface

uses
  TypInfo,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  Clipbrd,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Grids,
  Vcl.DBGrids,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCRouteCalculator,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  VCL.TMSFNCGeocoding,
  VCL.TMSFNCCloudBase,
  VCL.TMSFNCDirections;

type
  TGPXGeoJSONMainView = class(TForm)
    pnTop: TPanel;
    GroupBox3: TGroupBox;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    Splitter1: TSplitter;
    Label2: TLabel;
    cBoxServiceMap: TComboBox;
    TMSFNCMaps1: TTMSFNCMaps;
    TMSFNCRouteCalculator1: TTMSFNCRouteCalculator;
    Shape1: TShape;
    Label1: TLabel;
    Label4: TLabel;
    edtAPIKeyRoute: TEdit;
    cBoxServiceRoute: TComboBox;
    btExport: TButton;
    btImport: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label7: TLabel;
    cBoxTravelMode: TComboBox;
    GroupBox2: TGroupBox;
    btnCalculateRouteBetweenAddress: TButton;
    Label8: TLabel;
    edtStartAddress: TEdit;
    Label9: TLabel;
    edtEndAddress: TEdit;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    btnClearMap: TButton;
    GroupBox4: TGroupBox;
    btnImportGeoJSON: TButton;
    btnExportGeoJSON: TButton;
    procedure FormCreate(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxServiceMapChange(Sender: TObject);
    procedure TMSFNCRouteCalculator1GetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure btExportClick(Sender: TObject);
    procedure btImportClick(Sender: TObject);
    procedure btnCalculateRouteBetweenAddressClick(Sender: TObject);
    procedure btnClearMapClick(Sender: TObject);
    procedure btnExportGeoJSONClick(Sender: TObject);
    procedure btnImportGeoJSONClick(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure FillcBoxServiceMap;
    procedure FillcBoxServiceRoute;
    procedure FillcBoxTravelMode;
  public
  end;

var
  GPXGeoJSONMainView: TGPXGeoJSONMainView;

implementation

{$R *.dfm}

procedure TGPXGeoJSONMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Self.FillcBoxServiceMap;
  cBoxServiceMap.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);

  Self.FillcBoxServiceRoute;
  cBoxServiceRoute.ItemIndex := Integer(TTMSFNCRouteCalculatorService.csGoogle);

  Self.FillcBoxTravelMode;
  cBoxTravelMode.ItemIndex := Integer(TMSFNCRouteCalculator1.Options.TravelMode);

  Self.ConfigBasicMaps;
end;

procedure TGPXGeoJSONMainView.FillcBoxServiceMap;
var
  LService: TTMSFNCMapsService;
begin
  cBoxServiceMap.Items.Clear;

  for LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
    cBoxServiceMap.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
end;

procedure TGPXGeoJSONMainView.FillcBoxServiceRoute;
var
  LService: TTMSFNCRouteCalculatorService;
begin
  cBoxServiceRoute.Items.Clear;

  for LService := Low(TTMSFNCRouteCalculatorService) to High(TTMSFNCRouteCalculatorService) do
    cBoxServiceRoute.Items.Add(GetEnumName(TypeInfo(TTMSFNCRouteCalculatorService), Ord(LService)));
end;

procedure TGPXGeoJSONMainView.FillcBoxTravelMode;
var
  LService: TTMSFNCDirectionsTravelMode;
begin
  cBoxTravelMode.Items.Clear;

  for LService := Low(TTMSFNCDirectionsTravelMode) to High(TTMSFNCDirectionsTravelMode) do
    cBoxTravelMode.Items.Add(GetEnumName(TypeInfo(TTMSFNCDirectionsTravelMode), Ord(LService)));
end;

procedure TGPXGeoJSONMainView.cBoxServiceMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TGPXGeoJSONMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TGPXGeoJSONMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxServiceMap.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;

  TMSFNCRouteCalculator1.APIKey := edtAPIKeyRoute.Text;
  TMSFNCRouteCalculator1.Service := TTMSFNCRouteCalculatorService(cBoxServiceRoute.ItemIndex);

  TMSFNCRouteCalculator1.Active := True;
  TMSFNCRouteCalculator1.Options.TravelMode := TTMSFNCDirectionsTravelMode(cBoxTravelMode.ItemIndex);
  TMSFNCMaps1.RouteCalculator := TMSFNCRouteCalculator1;

  TMSFNCMaps1.EndUpdate;
end;

procedure TGPXGeoJSONMainView.TMSFNCRouteCalculator1GetGeocoding(Sender: TObject;
  const ARequest: TTMSFNCGeocodingRequest; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if ARequestResult.Success then
  begin
    if ARequest.Items.Count > 0 then
      TMSFNCMaps1.SetCenterCoordinate(ARequest.Items[0].Coordinate.ToRec);
  end;
end;

procedure TGPXGeoJSONMainView.btImportClick(Sender: TObject);
begin
  OpenDialog1.Filter := 'GPX (*.gpx)|*.gpx';
  if OpenDialog1.Execute then
  begin
    TMSFNCRouteCalculator1.LoadGPXFromFile(OpenDialog1.FileName);
    TMSFNCMaps1.RouteCalculatorPlotRoutes;
    if TMSFNCRouteCalculator1.HasRoutes then
      TMSFNCMaps1.ZoomToBounds(TMSFNCRouteCalculator1.Routes[0].Polyline);
  end;
end;

procedure TGPXGeoJSONMainView.btExportClick(Sender: TObject);
var
  LGPXMetaData: TTMSFNCMapsGPXMetaData;
begin
  if not TMSFNCRouteCalculator1.HasRoutes then
  begin
    ShowMessage('There are no routes to be exported.');
    Exit;
  end;

  TMSFNCRouteCalculator1.Routes[0].RouteName := 'TMSFNCRouteCalculator';
  SaveDialog1.Filter := 'GPX (*.gpx)|*.gpx';
  SaveDialog1.FileName := TMSFNCRouteCalculator1.Routes[0].RouteName + '.gpx';
  if SaveDialog1.Execute then
  begin
    LGPXMetaData.TrackName := TMSFNCRouteCalculator1.Routes[0].RouteName;
    TMSFNCRouteCalculator1.SaveToGPXFile(TMSFNCRouteCalculator1.Routes[0], SaveDialog1.FileName, LGPXMetaData);
  end;
end;

procedure TGPXGeoJSONMainView.btnCalculateRouteBetweenAddressClick(Sender: TObject);
begin
  TMSFNCRouteCalculator1.CalculateRoute(edtStartAddress.Text, edtEndAddress.Text,
    procedure(const ARoute: TTMSFNCRouteCalculatorRoute)
    begin
      if Length(ARoute.Polyline) = 0 then
        Exit;

      var LIndex := Length(ARoute.Polyline) div 2;
      var LCenter := ARoute.Polyline[LIndex];
      TMSFNCMaps1.SetCenterCoordinate(LCenter);
    end);
end;

procedure TGPXGeoJSONMainView.btnClearMapClick(Sender: TObject);
begin
  TMSFNCMaps1.Clear;
end;

procedure TGPXGeoJSONMainView.btnImportGeoJSONClick(Sender: TObject);
var
  pl: TTMSFNCMapsPolyline;
  I: Integer;
begin
  //OpenDialog1.Filter := 'GeoJSON (*.geojson)|*.geojson';
  OpenDialog1.Filter := 'GPX (*.gpx)|*.gpx';
  if OpenDialog1.Execute then
  begin
    TMSFNCMaps1.BeginUpdate;
    TMSFNCMaps1.LoadGeoJSONFromFile(OpenDialog1.FileName);
//    for I := 0 to TMSFNCMaps1.Polylines.Count - 1 do
//    begin
//      pl := TMSFNCMaps1.Polylines[I];
//      pl.StrokeColor := gcBlue;
//      pl.StrokeOpacity := 0.5;
//    end;
    TMSFNCMaps1.EndUpdate;
  end;
end;

procedure TGPXGeoJSONMainView.btnExportGeoJSONClick(Sender: TObject);
begin
  SaveDialog1.Filter := 'GeoJSON (*.geojson)|*.geojson';
  SaveDialog1.FileName := 'Rota.geojson';
  if SaveDialog1.Execute then
  begin
    TMSFNCRouteCalculator1.SaveToJSONFile(SaveDialog1.FileName);
  end;
end;

end.
