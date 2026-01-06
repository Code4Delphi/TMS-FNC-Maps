unit Rectangles.Main.View;

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
  Vcl.Menus,
  Vcl.Imaging.pngimage;

type
  TRectanglesMainView = class(TForm)
    TMSFNCMaps1: TTMSFNCMaps;
    pnTop: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    cBoxService: TComboBox;
    edtAPIKeyMap: TEdit;
    Panel1: TPanel;
    btnAddRectangles: TButton;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    CopyLatitudeAndLongitude1: TMenuItem;
    AddToPolygonCustomized1: TMenuItem;
    StatusBar1: TStatusBar;
    N1: TMenuItem;
    btnClearAllRectangles: TButton;
    GroupBox3: TGroupBox;
    ckAddRectanglesClickingMap: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    cBoxFillColor: TComboBox;
    edtFillOpacity: TEdit;
    Label2: TLabel;
    lbStrokeWidth: TLabel;
    cBoxStrokeColor: TComboBox;
    edtStrokeWidth: TEdit;
    Label3: TLabel;
    edtDistance: TEdit;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Id: TStringField;
    ClientDataSet1Visible: TBooleanField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnRefresh: TButton;
    btnDelete: TButton;
    btnVisibleInvisible: TButton;
    GroupBox4: TGroupBox;
    mmLog: TMemo;
    Panel3: TPanel;
    ckLogClick: TCheckBox;
    ckLogDblClick: TCheckBox;
    btnClearLog: TButton;
    ckLogMouseDown: TCheckBox;
    ckLogMouseLeave: TCheckBox;
    ckLogMouseUp: TCheckBox;
    ckLogMouseEnter: TCheckBox;
    btnAddPolygon: TButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    ClientDataSet1NorthEast_Latitude: TFloatField;
    ClientDataSet1NorthEast_Longitude: TFloatField;
    ClientDataSet1SouthWest_Latitude: TFloatField;
    ClientDataSet1SouthWest_Longitude: TFloatField;
    Label4: TLabel;
    edtNorthEastDegrees: TEdit;
    Label6: TLabel;
    edtSouthWestDegrees: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure btnAddRectanglesClick(Sender: TObject);
    procedure CopyLatitudeAndLongitude1Click(Sender: TObject);
    procedure TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnClearAllRectanglesClick(Sender: TObject);
    procedure TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnVisibleInvisibleClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure TMSFNCMaps1PolyElementClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnClearLogClick(Sender: TObject);
    procedure btnAddPolygonClick(Sender: TObject);
    procedure TMSFNCMaps1PolyElementDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1PolyElementMouseDown(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1PolyElementMouseEnter(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1PolyElementMouseLeave(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1PolyElementMouseUp(Sender: TObject; AEventData: TTMSFNCMapsEventData);
  private
    FLastLat: Double;
    FLastLon: Double;
    procedure ConfigBasicMaps;
    procedure RefreshRectanglesInDataSet;
    function GetRectangleBySelected: TTMSFNCMapsRectangle;
    procedure AddLogEventMap(AEventData: TTMSFNCMapsEventData);
  public

  end;

var
  RectanglesMainView: TRectanglesMainView;

implementation

{$R *.dfm}

procedure TRectanglesMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);
  Self.ConfigBasicMaps;
end;

procedure TRectanglesMainView.TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  FLastLat := AEventData.Coordinate.Latitude;
  FLastLon := AEventData.Coordinate.Longitude;

  StatusBar1.Panels[0].Text := 'Lat: ' + FLastLat.ToString;
  StatusBar1.Panels[1].Text := 'Lon: ' + FLastLon.ToString;
end;

procedure TRectanglesMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.EndUpdate;

  edtAPIKeyMap.Enabled := not (cBoxService.ItemIndex in [6, 8]);
end;

procedure TRectanglesMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TRectanglesMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;
procedure TRectanglesMainView.btnAddRectanglesClick(Sender: TObject);
var
  LCenterCoordinate: TTMSFNCMapsCoordinateRec;
  LNorthEast: TTMSFNCMapsCoordinateRec; //NORDESTE (Norte Leste) / CANTO SUPERIOR DIREITO / UPPER RIGHT CORNER
  LSouthWest: TTMSFNCMapsCoordinateRec; //SUDOESTE (Sul Oeste) / CANTO INFERIOR ESQUERDO /BOTTOM LEFT CORNER
  LBoundsRec: TTMSFNCMapsBoundsRec;
  LRectangle: TTMSFNCMapsRectangle;
begin
  LCenterCoordinate := CreateCoordinate(39.562607, -46.135251);
  LNorthEast := CalculateCoordinate(LCenterCoordinate, 45, 500000); //45 degrees | 500000 meter = 500KM
  LSouthWest := CalculateCoordinate(LCenterCoordinate, 225, 500000); //225 degrees | 500000 meter = 500KM
  LBoundsRec := CreateBounds(LNorthEast.Latitude, LNorthEast.Longitude, LSouthWest.Latitude, LSouthWest.Longitude);

  TMSFNCMaps1.BeginUpdate;
  LRectangle := TMSFNCMaps1.AddRectangle(LBoundsRec);
  LRectangle.FillColor := gcOrange;
  LRectangle.FillOpacity := 0.5;
  LRectangle.StrokeColor := gcRed;
  LRectangle.StrokeWidth := 4;
  TMSFNCMaps1.EndUpdate;

  Self.RefreshRectanglesInDataSet;
end;

procedure TRectanglesMainView.TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
var
  LCenterCoordinate: TTMSFNCMapsCoordinateRec;
  LNorthEast: TTMSFNCMapsCoordinateRec; //NORDESTE (Norte Leste) / CANTO SUPERIOR DIREITO / UPPER RIGHT CORNER
  LSouthWest: TTMSFNCMapsCoordinateRec; //SUDOESTE (Sul Oeste) / CANTO INFERIOR ESQUERDO /BOTTOM LEFT CORNER
  LBoundsRec: TTMSFNCMapsBoundsRec;
  LRectangle: TTMSFNCMapsRectangle;
  LDistance: Double;
  LNorthEastDegrees: Double;
  LSouthWestDegrees: Double;
begin
  if ckAddRectanglesClickingMap.Checked then
  begin
    LCenterCoordinate := CreateCoordinate(FLastLat, FLastLon);
    LDistance := StrToFloatDef(edtDistance.Text, 500000);
    LNorthEastDegrees := StrToFloatDef(edtNorthEastDegrees.Text, 45);
    LSouthWestDegrees := StrToFloatDef(edtSouthWestDegrees.Text, 225);

    LNorthEast := CalculateCoordinate(LCenterCoordinate, LNorthEastDegrees, LDistance);
    LSouthWest := CalculateCoordinate(LCenterCoordinate, LSouthWestDegrees, LDistance);
    LBoundsRec := CreateBounds(LNorthEast.Latitude, LNorthEast.Longitude, LSouthWest.Latitude, LSouthWest.Longitude);

    TMSFNCMaps1.BeginUpdate;
    LRectangle := TMSFNCMaps1.AddRectangle(LBoundsRec);
    LRectangle.FillColor := TTMSFNCGraphicsColor(StringToColor(cBoxFillColor.Text));
    LRectangle.FillOpacity := StrToFloatDef(edtFillOpacity.Text, 0.2);
    LRectangle.StrokeColor := TTMSFNCGraphicsColor(StringToColor(cBoxStrokeColor.Text));
    LRectangle.StrokeWidth := StrToIntDef(edtStrokeWidth.Text, 2);
    TMSFNCMaps1.EndUpdate;

    Self.RefreshRectanglesInDataSet;
  end;
end;

procedure TRectanglesMainView.RefreshRectanglesInDataSet;
var
  i: Integer;
  LRectangle: TTMSFNCMapsRectangle;
begin
  ClientDataSet1.EmptyDataSet;
  ClientDataSet1.Open;

  if TMSFNCMaps1.Rectangles.Count <= 0 then
    Exit;

  for i := 0 to Pred(TMSFNCMaps1.Rectangles.Count) do
  begin
    LRectangle := TMSFNCMaps1.Rectangles.Items[i];

    ClientDataSet1.Append;
    ClientDataSet1Id.AsString := LRectangle.ID;
    ClientDataSet1NorthEast_Latitude.AsFloat := LRectangle.Bounds.NorthEast.Latitude;
    ClientDataSet1NorthEast_Longitude.AsFloat := LRectangle.Bounds.NorthEast.Longitude;
    ClientDataSet1SouthWest_Latitude.AsFloat := LRectangle.Bounds.SouthWest.Latitude;
    ClientDataSet1SouthWest_Longitude.AsFloat := LRectangle.Bounds.SouthWest.Longitude;
    ClientDataSet1Visible.AsBoolean := LRectangle.Visible;
    ClientDataSet1.Post;
  end;
end;

procedure TRectanglesMainView.CopyLatitudeAndLongitude1Click(Sender: TObject);
begin
  Clipboard.AsText := Format('%s, %s', [FLastLat.ToString, FLastLon.ToString]);
end;

procedure TRectanglesMainView.btnRefreshClick(Sender: TObject);
begin
  Self.RefreshRectanglesInDataSet;
end;

procedure TRectanglesMainView.btnDeleteClick(Sender: TObject);
var
  LRectangle: TTMSFNCMapsRectangle;
begin
  LRectangle := Self.GetRectangleBySelected;

  if LRectangle = nil then
    Exit;

  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Rectangles.Delete(LRectangle.Index);
  TMSFNCMaps1.EndUpdate;

  Self.RefreshRectanglesInDataSet;
end;

procedure TRectanglesMainView.btnVisibleInvisibleClick(Sender: TObject);
var
  LRectangle: TTMSFNCMapsRectangle;
begin
  LRectangle := Self.GetRectangleBySelected;

  if LRectangle = nil then
    Exit;

  TMSFNCMaps1.BeginUpdate;
  LRectangle.Visible := not LRectangle.Visible;
  TMSFNCMaps1.EndUpdate;

  ClientDataSet1.Edit;
  ClientDataSet1Visible.AsBoolean := LRectangle.Visible;
  ClientDataSet1.Post;
end;

function TRectanglesMainView.GetRectangleBySelected: TTMSFNCMapsRectangle;
var
  LPolyElement : TTMSFNCMapsPolyElement;
  LRectangle: TTMSFNCMapsRectangle;
begin
  Result := nil;

  if ClientDataSet1.IsEmpty then
    raise Exception.Create('Select an item to be deleted');

  LPolyElement := TMSFNCMaps1.Rectangles.ItemByID[ClientDataSet1Id.AsString];
  if LPolyElement.ClassName <> TTMSFNCMapsRectangle.ClassName then
    Exit;

  LRectangle := TTMSFNCMapsRectangle(TMSFNCMaps1.Rectangles.ItemByID[ClientDataSet1Id.AsString]);
  if LRectangle = nil then
    raise Exception.Create('Rectangle not found');

  Result := LRectangle;
end;

procedure TRectanglesMainView.btnClearAllRectanglesClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearRectangles;

  Self.RefreshRectanglesInDataSet;
end;

procedure TRectanglesMainView.btnClearLogClick(Sender: TObject);
begin
  mmLog.Lines.Clear;
end;

procedure TRectanglesMainView.btnAddPolygonClick(Sender: TObject);
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


procedure TRectanglesMainView.TMSFNCMaps1PolyElementClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogClick.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TRectanglesMainView.TMSFNCMaps1PolyElementDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogDblClick.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TRectanglesMainView.TMSFNCMaps1PolyElementMouseDown(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseDown.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TRectanglesMainView.TMSFNCMaps1PolyElementMouseEnter(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseEnter.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TRectanglesMainView.TMSFNCMaps1PolyElementMouseLeave(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseLeave.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TRectanglesMainView.TMSFNCMaps1PolyElementMouseUp(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseUp.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TRectanglesMainView.AddLogEventMap(AEventData: TTMSFNCMapsEventData);
var
  LRectangle: TTMSFNCMapsRectangle;
begin
  if AEventData.PolyElement.ClassName <> TTMSFNCMapsRectangle.ClassName then
    Exit;

  mmLog.Lines.Add('##################');
  mmLog.Lines.Add('EventName: ' + AEventData.EventName);
  mmLog.Lines.Add('ID: ' + AEventData.ID);
  mmLog.Lines.Add('Coordinate.Latitude: ' + AEventData.Coordinate.Latitude.ToString);
  mmLog.Lines.Add('Coordinate.Longitude: ' + AEventData.Coordinate.Longitude.ToString);
  mmLog.Lines.Add(Format('X / Y: %s / %s', [AEventData.X.ToString, AEventData.Y.ToString]));

  LRectangle := TTMSFNCMapsRectangle(AEventData.PolyElement);
  mmLog.Lines.Add('ID: ' + LRectangle.ID);
  mmLog.Lines.Add('Bounds.NorthEast.Latitude: ' + LRectangle.Bounds.NorthEast.Latitude.ToString);
  mmLog.Lines.Add('Bounds.NorthEast.Longitude: ' + LRectangle.Bounds.NorthEast.Longitude.ToString);
  mmLog.Lines.Add('Bounds.SouthWest.Latitude: ' + LRectangle.Bounds.SouthWest.Latitude.ToString);
  mmLog.Lines.Add('Bounds.SouthWest.Longitude: ' + LRectangle.Bounds.SouthWest.Longitude.ToString);
  mmLog.Lines.Add('Visible: ' + LRectangle.Visible.ToString(TUseBoolStrs.True));
  mmLog.Lines.Add('FillColor: ' + ColorToString(LRectangle.FillColor));
  mmLog.Lines.Add('FillOpacity: ' + LRectangle.FillOpacity.ToString);
  mmLog.Lines.Add('StrokeColor: ' + ColorToString(LRectangle.StrokeColor));
  mmLog.Lines.Add('StrokeOpacity: ' + LRectangle.StrokeOpacity.ToString);
  mmLog.Lines.Add('StrokeWidth: ' + LRectangle.StrokeWidth.ToString);
  mmLog.Lines.Add('');
end;



end.
