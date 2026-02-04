unit TimeZone.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.TypInfo,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Samples.Spin,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
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
  VCL.TMSFNCTimeZone;

type
  TTimeZoneMainView = class(TForm)
    TMSFNCMaps1: TTMSFNCMaps;
    pnTop: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    btnGetTimeZone: TButton;
    edtAddress: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label9: TLabel;
    Shape1: TShape;
    Label10: TLabel;
    Label11: TLabel;
    edtAPIKeyMap: TEdit;
    cBoxServiceMap: TComboBox;
    edtAPIKeyTimeZone: TEdit;
    cBoxServiceTimeZone: TComboBox;
    GroupBox2: TGroupBox;
    mmLog: TMemo;
    TMSFNCGeocoding1: TTMSFNCGeocoding;
    TMSFNCTimeZone1: TTMSFNCTimeZone;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCGeocoding1GetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure TMSFNCMaps1MapClick(Sender: TObject;  AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCTimeZone1GetTimeZone(Sender: TObject; const ARequest: TTMSFNCTimeZoneRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure btnGetTimeZoneClick(Sender: TObject);
    procedure cBoxServiceMapChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxServiceTimeZoneChange(Sender: TObject);
    procedure edtAPIKeyTimeZoneExit(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure FillcBoxServiceMap;
    procedure FillcBoxServiceTimeZone;
  public

  end;

var
  TimeZoneMainView: TTimeZoneMainView;

implementation

{$R *.dfm}

procedure TTimeZoneMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Self.FillcBoxServiceMap;
  cBoxServiceMap.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);

  Self.FillcBoxServiceTimeZone;
  cBoxServiceTimeZone.ItemIndex := Integer(TTMSFNCTimeZoneService.tzsGoogle);

  Self.ConfigBasicMaps;
end;

procedure TTimeZoneMainView.cBoxServiceMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TTimeZoneMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TTimeZoneMainView.cBoxServiceTimeZoneChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TTimeZoneMainView.edtAPIKeyTimeZoneExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TTimeZoneMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxServiceMap.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.EndUpdate;

  TMSFNCGeocoding1.APIKey := edtAPIKeyMap.Text;
  TMSFNCGeocoding1.Service := TTMSFNCGeocodingService(cBoxServiceMap.ItemIndex);

  TMSFNCTimeZone1.APIKey := edtAPIKeyTimeZone.Text;
  TMSFNCTimeZone1.Service := TTMSFNCTimeZoneService(cBoxServiceTimeZone.ItemIndex);
end;

procedure TTimeZoneMainView.FillcBoxServiceMap;
var
  LService: TTMSFNCMapsService;
begin
  cBoxServiceMap.Items.Clear;

  for LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
    cBoxServiceMap.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
end;

procedure TTimeZoneMainView.FillcBoxServiceTimeZone;
var
  LService: TTMSFNCTimeZoneService;
begin
  cBoxServiceTimeZone.Items.Clear;

  for LService := Low(TTMSFNCTimeZoneService) to High(TTMSFNCTimeZoneService) do
    cBoxServiceTimeZone.Items.Add(GetEnumName(TypeInfo(TTMSFNCTimeZoneService), Ord(LService)));
end;

procedure TTimeZoneMainView.btnGetTimeZoneClick(Sender: TObject);
begin
  if edtAddress.Text = '' then
  begin
    ShowMessage('Please Fill in the address field');
    edtAddress.SetFocus;
    Exit;
  end;

  TMSFNCGeocoding1.GeocodingRequests.Clear;
  TMSFNCGeocoding1.GetGeocoding(edtAddress.Text);
  TMSFNCMaps1.Clear;
end;

procedure TTimeZoneMainView.TMSFNCGeocoding1GetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if ARequest.Items.Count <= 0 then
  begin
    ShowMessage('Location not found');
    Exit;
  end;

  TMSFNCMaps1.AddMarker(ARequest.Items[0].Coordinate.toRec);
  TMSFNCTimeZone1.GetTimeZone(ARequest.Items[0].Coordinate.toRec)
end;

procedure TTimeZoneMainView.TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  TMSFNCMaps1.Clear;
  TMSFNCMaps1.AddMarker(AEventData.Coordinate.toRec);
  TMSFNCTimeZone1.GetTimeZone(AEventData.Coordinate.toRec)
end;

procedure TTimeZoneMainView.TMSFNCTimeZone1GetTimeZone(Sender: TObject; const ARequest: TTMSFNCTimeZoneRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
  LTimeZoneItem: TTMSFNCTimeZoneItem;
begin
  if ARequest.Items.Count <= 0 then
  begin
    ShowMessage('No timezone information found');
    Exit;
  end;

  LTimeZoneItem := ARequest.Items[0];
  mmLog.Lines.Clear;
  mmLog.Lines.Add('TimeZone: ' + LTimeZoneItem.TimeZone);
  mmLog.Lines.Add(LTimeZoneItem.Description);
  mmLog.Lines.Add('Offset: ' + LTimeZoneItem.Offset);
  mmLog.Lines.Add('DSTOffset: ' + LTimeZoneItem.DSTOffset);
  mmLog.Lines.Add('Latitude: ' + LTimeZoneItem.Coordinate.Latitude.ToString);
  mmLog.Lines.Add('Longitude: ' + LTimeZoneItem.Coordinate.Longitude.ToString);
end;

end.
