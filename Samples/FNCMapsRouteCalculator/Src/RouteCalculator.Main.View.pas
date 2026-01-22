unit RouteCalculator.Main.View;

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
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCloudBase,
  VCL.TMSFNCGeocoding,
  VCL.TMSFNCRouteCalculator,
  VCL.TMSFNCDirections;

type
  TRouteCalculatorMainView = class(TForm)
    pnTop: TPanel;
    GroupBox3: TGroupBox;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    Splitter1: TSplitter;
    Label2: TLabel;
    cBoxServiceMap: TComboBox;
    Label3: TLabel;
    edtAddress: TEdit;
    TMSFNCMaps1: TTMSFNCMaps;
    TMSFNCRouteCalculator1: TTMSFNCRouteCalculator;
    Shape1: TShape;
    Label1: TLabel;
    Label4: TLabel;
    edtAPIKeyRoute: TEdit;
    cBoxServiceRoute: TComboBox;
    Label6: TLabel;
    btClear: TButton;
    btDelete: TButton;
    btUndo: TButton;
    btRedo: TButton;
    btExport: TButton;
    btImport: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label7: TLabel;
    cBoxTravelMode: TComboBox;
    ckHistoryEnabled: TCheckBox;
    ckIncludeAlternativeRoutes: TCheckBox;
    ckAvoidTolls: TCheckBox;
    btnGetGeocoding: TButton;
    ckActiveRouteCalculator: TCheckBox;
    GroupBox2: TGroupBox;
    edtCalculateRouteBetweenAddress: TButton;
    Label8: TLabel;
    edtStartAddress: TEdit;
    Label9: TLabel;
    edtEndAddress: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxServiceMapChange(Sender: TObject);
    procedure TMSFNCRouteCalculator1GetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure TMSFNCMaps1RouteCalculatorBeforeDeleteMarker(Sender: TObject; var ACanDelete: Boolean;
      AMarker: TTMSFNCMapsMarker; ASegment: TTMSFNCRouteCalculatorSegment);
    procedure TMSFNCMaps1RouteCalculatorBeforeDeletePolyline(Sender: TObject; var ACanDelete: Boolean;
      APolyline: TTMSFNCMapsPolyline; ASegment: TTMSFNCRouteCalculatorSegment);
    procedure btClearClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btUndoClick(Sender: TObject);
    procedure btRedoClick(Sender: TObject);
    procedure btExportClick(Sender: TObject);
    procedure btImportClick(Sender: TObject);
    procedure ckHistoryEnabledClick(Sender: TObject);
    procedure btnGetGeocodingClick(Sender: TObject);
    procedure edtCalculateRouteBetweenAddressClick(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure FillcBoxServiceMap;
    procedure FillcBoxServiceRoute;
    procedure FillcBoxTravelMode;
  public
  end;

var
  RouteCalculatorMainView: TRouteCalculatorMainView;

implementation

{$R *.dfm}

procedure TRouteCalculatorMainView.FormCreate(Sender: TObject);
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

procedure TRouteCalculatorMainView.FillcBoxServiceMap;
var
  LService: TTMSFNCMapsService;
begin
  cBoxServiceMap.Items.Clear;

  for LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
    cBoxServiceMap.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
end;

procedure TRouteCalculatorMainView.FillcBoxServiceRoute;
var
  LService: TTMSFNCRouteCalculatorService;
begin
  cBoxServiceRoute.Items.Clear;

  for LService := Low(TTMSFNCRouteCalculatorService) to High(TTMSFNCRouteCalculatorService) do
    cBoxServiceRoute.Items.Add(GetEnumName(TypeInfo(TTMSFNCRouteCalculatorService), Ord(LService)));
end;

procedure TRouteCalculatorMainView.FillcBoxTravelMode;
var
  LService: TTMSFNCDirectionsTravelMode;
begin
  cBoxTravelMode.Items.Clear;

  for LService := Low(TTMSFNCDirectionsTravelMode) to High(TTMSFNCDirectionsTravelMode) do
    cBoxTravelMode.Items.Add(GetEnumName(TypeInfo(TTMSFNCDirectionsTravelMode), Ord(LService)));
end;

procedure TRouteCalculatorMainView.cBoxLanguageChange(Sender: TObject);
begin
  TMSFNCMaps1.Options.Locale := 'pt-BR';
  TMSFNCMaps1.ReInitialize;
end;

procedure TRouteCalculatorMainView.cBoxServiceMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TRouteCalculatorMainView.ckHistoryEnabledClick(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TRouteCalculatorMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TRouteCalculatorMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxServiceMap.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;

  TMSFNCRouteCalculator1.APIKey := edtAPIKeyRoute.Text;
  TMSFNCRouteCalculator1.Service := TTMSFNCRouteCalculatorService(cBoxServiceRoute.ItemIndex);

  TMSFNCRouteCalculator1.Active := ckActiveRouteCalculator.Checked;
  TMSFNCRouteCalculator1.Options.AvoidTolls := ckAvoidTolls.Checked;
  TMSFNCRouteCalculator1.Options.HistoryEnabled := ckHistoryEnabled.Checked;
  TMSFNCRouteCalculator1.Options.IncludeAlternativeRoutes := ckIncludeAlternativeRoutes.Checked;
  TMSFNCRouteCalculator1.Options.TravelMode := TTMSFNCDirectionsTravelMode(cBoxTravelMode.ItemIndex);
  TMSFNCMaps1.RouteCalculator := TMSFNCRouteCalculator1;

  TMSFNCMaps1.EndUpdate;
end;

procedure TRouteCalculatorMainView.TMSFNCRouteCalculator1GetGeocoding(Sender: TObject;
  const ARequest: TTMSFNCGeocodingRequest; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if ARequestResult.Success then
  begin
    if ARequest.Items.Count > 0 then
      TMSFNCMaps1.SetCenterCoordinate(ARequest.Items[0].Coordinate.ToRec);
  end;
end;

procedure TRouteCalculatorMainView.TMSFNCMaps1RouteCalculatorBeforeDeleteMarker(Sender: TObject;
  var ACanDelete: Boolean; AMarker: TTMSFNCMapsMarker; ASegment: TTMSFNCRouteCalculatorSegment);
begin
  ACanDelete := TTMSFNCUtils.Message('Confirm the exclusion of the selected marker?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = 6;
end;

procedure TRouteCalculatorMainView.TMSFNCMaps1RouteCalculatorBeforeDeletePolyline(Sender: TObject;
  var ACanDelete: Boolean; APolyline: TTMSFNCMapsPolyline; ASegment: TTMSFNCRouteCalculatorSegment);
begin
  ACanDelete := TTMSFNCUtils.Message('Confirm the exclusion of the selected segment?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = 6;
end;

procedure TRouteCalculatorMainView.btClearClick(Sender: TObject);
begin
  TMSFNCMaps1.Clear;
  TMSFNCRouteCalculator1.Clear;
end;

procedure TRouteCalculatorMainView.btDeleteClick(Sender: TObject);
begin
  if not Assigned(TMSFNCMaps1.RouteCalculatorSelectedPolyline) or Assigned(TMSFNCMaps1.RouteCalculatorSelectedMarker) then
  begin
    ShowMessage('No route waypoint or segment selected');
    Exit;
  end;

  if TTMSFNCUtils.Message('Are you sure you want to delete the selected part?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = 6 then
  begin
    TMSFNCMaps1.RouteCalculatorDeleteSelectedPolyline;
    TMSFNCMaps1.RouteCalculatorDeleteSelectedMarker;
  end;
end;

procedure TRouteCalculatorMainView.btUndoClick(Sender: TObject);
begin
  TMSFNCRouteCalculator1.HistoryManager.Undo;
  TMSFNCMaps1.Clear;
  TMSFNCMaps1.RouteCalculatorPlotRoutes;
end;

procedure TRouteCalculatorMainView.btRedoClick(Sender: TObject);
begin
    TMSFNCRouteCalculator1.HistoryManager.Redo;
  TMSFNCMaps1.Clear;
  TMSFNCMaps1.RouteCalculatorPlotRoutes;
end;

procedure TRouteCalculatorMainView.btExportClick(Sender: TObject);
var
  LGPXMetaData: TTMSFNCMapsGPXMetaData;
begin
  if not TMSFNCRouteCalculator1.HasRoutes then
  begin
    ShowMessage('There are no routes to be exported.');
    Exit;
  end;

  TMSFNCRouteCalculator1.Routes[0].RouteName := 'TMSFNCRouteCalculator';
  SaveDialog1.FileName := TMSFNCRouteCalculator1.Routes[0].RouteName + '.gpx';
  if SaveDialog1.Execute then
  begin
    LGPXMetaData.TrackName := TMSFNCRouteCalculator1.Routes[0].RouteName;
    TMSFNCRouteCalculator1.SaveToGPXFile(TMSFNCRouteCalculator1.Routes[0], SaveDialog1.FileName, LGPXMetaData)
  end;
end;

procedure TRouteCalculatorMainView.btImportClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    TMSFNCRouteCalculator1.LoadGPXFromFile(OpenDialog1.FileName);
    TMSFNCMaps1.RouteCalculatorPlotRoutes;
    if TMSFNCRouteCalculator1.HasRoutes then
      TMSFNCMaps1.ZoomToBounds(TMSFNCRouteCalculator1.Routes[0].Polyline);
  end;
end;

procedure TRouteCalculatorMainView.btnGetGeocodingClick(Sender: TObject);
begin
  TMSFNCRouteCalculator1.GetGeocoding(edtAddress.Text);
end;

procedure TRouteCalculatorMainView.edtCalculateRouteBetweenAddressClick(Sender: TObject);
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

end.
