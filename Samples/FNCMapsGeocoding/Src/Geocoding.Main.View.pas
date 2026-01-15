unit Geocoding.Main.View;

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
  VCL.TMSFNCGeocoding;

type
  TGeocodingMainView = class(TForm)
    pnTop: TPanel;
    GroupBox3: TGroupBox;
    StatusBar1: TStatusBar;
    btnClearAllMarkers: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    Splitter1: TSplitter;
    TMSFNCGeocoding1: TTMSFNCGeocoding;
    Label2: TLabel;
    cBoxService: TComboBox;
    btnOnGetGeocodingEvent: TButton;
    Button2: TButton;
    Label3: TLabel;
    edtAddress: TEdit;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    mmLog: TMemo;
    ckGetReverseGeocodingByClickingMap: TCheckBox;
    ckZoomInCreated: TCheckBox;
    TMSFNCMaps1: TTMSFNCMaps;
    procedure FormCreate(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
    procedure btnClearAllMarkersClick(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure btnOnGetGeocodingEventClick(Sender: TObject);
    procedure TMSFNCGeocoding1GetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure Button2Click(Sender: TObject);
    procedure TMSFNCGeocoding1GetReverseGeocodingResult(Sender: TObject; const AResult: TTMSFNCGeocodingRequest);
    procedure TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
  private
    procedure ConfigBasicMaps;
    procedure ZoomInCoordinateRec(const ACoordinateRec: TTMSFNCMapsCoordinateRec);
  public
  end;

var
  GeocodingMainView: TGeocodingMainView;

implementation

{$R *.dfm}

procedure TGeocodingMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msGoogleMaps);
  Self.ConfigBasicMaps;
end;

procedure TGeocodingMainView.cBoxLanguageChange(Sender: TObject);
begin
  TMSFNCMaps1.Options.Locale := 'pt-BR';
  TMSFNCMaps1.ReInitialize;
end;

procedure TGeocodingMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TGeocodingMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TGeocodingMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCGeocoding1.APIKey := edtAPIKeyMap.Text;
  TMSFNCGeocoding1.Service := TTMSFNCGeocodingService(cBoxService.ItemIndex);
  TMSFNCMaps1.EndUpdate;
end;

procedure TGeocodingMainView.btnClearAllMarkersClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearMarkers;
end;

procedure TGeocodingMainView.TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckGetReverseGeocodingByClickingMap.Checked then
    TMSFNCGeocoding1.GetReverseGeocoding(AEventData.Coordinate.ToRec);
end;

procedure TGeocodingMainView.TMSFNCGeocoding1GetReverseGeocodingResult(Sender: TObject; const AResult: TTMSFNCGeocodingRequest);
begin
  if AResult.Items.Count > 0 then
  begin
    mmLog.Lines.Clear;
    mmLog.Lines.Add('Address: ' + AResult.Items[0].Address);
    mmLog.Lines.Add('District: ' + AResult.Items[0].District);
    mmLog.Lines.Add('Province: ' + AResult.Items[0].Province);
    mmLog.Lines.Add('ProvinceCode: ' + AResult.Items[0].ProvinceCode);
    mmLog.Lines.Add('Street: ' + AResult.Items[0].Street);
    mmLog.Lines.Add('StreetName: ' + AResult.Items[0].StreetName);
    mmLog.Lines.Add('StreetNumber: ' + AResult.Items[0].StreetNumber);
    mmLog.Lines.Add('City: ' + AResult.Items[0].City);
    mmLog.Lines.Add('PostalCode: ' + AResult.Items[0].PostalCode);
    mmLog.Lines.Add('Region: ' + AResult.Items[0].Region);
    mmLog.Lines.Add('RegionCode: ' + AResult.Items[0].RegionCode);
    mmLog.Lines.Add('Country: ' + AResult.Items[0].Country);
    mmLog.Lines.Add('CountryCode: ' + AResult.Items[0].CountryCode);
    mmLog.Lines.Add('Intersection: ' + AResult.Items[0].Intersection);
  end;
end;

procedure TGeocodingMainView.btnOnGetGeocodingEventClick(Sender: TObject);
begin
  TMSFNCGeocoding1.GetGeocoding(edtAddress.Text, nil, 'origin');
  TMSFNCGeocoding1.GetGeocoding('Philadelphia', nil, 'destination');
end;

procedure TGeocodingMainView.TMSFNCGeocoding1GetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
 LGeocodingItem: TTMSFNCGeocodingItem;
 LStartAddress: TTMSFNCMapsCoordinateRec;
begin
  for var i := 0 to Pred(ARequest.Items.Count) do
  begin
    LGeocodingItem := ARequest.Items[I];

    if ARequest.ID = 'origin' then
    begin
      LStartAddress := LGeocodingItem.Coordinate.ToRec;
      TMSFNCMaps1.SetCenterCoordinate(LStartAddress);
      TMSFNCMaps1.AddMarker(LStartAddress);

      Self.ZoomInCoordinateRec(LStartAddress);
    end
    else if ARequest.ID = 'destination' then
    begin
      var LEndAddress := LGeocodingItem.Coordinate.ToRec;
      TMSFNCMaps1.AddMarker(LEndAddress);
    end;
  end;
end;

procedure TGeocodingMainView.ZoomInCoordinateRec(const ACoordinateRec: TTMSFNCMapsCoordinateRec);
begin
  if not ckZoomInCreated.Checked then
    Exit;

  TMSFNCMaps1.ZoomToBounds(ACoordinateRec, ACoordinateRec);
  TMSFNCMaps1.SetZoomLevel(18);
end;

procedure TGeocodingMainView.Button2Click(Sender: TObject);
var
 LStartAddress: TTMSFNCMapsCoordinateRec;
begin
  TMSFNCGeocoding1.GetGeocoding(edtAddress.Text,
    procedure(const ARequest: TTMSFNCGeocodingRequest; const ARequestResult: TTMSFNCCloudBaseRequestResult)
    begin
      LStartAddress := ARequest.Items[0].Coordinate.ToRec;
      TMSFNCMaps1.SetCenterCoordinate(LStartAddress);
      TMSFNCMaps1.AddMarker(LStartAddress);

      Self.ZoomInCoordinateRec(LStartAddress);
    end);
end;

end.
