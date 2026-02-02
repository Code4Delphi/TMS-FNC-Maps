unit Location.Main.View;

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
  VCL.TMSFNCCloudBase,
  VCL.TMSFNCLocation,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps;


type
  TLocationMainView = class(TForm)
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
    Shape1: TShape;
    Label1: TLabel;
    Label4: TLabel;
    edtAPIKeyLocation: TEdit;
    cBoxServiceLocation: TComboBox;
    btnGetGeocoding: TButton;
    Splitter3: TSplitter;
    TMSFNCLocation1: TTMSFNCLocation;
    btnClearMarkers: TButton;
    Label3: TLabel;
    cBoxLocationConnection: TComboBox;
    ckZoomInCreatedMarker: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxServiceMapChange(Sender: TObject);
    procedure ckHistoryEnabledClick(Sender: TObject);
    procedure btnGetGeocodingClick(Sender: TObject);
    procedure TMSFNCLocation1GetLocation(Sender: TObject; const ARequest: TTMSFNCLocationRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure btnClearMarkersClick(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure FillcBoxServiceMap;
    procedure FillcBoxServiceLocation;
    procedure FillcBoxLocationConnection;
  public
  end;

var
  LocationMainView: TLocationMainView;

implementation

{$R *.dfm}

procedure TLocationMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Self.FillcBoxServiceMap;
  cBoxServiceMap.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);

  Self.FillcBoxServiceLocation;
  cBoxServiceLocation.ItemIndex := Integer(TTMSFNCLocationService.lsIPStack);

  Self.FillcBoxLocationConnection;
  cBoxLocationConnection.ItemIndex := Integer(TTMSFNCLocationConnection.lcHTTPS);

  Self.ConfigBasicMaps;
end;

procedure TLocationMainView.FillcBoxServiceMap;
var
  LService: TTMSFNCMapsService;
begin
  cBoxServiceMap.Items.Clear;

  for LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
    cBoxServiceMap.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
end;

procedure TLocationMainView.FillcBoxServiceLocation;
var
  LService: TTMSFNCLocationService;
begin
  cBoxServiceLocation.Items.Clear;

  for LService := Low(TTMSFNCLocationService) to High(TTMSFNCLocationService) do
    cBoxServiceLocation.Items.Add(GetEnumName(TypeInfo(TTMSFNCLocationService), Ord(LService)));
end;

procedure TLocationMainView.FillcBoxLocationConnection;
var
  LConnection: TTMSFNCLocationConnection;
begin
  cBoxLocationConnection.Items.Clear;

  for LConnection := Low(TTMSFNCLocationConnection) to High(TTMSFNCLocationConnection) do
    cBoxLocationConnection.Items.Add(GetEnumName(TypeInfo(TTMSFNCLocationConnection), Ord(LConnection)));
end;

procedure TLocationMainView.cBoxServiceMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TLocationMainView.ckHistoryEnabledClick(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TLocationMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TLocationMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxServiceMap.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;

  TMSFNCLocation1.APIKey := edtAPIKeyLocation.Text;
  TMSFNCLocation1.Service := TTMSFNCLocationService(cBoxServiceLocation.ItemIndex);
  TMSFNCLocation1.Connection := TTMSFNCLocationConnection(cBoxLocationConnection.ItemIndex);

  TMSFNCMaps1.EndUpdate;
end;

procedure TLocationMainView.btnGetGeocodingClick(Sender: TObject);
begin
  TMSFNCLocation1.GetLocation;
end;

procedure TLocationMainView.TMSFNCLocation1GetLocation(Sender: TObject; const ARequest: TTMSFNCLocationRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  TMSFNCMaps1.SetCenterCoordinate(ARequest.Coordinate.ToRec);
  TMSFNCMaps1.AddMarker(ARequest.Coordinate.ToRec);

  if ckZoomInCreatedMarker.Checked then
    TMSFNCMaps1.ZoomToBounds(TMSFNCMaps1.Markers.ToCoordinateArray)
end;

procedure TLocationMainView.btnClearMarkersClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearMarkers;
end;

end.
