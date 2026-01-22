unit Directions.Main.View;

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
  TDirectionsMainView = class(TForm)
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
    Shape1: TShape;
    Label1: TLabel;
    Label4: TLabel;
    edtAPIKeyDirections: TEdit;
    cBoxServiceDirections: TComboBox;
    Label6: TLabel;
    btClear: TButton;
    btDelete: TButton;
    btUndo: TButton;
    btRedo: TButton;
    btExport: TButton;
    btImport: TButton;
    Label7: TLabel;
    cBoxTravelMode: TComboBox;
    btnGetGeocoding: TButton;
    GroupBox2: TGroupBox;
    edtCalculateRouteBetweenAddress: TButton;
    Label8: TLabel;
    edtStartAddress: TEdit;
    Label9: TLabel;
    edtEndAddress: TEdit;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    TMSFNCDirections1: TTMSFNCDirections;
    procedure FormCreate(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxServiceMapChange(Sender: TObject);
    procedure TMSFNCMaps1RouteCalculatorBeforeDeleteMarker(Sender: TObject; var ACanDelete: Boolean;
      AMarker: TTMSFNCMapsMarker; ASegment: TTMSFNCRouteCalculatorSegment);
    procedure TMSFNCMaps1RouteCalculatorBeforeDeletePolyline(Sender: TObject; var ACanDelete: Boolean;
      APolyline: TTMSFNCMapsPolyline; ASegment: TTMSFNCRouteCalculatorSegment);
    procedure ckHistoryEnabledClick(Sender: TObject);
    procedure btnGetGeocodingClick(Sender: TObject);
    procedure edtCalculateRouteBetweenAddressClick(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure FillcBoxServiceMap;
    procedure FillcBoxServiceDirections;
  public
  end;

var
  DirectionsMainView: TDirectionsMainView;

implementation

{$R *.dfm}

procedure TDirectionsMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Self.FillcBoxServiceMap;
  cBoxServiceMap.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);

  Self.FillcBoxServiceDirections;
  cBoxServiceDirections.ItemIndex := Integer(TTMSFNCDirectionsService.dsGoogle);

  Self.ConfigBasicMaps;
end;

procedure TDirectionsMainView.FillcBoxServiceMap;
var
  LService: TTMSFNCMapsService;
begin
  cBoxServiceMap.Items.Clear;

  for LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
    cBoxServiceMap.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
end;

procedure TDirectionsMainView.FillcBoxServiceDirections;
var
  LService: TTMSFNCDirectionsService;
begin
  cBoxServiceDirections.Items.Clear;

  for LService := Low(TTMSFNCDirectionsService) to High(TTMSFNCDirectionsService) do
    cBoxServiceDirections.Items.Add(GetEnumName(TypeInfo(TTMSFNCDirectionsService), Ord(LService)));
end;

procedure TDirectionsMainView.cBoxLanguageChange(Sender: TObject);
begin
  TMSFNCMaps1.Options.Locale := 'pt-BR';
  TMSFNCMaps1.ReInitialize;
end;

procedure TDirectionsMainView.cBoxServiceMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TDirectionsMainView.ckHistoryEnabledClick(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TDirectionsMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TDirectionsMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxServiceMap.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;

  TMSFNCDirections1.APIKey := edtAPIKeyDirections.Text;
  TMSFNCDirections1.Service := TTMSFNCDirectionsService(cBoxServiceDirections.ItemIndex);

  TMSFNCMaps1.EndUpdate;
end;

procedure TDirectionsMainView.TMSFNCRouteCalculator1GetGeocoding(Sender: TObject;
  const ARequest: TTMSFNCGeocodingRequest; const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if ARequestResult.Success then
  begin
    if ARequest.Items.Count > 0 then
      TMSFNCMaps1.SetCenterCoordinate(ARequest.Items[0].Coordinate.ToRec);
  end;
end;

procedure TDirectionsMainView.TMSFNCMaps1RouteCalculatorBeforeDeleteMarker(Sender: TObject;
  var ACanDelete: Boolean; AMarker: TTMSFNCMapsMarker; ASegment: TTMSFNCRouteCalculatorSegment);
begin
  ACanDelete := TTMSFNCUtils.Message('Confirm the exclusion of the selected marker?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = 6;
end;

procedure TDirectionsMainView.TMSFNCMaps1RouteCalculatorBeforeDeletePolyline(Sender: TObject;
  var ACanDelete: Boolean; APolyline: TTMSFNCMapsPolyline; ASegment: TTMSFNCRouteCalculatorSegment);
begin
  ACanDelete := TTMSFNCUtils.Message('Confirm the exclusion of the selected segment?', TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = 6;
end;

procedure TDirectionsMainView.btnGetGeocodingClick(Sender: TObject);
begin
  TMSFNCRouteCalculator1.GetGeocoding(edtAddress.Text);
end;

procedure TDirectionsMainView.edtCalculateRouteBetweenAddressClick(Sender: TObject);
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
