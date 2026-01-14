unit Places.Main.View;

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
  VCL.TMSFNCGeocoding, VCL.TMSFNCPlaces;

type
  TPlacesMainView = class(TForm)
    pnTop: TPanel;
    GroupBox3: TGroupBox;
    StatusBar1: TStatusBar;
    btnClearAllMarkers: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    Splitter1: TSplitter;
    Label2: TLabel;
    cBoxService: TComboBox;
    btnAddMarker: TButton;
    Label3: TLabel;
    edtSearch: TEdit;
    TMSFNCMaps1: TTMSFNCMaps;
    ListBoxSearch: TListBox;
    ckZoomInCreated: TCheckBox;
    TMSFNCGeocoding1: TTMSFNCGeocoding;
    TMSFNCPlaces1: TTMSFNCPlaces;
    procedure FormCreate(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
    procedure btnClearAllMarkersClick(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure btnAddMarkerClick(Sender: TObject);
    procedure TMSFNCPlaces1GetAutoComplete(Sender: TObject; const ARequest: TTMSFNCPlacesRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBoxSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBoxSearchDblClick(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure ZoomInCoordinateRec(const ACoordinateRec: TTMSFNCMapsCoordinateRec);
    procedure ProcessItemSelectListBox;
  public
  end;

var
  PlacesMainView: TPlacesMainView;

implementation

{$R *.dfm}

procedure TPlacesMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msGoogleMaps);
  Self.ConfigBasicMaps;
end;

procedure TPlacesMainView.ListBoxSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Self.ProcessItemSelectListBox;
end;

procedure TPlacesMainView.ListBoxSearchDblClick(Sender: TObject);
begin
  Self.ProcessItemSelectListBox;
end;

procedure TPlacesMainView.ProcessItemSelectListBox;
begin
  if ListBoxSearch.ItemIndex < 0 then
    Exit;

  var LText := ListBoxSearch.Items[ListBoxSearch.ItemIndex].Trim;
  if LText.IsEmpty then
    Exit;

  edtSearch.Text := LText;
  edtSearch.SetFocus;
end;

procedure TPlacesMainView.cBoxLanguageChange(Sender: TObject);
begin
  TMSFNCMaps1.Options.Locale := 'pt-BR';
  TMSFNCMaps1.ReInitialize;
end;

procedure TPlacesMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TPlacesMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TPlacesMainView.edtSearchChange(Sender: TObject);
begin
  TMSFNCPlaces1.GetAutoComplete(edtSearch.Text);
end;

procedure TPlacesMainView.edtSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DOWN then
    ListBoxSearch.SetFocus;
end;

procedure TPlacesMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;

  TMSFNCPlaces1.APIKey := edtAPIKeyMap.Text;
  TMSFNCPlaces1.Service := psGoogle;

  TMSFNCGeocoding1.APIKey := edtAPIKeyMap.Text;
  TMSFNCGeocoding1.Service := TTMSFNCGeocodingService(cBoxService.ItemIndex);
  TMSFNCMaps1.EndUpdate;
end;

procedure TPlacesMainView.btnClearAllMarkersClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearMarkers;
end;

procedure TPlacesMainView.ZoomInCoordinateRec(const ACoordinateRec: TTMSFNCMapsCoordinateRec);
begin
  if not ckZoomInCreated.Checked then
    Exit;

  TMSFNCMaps1.ZoomToBounds(ACoordinateRec, ACoordinateRec);
  TMSFNCMaps1.SetZoomLevel(18);
end;

procedure TPlacesMainView.btnAddMarkerClick(Sender: TObject);
begin
  TMSFNCGeocoding1.GetGeocoding(edtSearch.Text,
    procedure(const ARequest: TTMSFNCGeocodingRequest; const ARequestResult: TTMSFNCCloudBaseRequestResult)
    begin
      var LCoordinateRec := ARequest.Items[0].Coordinate.ToRec;
      TMSFNCMaps1.SetCenterCoordinate(LCoordinateRec);
      TMSFNCMaps1.AddMarker(LCoordinateRec);

      Self.ZoomInCoordinateRec(LCoordinateRec);
    end);
end;

procedure TPlacesMainView.TMSFNCPlaces1GetAutoComplete(Sender: TObject; const ARequest: TTMSFNCPlacesRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  ListBoxSearch.Items.Clear;
  for var i := 0 to Pred(ARequest.Items.Count) do
    ListBoxSearch.Items.Add(ARequest.Items[I].Address);
end;

end.
