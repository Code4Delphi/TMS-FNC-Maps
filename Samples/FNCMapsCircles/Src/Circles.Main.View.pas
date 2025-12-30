unit Circles.Main.View;

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
  TCirclesMainView = class(TForm)
    TMSFNCMaps1: TTMSFNCMaps;
    pnTop: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    cBoxService: TComboBox;
    edtAPIKeyMap: TEdit;
    Panel1: TPanel;
    btnAddCircle: TButton;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    CopyLatitudeAndLongitude1: TMenuItem;
    AddToPolygonCustomized1: TMenuItem;
    StatusBar1: TStatusBar;
    N1: TMenuItem;
    btnClearAllCircles: TButton;
    GroupBox3: TGroupBox;
    ckAddCircleClickingMap: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    cBoxFillColor: TComboBox;
    edtFillOpacity: TEdit;
    Label2: TLabel;
    lbStrokeWidth: TLabel;
    cBoxStrokeColor: TComboBox;
    edtStrokeWidth: TEdit;
    Label3: TLabel;
    edtRadius: TEdit;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Id: TStringField;
    ClientDataSet1Latitude: TFloatField;
    ClientDataSet1Longitude: TFloatField;
    ClientDataSet1Visible: TBooleanField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnRefresh: TButton;
    btnDelete: TButton;
    btnVisibleInvisible: TButton;
    ClientDataSet1Radius: TFloatField;
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
    procedure FormCreate(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure btnAddCircleClick(Sender: TObject);
    procedure CopyLatitudeAndLongitude1Click(Sender: TObject);
    procedure TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnClearAllCirclesClick(Sender: TObject);
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
    procedure RefreshCirclesInDataSet;
    function GetCircleBySelected: TTMSFNCMapsCircle;
    procedure AddLogEventMap(AEventData: TTMSFNCMapsEventData);
  public

  end;

var
  CirclesMainView: TCirclesMainView;

implementation

{$R *.dfm}

procedure TCirclesMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);
  Self.ConfigBasicMaps;
end;

procedure TCirclesMainView.TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  FLastLat := AEventData.Coordinate.Latitude;
  FLastLon := AEventData.Coordinate.Longitude;

  StatusBar1.Panels[0].Text := 'Lat: ' + FLastLat.ToString;
  StatusBar1.Panels[1].Text := 'Lon: ' + FLastLon.ToString;
end;

procedure TCirclesMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.EndUpdate;

  edtAPIKeyMap.Enabled := not (cBoxService.ItemIndex in [6, 8]);
end;

procedure TCirclesMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TCirclesMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TCirclesMainView.TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
var
  LCircle: TTMSFNCMapsCircle;
begin
  if ckAddCircleClickingMap.Checked then
  begin
    TMSFNCMaps1.BeginUpdate;
    LCircle := TMSFNCMaps1.AddCircle(CreateCoordinate(FLastLat, FLastLon), StrToIntDef(edtRadius.Text, 400000));
    LCircle.FillColor := TTMSFNCGraphicsColor(StringToColor(cBoxFillColor.Text));
    LCircle.FillOpacity := StrToFloatDef(edtFillOpacity.Text, 0.2);
    LCircle.StrokeColor := TTMSFNCGraphicsColor(StringToColor(cBoxStrokeColor.Text));
    LCircle.StrokeWidth := StrToIntDef(edtStrokeWidth.Text, 2);
    TMSFNCMaps1.EndUpdate;

    Self.RefreshCirclesInDataSet;
  end;
end;

procedure TCirclesMainView.btnAddCircleClick(Sender: TObject);
var
  LCircle: TTMSFNCMapsCircle;
begin
  TMSFNCMaps1.BeginUpdate;
  LCircle := TMSFNCMaps1.AddCircle(CreateCoordinate(64.820128, -18.638252), 400000); //400 KM
  LCircle.FillColor := gcBlue;
  LCircle.FillOpacity := 0.2;
  LCircle.StrokeColor := gcBlack;
  LCircle.StrokeWidth := 4;
  TMSFNCMaps1.EndUpdate;

  Self.RefreshCirclesInDataSet;
end;

procedure TCirclesMainView.btnAddPolygonClick(Sender: TObject);
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

procedure TCirclesMainView.CopyLatitudeAndLongitude1Click(Sender: TObject);
begin
  Clipboard.AsText := Format('%s, %s', [FLastLat.ToString, FLastLon.ToString]);
end;

procedure TCirclesMainView.btnRefreshClick(Sender: TObject);
begin
  Self.RefreshCirclesInDataSet;
end;

procedure TCirclesMainView.btnDeleteClick(Sender: TObject);
var
  LCircle: TTMSFNCMapsCircle;
begin
  LCircle := Self.GetCircleBySelected;

  if LCircle = nil then
    Exit;

  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Circles.Delete(LCircle.Index);
  TMSFNCMaps1.EndUpdate;

  Self.RefreshCirclesInDataSet;
end;

procedure TCirclesMainView.btnVisibleInvisibleClick(Sender: TObject);
var
  LCircle: TTMSFNCMapsCircle;
