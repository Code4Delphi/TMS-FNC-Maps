unit Markers.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Types,
  TypInfo,
  Clipbrd,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.Menus;

type
  TMarkersMainView = class(TForm)
    pnTop: TPanel;
    TMSFNCMaps1: TTMSFNCMaps;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cBoxService: TComboBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    Label2: TLabel;
    cBoxLanguage: TComboBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    StatusBar1: TStatusBar;
    ckAddMarkerOnClick: TCheckBox;
    GroupBox3: TGroupBox;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    btnRefresh: TButton;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1Id: TStringField;
    ClientDataSet1Latitude: TFloatField;
    ClientDataSet1Longitude: TFloatField;
    ClientDataSet1Title: TStringField;
    ClientDataSet1IconURL: TStringField;
    ClientDataSet1Visible: TBooleanField;
    Splitter1: TSplitter;
    btnDelete: TButton;
    btnVisibleInvisible: TButton;
    GroupBox4: TGroupBox;
    mmLog: TMemo;
    Splitter2: TSplitter;
    Panel1: TPanel;
    ckLogClick: TCheckBox;
    ckLogDblClick: TCheckBox;
    ckLogRightClick: TCheckBox;
    btnClearLog: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtCustomizedIconLatitude: TEdit;
    edtCustomizedIconLongitude: TEdit;
    btnAddMarkerCustomizedIcon: TButton;
    edtCustomizedIconTitle: TEdit;
    edtCustomizedIconURL: TEdit;
    Panel4: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtCustomizedLatitude: TEdit;
    edtCustomizedLongitude: TEdit;
    btnAddMarkerCustomized: TButton;
    edtCustomizedTitle: TEdit;
    cBoxCustomizedColor: TComboBox;
    Label12: TLabel;
    edtCustomizedSize: TEdit;
    PopupMenu1: TPopupMenu;
    CopyLatitudeAndLongitude1: TMenuItem;
    UsertomarkerC4D1: TMenuItem;
    AddC4DMarkerHere1: TMenuItem;
    UsertomarkercustomizedIcon1: TMenuItem;
    ckLogMouseDown: TCheckBox;
    ckLogMouseLeave: TCheckBox;
    ckLogMouseUp: TCheckBox;
    ckLogMouseEnter: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnAddMarkerCustomizedIconClick(Sender: TObject);
    procedure TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1MarkerMouseEnter(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnVisibleInvisibleClick(Sender: TObject);
    procedure TMSFNCMaps1MarkerClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1MarkerDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1MarkerRightClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnClearLogClick(Sender: TObject);
    procedure btnAddMarkerCustomizedClick(Sender: TObject);
    procedure CopyLatitudeAndLongitude1Click(Sender: TObject);
    procedure UsertomarkerC4D1Click(Sender: TObject);
    procedure AddC4DMarkerHere1Click(Sender: TObject);
    procedure UsertomarkercustomizedIcon1Click(Sender: TObject);
    procedure TMSFNCMaps1MarkerMouseDown(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1MarkerMouseLeave(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1MarkerMouseUp(Sender: TObject; AEventData: TTMSFNCMapsEventData);
  private
    FLastLat: Double;
    FLastLon: Double;
    FMarkerCustomized: TTMSFNCMapsMarker;
    procedure ConfigBasicMaps;
    procedure RefreshMarkersInDataSet;
    function GetMarkerBySelected: TTMSFNCMapsMarker;
    procedure AddLogEventMap(AEventData: TTMSFNCMapsEventData);
  public

  end;

var
  MarkersMainView: TMarkersMainView;

implementation

{$R *.dfm}

procedure TMarkersMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);
  Self.ConfigBasicMaps;
end;

procedure TMarkersMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.Options.Locale := copy(cBoxLanguage.Text, 1, 5);
  TMSFNCMaps1.EndUpdate;

  edtAPIKeyMap.Enabled := not (cBoxService.ItemIndex in [6, 8]);
end;

procedure TMarkersMainView.CopyLatitudeAndLongitude1Click(Sender: TObject);
begin
  Clipboard.AsText := Format('%s, %s', [FLastLat.ToString, FLastLon.ToString]);
end;

procedure TMarkersMainView.UsertomarkerC4D1Click(Sender: TObject);
begin
  edtCustomizedLatitude.Text := FLastLat.ToString;
  edtCustomizedLongitude.Text := FLastLon.ToString;
end;

procedure TMarkersMainView.UsertomarkercustomizedIcon1Click(Sender: TObject);
begin
  edtCustomizedIconLatitude.Text := FLastLat.ToString;
  edtCustomizedIconLongitude.Text := FLastLon.ToString;
end;

procedure TMarkersMainView.AddC4DMarkerHere1Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(FLastLat, FLastLon, 'Marker Here', 'https://code4delphi.com.br/img/c4d-24x24.png');
  TMSFNCMaps1.EndUpdate;
end;

procedure TMarkersMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TMarkersMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TMarkersMainView.cBoxLanguageChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
  TMSFNCMaps1.ReInitialize;
end;

procedure TMarkersMainView.Button2Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.ClearMarkers;
  TMSFNCMaps1.EndUpdate;

  Self.RefreshMarkersInDataSet;
  FMarkerCustomized := nil;
end;

procedure TMarkersMainView.Button1Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(DefaultCoordinate, 'Market Default');
  TMSFNCMaps1.EndUpdate;

  Self.RefreshMarkersInDataSet;
end;

procedure TMarkersMainView.Button4Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(56.819249, -42.198792, 'Market OK', 'https://code4delphi.com.br/img/ok.png');
  TMSFNCMaps1.EndUpdate;

  Self.RefreshMarkersInDataSet;
end;

procedure TMarkersMainView.Button5Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(36.819249, -32.198792, 'Market NO', 'https://code4delphi.com.br/img/no.png');
  TMSFNCMaps1.EndUpdate;

  Self.RefreshMarkersInDataSet;
end;

procedure TMarkersMainView.Button6Click(Sender: TObject);
var
  LMarker: TTMSFNCMapsMarker;
begin
  TMSFNCMaps1.BeginUpdate;

  LMarker := TMSFNCMaps1.AddMarker(15.819249, -20.198792);
  LMarker.Title := 'Market Customized';
  LMarker.DefaultIcon.Enabled := True;
  LMarker.DefaultIcon.Fill := clBlue;
  LMarker.DefaultIcon.Size := 50;

  TMSFNCMaps1.EndUpdate;

  Self.RefreshMarkersInDataSet;
end;

procedure TMarkersMainView.btnAddMarkerCustomizedClick(Sender: TObject);
var
  LMarker: TTMSFNCMapsMarker;
begin
  TMSFNCMaps1.BeginUpdate;
  LMarker := TMSFNCMaps1.AddMarker(StrToFloatDef(edtCustomizedLatitude.Text, 0), StrToFloatDef(edtCustomizedLongitude.Text, 0));
  LMarker.Title := edtCustomizedTitle.Text;
  LMarker.DefaultIcon.Enabled := True;
  LMarker.DefaultIcon.Fill := TTMSFNCGraphicsColor(StringToColor(cBoxCustomizedColor.Text));
  LMarker.DefaultIcon.Size := StrToIntDef(edtCustomizedSize.Text, 14);

  if TMSFNCMaps1.Markers.Count > 1 then
    TMSFNCMaps1.ZoomToBounds(TMSFNCMaps1.Markers.ToCoordinateArray)
  else if TMSFNCMaps1.Markers.Count > 0 then
    TMSFNCMaps1.SetCenterCoordinate(TMSFNCMaps1.Markers[0].Coordinate.ToRec);

  TMSFNCMaps1.EndUpdate;

  Self.RefreshMarkersInDataSet;
end;

procedure TMarkersMainView.btnAddMarkerCustomizedIconClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;

  if not Assigned(FMarkerCustomized) then
    FMarkerCustomized := TMSFNCMaps1.Markers.Add;

  FMarkerCustomized.Latitude := StrToFloatDef(edtCustomizedIconLatitude.Text, 0);
  FMarkerCustomized.Longitude := StrToFloatDef(edtCustomizedIconLongitude.Text, 0);
  FMarkerCustomized.Title := edtCustomizedIconTitle.Text;
  FMarkerCustomized.IconURL := edtCustomizedIconURL.Text;

  TMSFNCMaps1.EndUpdate;

  Self.RefreshMarkersInDataSet;
end;
procedure TMarkersMainView.TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  FLastLat := AEventData.Coordinate.Latitude;
  FLastLon := AEventData.Coordinate.Longitude;

  StatusBar1.Panels[0].Text := 'Lat: ' + FLastLat.ToString;
  StatusBar1.Panels[1].Text := 'Lon: ' + FLastLon.ToString;
end;

procedure TMarkersMainView.TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckAddMarkerOnClick.Checked then
  begin
    TMSFNCMaps1.BeginUpdate;
    TMSFNCMaps1.AddMarker(FLastLat, FLastLon, 'Market Home', 'https://code4delphi.com.br/img/home.png');
    TMSFNCMaps1.EndUpdate;

    Self.RefreshMarkersInDataSet;
  end;
end;

procedure TMarkersMainView.btnRefreshClick(Sender: TObject);
begin
  Self.RefreshMarkersInDataSet;
end;

procedure TMarkersMainView.RefreshMarkersInDataSet;
var
  i: Integer;
  LMarker: TTMSFNCMapsMarker;
begin
  ClientDataSet1.EmptyDataSet;
  ClientDataSet1.Open;

  if TMSFNCMaps1.Markers.Count <= 0 then
    Exit;

  for i := 0 to Pred(TMSFNCMaps1.Markers.Count) do
  begin
    LMarker := TMSFNCMaps1.Markers.Items[i];

    ClientDataSet1.Append;
    ClientDataSet1Id.AsString := LMarker.ID;
    ClientDataSet1Latitude.AsFloat := LMarker.Latitude;
    ClientDataSet1Longitude.AsFloat := LMarker.Longitude;
    ClientDataSet1Title.AsString := LMarker.Title;
    ClientDataSet1IconURL.AsString := LMarker.IconURL;
    ClientDataSet1Visible.AsBoolean := LMarker.Visible;
    ClientDataSet1.Post;
  end;
end;

function TMarkersMainView.GetMarkerBySelected: TTMSFNCMapsMarker;
var
  LMarker: TTMSFNCMapsMarker;
begin
  if ClientDataSet1.IsEmpty then
    raise Exception.Create('Select an item to be deleted');

  LMarker := TMSFNCMaps1.Markers.ItemByID[ClientDataSet1Id.AsString];
  if LMarker = nil then
    raise Exception.Create('Marker not found');

  Result := LMarker;
end;

procedure TMarkersMainView.btnDeleteClick(Sender: TObject);
var
  LMarker: TTMSFNCMapsMarker;
begin
  LMarker := Self.GetMarkerBySelected;

  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Markers.Delete(LMarker.Index);
  TMSFNCMaps1.EndUpdate;

  if LMarker = FMarkerCustomized then
    FMarkerCustomized := nil;

  Self.RefreshMarkersInDataSet;
end;

procedure TMarkersMainView.btnVisibleInvisibleClick(Sender: TObject);
var
  LMarker: TTMSFNCMapsMarker;
begin
  LMarker := Self.GetMarkerBySelected;

  TMSFNCMaps1.BeginUpdate;
  LMarker.Visible := not LMarker.Visible;
  TMSFNCMaps1.EndUpdate;

  ClientDataSet1.Edit;
  ClientDataSet1Visible.AsBoolean := LMarker.Visible;
  ClientDataSet1.Post;
end;

procedure TMarkersMainView.btnClearLogClick(Sender: TObject);
begin
  mmLog.Lines.Clear;
end;

procedure TMarkersMainView.TMSFNCMaps1MarkerClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogClick.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TMarkersMainView.TMSFNCMaps1MarkerDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogDblClick.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TMarkersMainView.TMSFNCMaps1MarkerRightClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogRightClick.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TMarkersMainView.TMSFNCMaps1MarkerMouseEnter(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseEnter.Checked then
    Self.AddLogEventMap(AEventData);

  if not ClientDataSet1.IsEmpty then
    ClientDataSet1.Locate('Id', AEventData.Marker.ID, [loCaseInsensitive]);
end;

procedure TMarkersMainView.TMSFNCMaps1MarkerMouseDown(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseDown.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TMarkersMainView.TMSFNCMaps1MarkerMouseLeave(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseLeave.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TMarkersMainView.TMSFNCMaps1MarkerMouseUp(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseUp.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TMarkersMainView.AddLogEventMap(AEventData: TTMSFNCMapsEventData);
begin
  mmLog.Lines.Add('##################');
  mmLog.Lines.Add('EventName: ' + AEventData.EventName);
  mmLog.Lines.Add('ID: ' + AEventData.ID);
  mmLog.Lines.Add('Coordinate.Latitude: ' + AEventData.Coordinate.Latitude.ToString);
  mmLog.Lines.Add('Coordinate.Longitude: ' + AEventData.Coordinate.Longitude.ToString);
  mmLog.Lines.Add(Format('X / Y: %s / %s', [AEventData.X.ToString, AEventData.Y.ToString]));
  mmLog.Lines.Add('');
  mmLog.Lines.Add('Marker.ID: ' + AEventData.Marker.ID);
  mmLog.Lines.Add('Marker.Latitude: ' + AEventData.Marker.Latitude.ToString);
  mmLog.Lines.Add('Marker.Longitude: ' + AEventData.Marker.Longitude.ToString);
  mmLog.Lines.Add('Marker.Title: ' + AEventData.Marker.Title);
  mmLog.Lines.Add('Marker.IconURL: ' + AEventData.Marker.IconURL);
  mmLog.Lines.Add('Marker.Visible: ' + AEventData.Marker.Visible.ToString(TUseBoolStrs.True));
  mmLog.Lines.Add('');
  mmLog.Lines.Add('Marker.DefaultIcon.Enabled: ' + AEventData.Marker.DefaultIcon.Enabled.ToString(TUseBoolStrs.True));
  mmLog.Lines.Add('Marker.DefaultIcon.Fill: ' + ColorToString(AEventData.Marker.DefaultIcon.Fill));
  mmLog.Lines.Add('Marker.DefaultIcon.Size: ' + AEventData.Marker.DefaultIcon.Size.ToString);
  mmLog.Lines.Add('');
end;

end.
