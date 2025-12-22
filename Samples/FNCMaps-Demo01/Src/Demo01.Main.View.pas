unit Demo01.Main.View;

interface

uses
  TypInfo,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
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
  Vcl.StdCtrls,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Menus;

type
  TDemo01MainView = class(TForm)
    Panel1: TPanel;
    TMSFNCMaps1: TTMSFNCMaps;
    GroupBox1: TGroupBox;
    btnAddMarkerDefault: TButton;
    btnAddMarkerC4D: TButton;
    btnAddMarkerCustomized: TButton;
    GroupBox2: TGroupBox;
    btnAddPolygon: TButton;
    btnAddCircle: TButton;
    btnAddRectangles: TButton;
    GroupBox3: TGroupBox;
    btnAddLabel01: TButton;
    btnAddLabel02: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    cBoxService: TComboBox;
    GroupBox5: TGroupBox;
    TrackBarZoom: TTrackBar;
    btnZoomMin: TButton;
    btnZoomMenos: TButton;
    btnZoomMax: TButton;
    btnZoomMais: TButton;
    Label2: TLabel;
    cBoxLanguage: TComboBox;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    CopyLatitudeAndLongitude1: TMenuItem;
    Panel3: TPanel;
    Label3: TLabel;
    edtMarkerC4DLatitude: TEdit;
    Label4: TLabel;
    edtMarkerC4DLongitude: TEdit;
    UsertomarkerC4D1: TMenuItem;
    AddC4DMarkerHere1: TMenuItem;
    Panel4: TPanel;
    btnAddMarkerOk: TButton;
    btnAddMarkerNo: TButton;
    btnClearAllMarker: TButton;
    btnClearAllShapes: TButton;
    btnClearAllLabels: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddMarkerDefaultClick(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure btnAddMarkerCustomizedClick(Sender: TObject);
    procedure btnAddPolygonClick(Sender: TObject);
    procedure btnAddCircleClick(Sender: TObject);
    procedure btnAddRectanglesClick(Sender: TObject);
    procedure btnAddLabel01Click(Sender: TObject);
    procedure btnAddLabel02Click(Sender: TObject);
    procedure btnAddMarkerOkClick(Sender: TObject);
    procedure btnAddMarkerNoClick(Sender: TObject);
    procedure btnAddMarkerC4DClick(Sender: TObject);
    procedure TMSFNCMaps1GetZoomLevel(Sender: TObject; AZoomLevel: Double);
    procedure TMSFNCMaps1ZoomChanged(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TrackBarZoomTracking(Sender: TObject);
    procedure btnZoomMinClick(Sender: TObject);
    procedure btnZoomMenosClick(Sender: TObject);
    procedure btnZoomMaisClick(Sender: TObject);
    procedure btnZoomMaxClick(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
    procedure TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure CopyLatitudeAndLongitude1Click(Sender: TObject);
    procedure UsertomarkerC4D1Click(Sender: TObject);
    procedure AddC4DMarkerHere1Click(Sender: TObject);
    procedure btnClearAllMarkerClick(Sender: TObject);
    procedure btnClearAllShapesClick(Sender: TObject);
    procedure btnClearAllLabelsClick(Sender: TObject);
  private
    FLastLat: Double;
    FLastLon: Double;
    procedure PreencherComboboxServices;
  public
  end;

var
  Demo01MainView: TDemo01MainView;

implementation

{$R *.dfm}

procedure TDemo01MainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Self.PreencherComboboxServices;
  cBoxService.ItemIndex := 6;
  cBoxServiceChange(cBoxService);
end;

procedure TDemo01MainView.PreencherComboboxServices;
begin
  cBoxService.Clear;
  for var LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
  begin
    cBoxService.Items.AddObject(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)), TObject(Ord(LService)));
    //cBoxService.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
  end;
end;

procedure TDemo01MainView.cBoxLanguageChange(Sender: TObject);
begin
  TMSFNCMaps1.Options.Locale := 'pt-BR';
  TMSFNCMaps1.ReInitialize;
end;

procedure TDemo01MainView.TMSFNCMaps1ZoomChanged(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  TMSFNCMaps1.GetZoomLevel;
end;

procedure TDemo01MainView.TMSFNCMaps1GetZoomLevel(Sender: TObject; AZoomLevel: Double);
begin
  TrackBarZoom.Position := Round(AZoomLevel);

  //FZoomLevel := AZoomLevel;
  //TMSFNCMaps1.ExecuteJavaScript('document.getElementById("customRange1").value = ' + TTMSFNCUtils.FloatToStrDot(AZoomLevel));
  //TMSFNCMaps1.ExecuteJavaScript('document.getElementById("customZoom1").innerText = ' + TTMSFNCUtils.FloatToStrDot(Round(AZoomLevel)));
end;

procedure TDemo01MainView.TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  FLastLat := AEventData.Coordinate.Latitude;
  FLastLon := AEventData.Coordinate.Longitude;

  StatusBar1.Panels[0].Text := 'Lat: ' + FLastLat.ToString;
  StatusBar1.Panels[1].Text := 'Lon: ' + FLastLon.ToString;
end;

procedure TDemo01MainView.btnZoomMinClick(Sender: TObject);
begin
  TrackBarZoom.Position := TrackBarZoom.Min;
  TMSFNCMaps1.SetZoomLevel(TrackBarZoom.Position);
end;

procedure TDemo01MainView.AddC4DMarkerHere1Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(FLastLat, FLastLon, 'Marker Here', 'https://code4delphi.com.br/img/c4d-24x24.png');
  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnZoomMenosClick(Sender: TObject);
begin
  TrackBarZoom.Position := TrackBarZoom.Position - 1;
  TMSFNCMaps1.SetZoomLevel(TrackBarZoom.Position);
end;

procedure TDemo01MainView.btnZoomMaisClick(Sender: TObject);
begin
  TrackBarZoom.Position := TrackBarZoom.Position + 1;
  TMSFNCMaps1.SetZoomLevel(TrackBarZoom.Position);
end;

procedure TDemo01MainView.btnZoomMaxClick(Sender: TObject);
begin
  TrackBarZoom.Position := TrackBarZoom.Max;
  TMSFNCMaps1.SetZoomLevel(TrackBarZoom.Position);
end;

procedure TDemo01MainView.TrackBarZoomTracking(Sender: TObject);
begin
  TMSFNCMaps1.SetZoomLevel(TrackBarZoom.Position);
end;

procedure TDemo01MainView.cBoxServiceChange(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;

  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  //d.Service := TTMSFNCDirectionsService(cboDirections.ItemIndex{$IFDEF WEBLIB} + 1 {$ENDIF});
  //g.Service := TTMSFNCGeocodingService(cboGeocoding.ItemIndex);
  TMSFNCMaps1.APIKey := '';

  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.CopyLatitudeAndLongitude1Click(Sender: TObject);
begin
  Clipboard.AsText := Format('%s, %s', [FLastLat.ToString, FLastLon.ToString]);
end;

procedure TDemo01MainView.UsertomarkerC4D1Click(Sender: TObject);
begin
  edtMarkerC4DLatitude.Text := FLastLat.ToString;
  edtMarkerC4DLongitude.Text := FLastLon.ToString;
end;

procedure TDemo01MainView.btnAddMarkerDefaultClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(DefaultCoordinate, 'Marker Default');
  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnAddMarkerOkClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(47.457421, -83.215685, 'Marker OK', 'https://code4delphi.com.br/img/ok.png');
  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnAddMarkerNoClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(52.321560, 75.866337, 'Marker No', 'https://code4delphi.com.br/img/no.png');
  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnAddMarkerC4DClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;

  var LLatitude: Double := StrToFloat(edtMarkerC4DLatitude.Text);
  var LLongitude: Double := StrToFloat(edtMarkerC4DLongitude.Text);
  TMSFNCMaps1.AddMarker(LLatitude, LLongitude, 'Marker C4D', 'https://code4delphi.com.br/img/c4d-24x24.png');

  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnClearAllMarkerClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearMarkers;
end;

procedure TDemo01MainView.btnAddMarkerCustomizedClick(Sender: TObject);
var
  LMapsMarker: TTMSFNCMapsMarker;
begin
  TMSFNCMaps1.BeginUpdate;

  LMapsMarker := TMSFNCMaps1.AddMarker(50.730465, 4.267243);
  LMapsMarker.DefaultIcon.Enabled := True;
  LMapsMarker.DefaultIcon.Fill := clBlue;
  LMapsMarker.DefaultIcon.Size := 50;

  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnAddPolygonClick(Sender: TObject);
var
  LCoordinateRecArray: TTMSFNCMapsCoordinateRecArray;
  LPolygon: TTMSFNCMapsPolygon;
begin
  SetLength(LCoordinateRecArray, 3);
  LCoordinateRecArray[0] := CreateCoordinate(25.789106, -80.226529);
  LCoordinateRecArray[1] := CreateCoordinate(18.4663188, -60.1057427);
  LCoordinateRecArray[2] := CreateCoordinate(32.294887, -64.781380);

  TMSFNCMaps1.BeginUpdate;

  LPolygon := TMSFNCMaps1.AddPolygon(LCoordinateRecArray);
  LPolygon.FillColor := gcOrange;
  LPolygon.FillOpacity := 0.5;
  LPolygon.StrokeColor := gcGreen;
  LPolygon.StrokeWidth := 4;

  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnAddCircleClick(Sender: TObject);
var
  LCoordinateRec: TTMSFNCMapsCoordinateRec;
  LCircle: TTMSFNCMapsCircle;
begin
  TMSFNCMaps1.BeginUpdate;

  LCoordinateRec.Latitude := 12.445835;
  LCoordinateRec.Longitude := -38.857692;

  LCircle := TMSFNCMaps1.AddCircle(LCoordinateRec, 500000);  //500 km
  //LCircle := TMSFNCMaps1.AddCircle(CreateCoordinate(21.620617, -62.394770), 500000);
  LCircle.FillColor := gcBlue;
  LCircle.FillOpacity := 0.5;
  LCircle.StrokeColor := gcBlack;
  LCircle.StrokeWidth := 4;

  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnAddRectanglesClick(Sender: TObject);
var
  LRectangle: TTMSFNCMapsRectangle;
  LBoundsRec: TTMSFNCMapsBoundsRec;
  LNE: TTMSFNCMapsCoordinateRec;
  LSW: TTMSFNCMapsCoordinateRec;
begin
  TMSFNCMaps1.BeginUpdate;

  LNE := CalculateCoordinate(CreateCoordinate(39.562607, -46.135251), 45, 500000);
  LSW := CalculateCoordinate(CreateCoordinate(39.562607, -46.135251), 225, 500000);
  LBoundsRec := CreateBounds(LNE.Latitude, LNE.Longitude, LSW.Latitude, LSW.Longitude);

  LRectangle := TMSFNCMaps1.AddRectangle(LBoundsRec);
  LRectangle.FillColor := gcOrange;
  LRectangle.FillOpacity := 0.5;
  LRectangle.StrokeColor := gcRed;
  LRectangle.StrokeWidth := 4;

  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnClearAllShapesClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearPolygons;
  TMSFNCMaps1.ClearCircles;
  TMSFNCMaps1.ClearRectangles;
end;

procedure TDemo01MainView.btnAddLabel01Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddLabel(50.105082, -118.859648, '<b>C4D</b><br>Code4Delphi');
  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnAddLabel02Click(Sender: TObject);
var
  LMapsLabel: TTMSFNCMapsLabel;
begin
  TMSFNCMaps1.BeginUpdate;
  LMapsLabel := TMSFNCMaps1.AddLabel(57.261558, -14.946536, '<b>C4D</b><br>Code4Delphi', gcWhite, gcDarkslateblue);
  LMapsLabel.Font.Size := 14;
  TMSFNCMaps1.EndUpdate;
end;

procedure TDemo01MainView.btnClearAllLabelsClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearLabels;
end;

end.