begin
  LCircle := Self.GetCircleBySelected;

  if LCircle = nil then
    Exit;

  TMSFNCMaps1.BeginUpdate;
  LCircle.Visible := not LCircle.Visible;
  TMSFNCMaps1.EndUpdate;

  ClientDataSet1.Edit;
  ClientDataSet1Visible.AsBoolean := LCircle.Visible;
  ClientDataSet1.Post;
end;

function TCirclesMainView.GetCircleBySelected: TTMSFNCMapsCircle;
var
  LPolyElement : TTMSFNCMapsPolyElement;
  LCircle: TTMSFNCMapsCircle;
begin
  Result := nil;

  if ClientDataSet1.IsEmpty then
    raise Exception.Create('Select an item to be deleted');

  LPolyElement := TMSFNCMaps1.Circles.ItemByID[ClientDataSet1Id.AsString];
  if LPolyElement.ClassName <> TTMSFNCMapsCircle.ClassName then
    Exit;

  LCircle := TTMSFNCMapsCircle(TMSFNCMaps1.Circles.ItemByID[ClientDataSet1Id.AsString]);
  if LCircle = nil then
    raise Exception.Create('Circle not found');

  Result := LCircle;
end;

procedure TCirclesMainView.RefreshCirclesInDataSet;
var
  i: Integer;
  LCircle: TTMSFNCMapsCircle;
begin
  ClientDataSet1.EmptyDataSet;
  ClientDataSet1.Open;

  if TMSFNCMaps1.Circles.Count <= 0 then
    Exit;

  for i := 0 to Pred(TMSFNCMaps1.Circles.Count) do
  begin
    LCircle := TMSFNCMaps1.Circles.Items[i];

    ClientDataSet1.Append;
    ClientDataSet1Id.AsString := LCircle.ID;
    ClientDataSet1Latitude.AsFloat := LCircle.Center.Latitude;
    ClientDataSet1Longitude.AsFloat := LCircle.Center.Longitude;
    ClientDataSet1Radius.AsFloat := LCircle.Radius;
    ClientDataSet1Visible.AsBoolean := LCircle.Visible;
    ClientDataSet1.Post;
  end;
end;

procedure TCirclesMainView.btnClearAllCirclesClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearCircles;

  Self.RefreshCirclesInDataSet;
end;

procedure TCirclesMainView.btnClearLogClick(Sender: TObject);
begin
  mmLog.Lines.Clear;
end;

procedure TCirclesMainView.TMSFNCMaps1PolyElementClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogClick.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TCirclesMainView.TMSFNCMaps1PolyElementDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogDblClick.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TCirclesMainView.TMSFNCMaps1PolyElementMouseDown(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseDown.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TCirclesMainView.TMSFNCMaps1PolyElementMouseEnter(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseEnter.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TCirclesMainView.TMSFNCMaps1PolyElementMouseLeave(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseLeave.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TCirclesMainView.TMSFNCMaps1PolyElementMouseUp(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckLogMouseUp.Checked then
    Self.AddLogEventMap(AEventData);
end;

procedure TCirclesMainView.AddLogEventMap(AEventData: TTMSFNCMapsEventData);
var
  LCircle: TTMSFNCMapsCircle;
begin
  if AEventData.PolyElement.ClassName <> TTMSFNCMapsCircle.ClassName then
    Exit;

  mmLog.Lines.Add('##################');
  mmLog.Lines.Add('EventName: ' + AEventData.EventName);
  mmLog.Lines.Add('ID: ' + AEventData.ID);
  mmLog.Lines.Add('Coordinate.Latitude: ' + AEventData.Coordinate.Latitude.ToString);
  mmLog.Lines.Add('Coordinate.Longitude: ' + AEventData.Coordinate.Longitude.ToString);
  mmLog.Lines.Add(Format('X / Y: %s / %s', [AEventData.X.ToString, AEventData.Y.ToString]));

  LCircle := TTMSFNCMapsCircle(AEventData.PolyElement);
  mmLog.Lines.Add('ID: ' + LCircle.ID);
  mmLog.Lines.Add('Center.Latitude: ' + LCircle.Center.Latitude.ToString);
  mmLog.Lines.Add('Center.Longitude: ' + LCircle.Center.Longitude.ToString);
  mmLog.Lines.Add('Radius: ' + LCircle.Radius.ToString);
  mmLog.Lines.Add('Visible: ' + LCircle.Visible.ToString(TUseBoolStrs.True));
  mmLog.Lines.Add('FillColor: ' + ColorToString(LCircle.FillColor));
  mmLog.Lines.Add('FillOpacity: ' + LCircle.FillOpacity.ToString);
  mmLog.Lines.Add('StrokeColor: ' + ColorToString(LCircle.StrokeColor));
  mmLog.Lines.Add('StrokeOpacity: ' + LCircle.StrokeOpacity.ToString);
  mmLog.Lines.Add('StrokeWidth: ' + LCircle.StrokeWidth.ToString);
  mmLog.Lines.Add('');
end;

end.
