unit StaticMap.Main.View;

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
  Vcl.DBGrids, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCGeocoding,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCCloudBase, VCL.TMSFNCStaticMap, VCL.TMSFNCCustomControl, VCL.TMSFNCMapsImage,
  Vcl.Samples.Spin;

type
  TStaticMapMainView = class(TForm)
    pnTop: TPanel;
    GroupBox3: TGroupBox;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtAPIKeyStaticMap: TEdit;
    Splitter1: TSplitter;
    Label2: TLabel;
    cBoxServiceStaticMap: TComboBox;
    Shape1: TShape;
    Label1: TLabel;
    Label4: TLabel;
    edtAPIKeyGeocoding: TEdit;
    cBoxServiceGeocoding: TComboBox;
    Splitter3: TSplitter;
    btnDisplayMapImage: TButton;
    GroupBox2: TGroupBox;
    mmLog: TMemo;
    Splitter2: TSplitter;
    ckAddMarker: TCheckBox;
    StatusBar2: TStatusBar;
    TMSFNCMapsImage1: TTMSFNCMapsImage;
    TMSFNCStaticMap1: TTMSFNCStaticMap;
    TMSFNCGeocoding1: TTMSFNCGeocoding;
    Label7: TLabel;
    edtAddress: TEdit;
    Label8: TLabel;
    spinZoomLevel: TSpinEdit;
    Label21: TLabel;
    cBoxStaticMapType: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure edtAPIKeyStaticMapExit(Sender: TObject);
    procedure cBoxServiceStaticMapChange(Sender: TObject);
    procedure ckHistoryEnabledClick(Sender: TObject);
    procedure TMSFNCGeocoding1GetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure btnDisplayMapImageClick(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure FillcBoxServiceStaticMap;
    procedure FillcBoxServiceGeocoding;
    procedure FillcBoxStaticMapType;
  public
  end;

var
  StaticMapMainView: TStaticMapMainView;

implementation

{$R *.dfm}

procedure TStaticMapMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Self.FillcBoxServiceStaticMap;
  cBoxServiceStaticMap.ItemIndex := Integer(TTMSFNCStaticMapService.smGoogle);

  Self.FillcBoxServiceGeocoding;
  cBoxServiceGeocoding.ItemIndex := Integer(TTMSFNCGeocodingService.gsGoogle);

  Self.FillcBoxStaticMapType;
  cBoxStaticMapType.ItemIndex := Integer(TTMSFNCStaticMapType.mtDefault);

  Self.ConfigBasicMaps;
end;

procedure TStaticMapMainView.FillcBoxServiceStaticMap;
var
  LService: TTMSFNCStaticMapService;
begin
  cBoxServiceStaticMap.Items.Clear;

  for LService := Low(TTMSFNCStaticMapService) to High(TTMSFNCStaticMapService) do
    cBoxServiceStaticMap.Items.Add(GetEnumName(TypeInfo(TTMSFNCStaticMapService), Ord(LService)));
end;

procedure TStaticMapMainView.FillcBoxServiceGeocoding;
var
  LService: TTMSFNCGeocodingService;
begin
  cBoxServiceGeocoding.Items.Clear;

  for LService := Low(TTMSFNCGeocodingService) to High(TTMSFNCGeocodingService) do
    cBoxServiceGeocoding.Items.Add(GetEnumName(TypeInfo(TTMSFNCGeocodingService), Ord(LService)));
end;

procedure TStaticMapMainView.FillcBoxStaticMapType;
var
  LService: TTMSFNCStaticMapType;
begin
  cBoxStaticMapType.Items.Clear;

  for LService := Low(TTMSFNCStaticMapType) to High(TTMSFNCStaticMapType) do
    cBoxStaticMapType.Items.Add(GetEnumName(TypeInfo(TTMSFNCStaticMapType), Ord(LService)));
end;

procedure TStaticMapMainView.cBoxServiceStaticMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TStaticMapMainView.ckHistoryEnabledClick(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TStaticMapMainView.edtAPIKeyStaticMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TStaticMapMainView.ConfigBasicMaps;
begin
  TMSFNCStaticMap1.APIKey := edtAPIKeyStaticMap.Text;
  TMSFNCStaticMap1.Service := TTMSFNCStaticMapService(cBoxServiceStaticMap.ItemIndex);

  TMSFNCGeocoding1.APIKey := edtAPIKeyGeocoding.Text;
  TMSFNCGeocoding1.Service := TTMSFNCGeocodingService(cBoxServiceGeocoding.ItemIndex);
end;

procedure TStaticMapMainView.btnDisplayMapImageClick(Sender: TObject);
begin
  if edtAddress.Text = '' then
  begin
    ShowMessage('Please Fill in the address field');
    edtAddress.SetFocus;
    Exit;
  end;

//  TMSFNCGeocoding1.GeocodingRequests.Clear;
//  TMSFNCGeocoding1.GetGeocoding(edtAddress.Text);

  TMSFNCMapsImage1.URL := TMSFNCStaticMap1.GetStaticMap(edtAddress.Text, TMSFNCMapsImage1.Width,
    TMSFNCMapsImage1.Height, spinZoomLevel.Value, ckAddMarker.Checked, TTMSFNCStaticMapType(cBoxStaticMapType.ItemIndex));

  mmLog.Lines.Add(TMSFNCMapsImage1.URL);
end;

procedure TStaticMapMainView.TMSFNCGeocoding1GetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  TMSFNCMapsImage1.URL := TMSFNCStaticMap1.GetStaticMap(ARequest.Items[0].Coordinate.ToRec, TMSFNCMapsImage1.Width,
    TMSFNCMapsImage1.Height, spinZoomLevel.Value, ckAddMarker.Checked, TTMSFNCStaticMapType(cBoxStaticMapType.ItemIndex));

  mmLog.Lines.Add(TMSFNCMapsImage1.URL);
end;

end.
