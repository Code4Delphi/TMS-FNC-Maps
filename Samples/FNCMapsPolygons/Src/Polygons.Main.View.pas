unit Polygons.Main.View;

interface

uses
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
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Menus;

type
  TPolygonsMainView = class(TForm)
    pnTop: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    cBoxService: TComboBox;
    edtAPIKeyMap: TEdit;
    Panel1: TPanel;
    TMSFNCMaps1: TTMSFNCMaps;
    btnAddPolygon: TButton;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    btnAdd: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Latitude: TFloatField;
    ClientDataSet1Longitude: TFloatField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ClientDataSet1Order: TIntegerField;
    Label8: TLabel;
    Label9: TLabel;
    edtCustomizedLatitude: TEdit;
    edtCustomizedLongitude: TEdit;
    PopupMenu1: TPopupMenu;
    CopyLatitudeAndLongitude1: TMenuItem;
    AddToPolygonCustomized1: TMenuItem;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    btnDelete: TButton;
    btnAddPolygonInMap: TButton;
    N1: TMenuItem;
    btnClearAllPolygons: TButton;
    gBoxPolylines: TGroupBox;
    btnPolylinesAdd: TButton;
    btnPolylinesClear: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure btnAddPolygonClick(Sender: TObject);
    procedure CopyLatitudeAndLongitude1Click(Sender: TObject);
    procedure AddToPolygonCustomized1Click(Sender: TObject);
    procedure TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnAddPolygonInMapClick(Sender: TObject);
    procedure btnClearAllPolygonsClick(Sender: TObject);
    procedure btnPolylinesAddClick(Sender: TObject);
    procedure btnPolylinesClearClick(Sender: TObject);
  private
    FLastLat: Double;
    FLastLon: Double;
    procedure ConfigBasicMaps;
  public

  end;

var
  PolygonsMainView: TPolygonsMainView;

implementation

{$R *.dfm}

procedure TPolygonsMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);
  Self.ConfigBasicMaps;
end;

procedure TPolygonsMainView.TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  FLastLat := AEventData.Coordinate.Latitude;
  FLastLon := AEventData.Coordinate.Longitude;

  StatusBar1.Panels[0].Text := 'Lat: ' + FLastLat.ToString;
  StatusBar1.Panels[1].Text := 'Lon: ' + FLastLon.ToString;
end;

procedure TPolygonsMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.EndUpdate;

  edtAPIKeyMap.Enabled := not (cBoxService.ItemIndex in [6, 8]);
end;

procedure TPolygonsMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TPolygonsMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TPolygonsMainView.btnAddPolygonClick(Sender: TObject);
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

procedure TPolygonsMainView.CopyLatitudeAndLongitude1Click(Sender: TObject);
begin
  Clipboard.AsText := Format('%s, %s', [FLastLat.ToString, FLastLon.ToString]);
end;

procedure TPolygonsMainView.AddToPolygonCustomized1Click(Sender: TObject);
begin
  edtCustomizedLatitude.Text := FLastLat.ToString;
  edtCustomizedLongitude.Text := FLastLon.ToString;
  btnAdd.Click;
end;

procedure TPolygonsMainView.btnAddClick(Sender: TObject);
begin
  ClientDataSet1.Append;
  ClientDataSet1Order.AsInteger := ClientDataSet1.RecordCount + 1;
  ClientDataSet1Latitude.AsFloat := StrToFloatDef(edtCustomizedLatitude.Text, 0);
  ClientDataSet1Longitude.AsFloat := StrToFloatDef(edtCustomizedLongitude.Text, 0);
  ClientDataSet1.Post;
end;

procedure TPolygonsMainView.btnDeleteClick(Sender: TObject);
begin
  if ClientDataSet1.IsEmpty then
    raise Exception.Create('Select a record to be deleted');

  ClientDataSet1.Delete;
end;

procedure TPolygonsMainView.btnAddPolygonInMapClick(Sender: TObject);
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

  TMSFNCMaps1.BeginUpdate;
  LPolygon := TMSFNCMaps1.AddPolygon(LCoordinateRecArray);
  LPolygon.FillColor := gcRed;
  LPolygon.FillOpacity := 0.1;
  LPolygon.StrokeColor := gcGreen;
  LPolygon.StrokeWidth := 4;
  TMSFNCMaps1.EndUpdate;
end;

procedure TPolygonsMainView.btnClearAllPolygonsClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearPolygons;
end;

procedure TPolygonsMainView.btnPolylinesAddClick(Sender: TObject);
var
  LCoordinateRecArray: TTMSFNCMapsCoordinateRecArray;
  LPolyline: TTMSFNCMapsPolyline;
begin
  SetLength(LCoordinateRecArray, 4);
  LCoordinateRecArray[0] := CreateCoordinate(25.789106, -80.226529);
  LCoordinateRecArray[1] := CreateCoordinate(18.4663188, -60.1057427);
  LCoordinateRecArray[2] := CreateCoordinate(32.294887, -64.781380);
  LCoordinateRecArray[3] := CreateCoordinate(25.789106, -80.226529); //Closing coordinates are required.

  TMSFNCMaps1.BeginUpdate;

  LPolyline := TMSFNCMaps1.AddPolyline(LCoordinateRecArray);
  LPolyline.StrokeColor := gcBlack;
  LPolyline.StrokeWidth := 4;

  TMSFNCMaps1.EndUpdate;
end;

procedure TPolygonsMainView.btnPolylinesClearClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearPolylines;
end;

end.
