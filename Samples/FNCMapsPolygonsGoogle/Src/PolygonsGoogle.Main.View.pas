unit PolygonsGoogle.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Clipbrd,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Menus,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  VCL.TMSFNCGoogleMaps,
  VCL.TMSFNCMapsCommonTypes;

type
  TPolygonsGoogleMainView = class(TForm)
    TMSFNCGoogleMaps1: TTMSFNCGoogleMaps;
    pnTop: TPanel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    Panel1: TPanel;
    btnAddPolygon: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Latitude: TFloatField;
    ClientDataSet1Longitude: TFloatField;
    DataSource1: TDataSource;
    ClientDataSet1Order: TIntegerField;
    StatusBar1: TStatusBar;
    btnClearAllPolygons: TButton;
    gBoxPolylines: TGroupBox;
    btnPolylinesAdd: TButton;
    btnPolylinesClear: TButton;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    btnAddCoordinate: TButton;
    edtCustomizedLatitude: TEdit;
    edtCustomizedLongitude: TEdit;
    ckAddCoordinatesClickingMap: TCheckBox;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btnDeleteCoordinate: TButton;
    btnAddPolygonInMap: TButton;
    ckZoomInCreatedPolygon: TCheckBox;
    btnAddPolygonHoles: TButton;
    procedure FormCreate(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure btnAddPolygonClick(Sender: TObject);
    procedure btnDeleteCoordinateClick(Sender: TObject);
    procedure btnAddCoordinateClick(Sender: TObject);
    procedure btnAddPolygonInMapClick(Sender: TObject);
    procedure btnClearAllPolygonsClick(Sender: TObject);
    procedure btnPolylinesAddClick(Sender: TObject);
    procedure btnPolylinesClearClick(Sender: TObject);
    procedure TMSFNCGoogleMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnAddPolygonHolesClick(Sender: TObject);
    procedure TMSFNCGoogleMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
  private
    FLastLat: Double;
    FLastLon: Double;
    procedure ConfigBasicMaps;
  public

  end;

var
  PolygonsGoogleMainView: TPolygonsGoogleMainView;

implementation

{$R *.dfm}

procedure TPolygonsGoogleMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  Self.ConfigBasicMaps;
end;

procedure TPolygonsGoogleMainView.ConfigBasicMaps;
begin
  TMSFNCGoogleMaps1.BeginUpdate;
  TMSFNCGoogleMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCGoogleMaps1.EndUpdate;
end;

procedure TPolygonsGoogleMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TPolygonsGoogleMainView.TMSFNCGoogleMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
   if ckAddCoordinatesClickingMap.Checked then
  begin
    edtCustomizedLatitude.Text := FLastLat.ToString;
    edtCustomizedLongitude.Text := FLastLon.ToString;
    btnAddCoordinate.Click;
  end;
end;

procedure TPolygonsGoogleMainView.TMSFNCGoogleMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  FLastLat := AEventData.Coordinate.Latitude;
  FLastLon := AEventData.Coordinate.Longitude;

  StatusBar1.Panels[0].Text := 'Lat: ' + FLastLat.ToString;
  StatusBar1.Panels[1].Text := 'Lon: ' + FLastLon.ToString;
end;

procedure TPolygonsGoogleMainView.btnAddCoordinateClick(Sender: TObject);
begin
  ClientDataSet1.Append;
  ClientDataSet1Order.AsInteger := ClientDataSet1.RecordCount + 1;
  ClientDataSet1Latitude.AsFloat := StrToFloatDef(edtCustomizedLatitude.Text, 0);
  ClientDataSet1Longitude.AsFloat := StrToFloatDef(edtCustomizedLongitude.Text, 0);
  ClientDataSet1.Post;
end;

procedure TPolygonsGoogleMainView.btnAddPolygonClick(Sender: TObject);
var
  LCoordinateRecArray: TTMSFNCMapsCoordinateRecArray;
  LPolygon: TTMSFNCMapsPolygon;
begin
  SetLength(LCoordinateRecArray, 3);
  LCoordinateRecArray[0] := CreateCoordinate(25.789106, -80.226529);
  LCoordinateRecArray[1] := CreateCoordinate(18.4663188, -60.1057427);
  LCoordinateRecArray[2] := CreateCoordinate(32.294887, -64.781380);

  TMSFNCGoogleMaps1.BeginUpdate;
  LPolygon := TMSFNCGoogleMaps1.AddPolygon(LCoordinateRecArray);
  LPolygon.FillColor := gcOrange;
  LPolygon.FillOpacity := 0.5;
  LPolygon.StrokeColor := gcGreen;
  LPolygon.StrokeWidth := 4;
  TMSFNCGoogleMaps1.EndUpdate;
end;

procedure TPolygonsGoogleMainView.btnDeleteCoordinateClick(Sender: TObject);
begin
  if ClientDataSet1.IsEmpty then
    raise Exception.Create('Select a record to be deleted');

  ClientDataSet1.Delete;
end;

procedure TPolygonsGoogleMainView.btnAddPolygonInMapClick(Sender: TObject);
var
  LCoordinateRecArray: TTMSFNCMapsCoordinateRecArray;
  LPolygon: TTMSFNCMapsPolygon;
begin
  if ClientDataSet1.IsEmpty then
    raise Exception.Create('Enter the coordinates to continue');

  SetLength(LCoordinateRecArray, ClientDataSet1.RecordCount);

  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin
    LCoordinateRecArray[Pred(ClientDataSet1.RecNo)] := CreateCoordinate(ClientDataSet1Latitude.AsFloat, ClientDataSet1Longitude.AsFloat);
    ClientDataSet1.Next;
  end;

  TMSFNCGoogleMaps1.BeginUpdate;
  LPolygon := TMSFNCGoogleMaps1.AddPolygon(LCoordinateRecArray);
  LPolygon.FillColor := gcRed;
  LPolygon.FillOpacity := 0.1;
  LPolygon.StrokeColor := gcGreen;
  LPolygon.StrokeWidth := 4;
  TMSFNCGoogleMaps1.EndUpdate;

  if ckZoomInCreatedPolygon.Checked then
    TMSFNCGoogleMaps1.ZoomToBounds(LCoordinateRecArray);
end;

procedure TPolygonsGoogleMainView.btnClearAllPolygonsClick(Sender: TObject);
begin
  TMSFNCGoogleMaps1.ClearPolygons;
end;

procedure TPolygonsGoogleMainView.btnPolylinesAddClick(Sender: TObject);
var
  LCoordinateRecArray: TTMSFNCMapsCoordinateRecArray;
  LPolyline: TTMSFNCMapsPolyline;
begin
  SetLength(LCoordinateRecArray, 4);
  LCoordinateRecArray[0] := CreateCoordinate(26.244485, -38.536689);
  LCoordinateRecArray[1] := CreateCoordinate(27.186568, -16.036689);
  LCoordinateRecArray[2] := CreateCoordinate(8.896288, -27.286689);
  LCoordinateRecArray[3] := CreateCoordinate(26.244485,-38.536689); //Closing coordinates are required.

  TMSFNCGoogleMaps1.BeginUpdate;

  LPolyline := TMSFNCGoogleMaps1.AddPolyline(LCoordinateRecArray);
  LPolyline.StrokeColor := gcBlack;
  LPolyline.StrokeWidth := 4;

  TMSFNCGoogleMaps1.EndUpdate;
end;

procedure TPolygonsGoogleMainView.btnPolylinesClearClick(Sender: TObject);
begin
  TMSFNCGoogleMaps1.ClearPolylines;
end;

procedure TPolygonsGoogleMainView.btnAddPolygonHolesClick(Sender: TObject);
var
  LArrPolygon: TTMSFNCMapsCoordinateRecArray;
  LArrHole: TTMSFNCMapsCoordinateRecArray;
  LPolygon: TTMSFNCGoogleMapsPolygon;
begin
  Setlength(LArrPolygon, 3);
  LArrPolygon[0].Latitude := 68.025706;
  LArrPolygon[0].Longitude := -29.123500;
  LArrPolygon[1] := CreateCoordinate(68.352255, -3.459437);
  LArrPolygon[2] := CreateCoordinate(56.875456, -20.510219);


  Setlength(LArrHole, 4);
  LArrHole[0] := CreateCoordinate(66.741679, -25.080532);
  LArrHole[1] := CreateCoordinate(66.741679, -10.314906);
  LArrHole[2] := CreateCoordinate(63.176225, -12.951625);
  LArrHole[3] := CreateCoordinate(63.255438, -23.783657);

  LPolygon := TMSFNCGoogleMaps1.AddPolygon(LArrPolygon);
  LPolygon.FillColor := gcBlue;
  LPolygon.StrokeWidth := 0;
  LPolygon.AddHole(LArrHole);

  TMSFNCGoogleMaps1.ZoomToBounds(LArrPolygon);
end;

end.
