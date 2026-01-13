unit Heatmaps.Main.View;

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
  VCL.TMSFNCMaps, VCL.TMSFNCGoogleMaps;

type
  THeatmapsMainView = class(TForm)
    pnTop: TPanel;
    GroupBox3: TGroupBox;
    StatusBar1: TStatusBar;
    btnClearAll: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    Splitter1: TSplitter;
    btnAddPoint: TButton;
    TMSFNCGoogleMaps1: TTMSFNCGoogleMaps;
    GroupBox5: TGroupBox;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    btnAddCoordinate: TButton;
    edtCustomizedLatitude: TEdit;
    edtCustomizedLongitude: TEdit;
    ckAddCoordinatesClickingMap: TCheckBox;
    Panel3: TPanel;
    btnDeleteCoordinate: TButton;
    btnAddHeatmaps: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Order: TIntegerField;
    ClientDataSet1Latitude: TFloatField;
    ClientDataSet1Longitude: TFloatField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    gBoxPointAToPointB: TGroupBox;
    Label1: TLabel;
    Label7: TLabel;
    edtLatitudePointA: TEdit;
    edtLatitudePointB: TEdit;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtLongitudePointA: TEdit;
    edtLongitudePointB: TEdit;
    Label14: TLabel;
    btnPointAToPointB: TButton;
    Label15: TLabel;
    edtNumberMarkings: TEdit;
    Label16: TLabel;
    edtWeight: TEdit;
    ckZoomInCreated: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
    procedure btnClearAllClick(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure btnAddPointClick(Sender: TObject);
    procedure TMSFNCGoogleMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnAddCoordinateClick(Sender: TObject);
    procedure btnDeleteCoordinateClick(Sender: TObject);
    procedure btnAddHeatmapsClick(Sender: TObject);
    procedure btnPointAToPointBClick(Sender: TObject);
  private
    procedure ConfigBasicMaps;
  public
  end;

var
  HeatmapsMainView: THeatmapsMainView;

implementation

{$R *.dfm}

procedure THeatmapsMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  Self.ConfigBasicMaps;
end;

procedure THeatmapsMainView.cBoxLanguageChange(Sender: TObject);
begin
  TMSFNCGoogleMaps1.Options.Locale := 'pt-BR';
  TMSFNCGoogleMaps1.ReInitialize;
end;

procedure THeatmapsMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure THeatmapsMainView.ConfigBasicMaps;
begin
  TMSFNCGoogleMaps1.BeginUpdate;
  TMSFNCGoogleMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCGoogleMaps1.EndUpdate;
end;

procedure THeatmapsMainView.btnAddCoordinateClick(Sender: TObject);
begin
  ClientDataSet1.Append;
  ClientDataSet1Order.AsInteger := ClientDataSet1.RecordCount + 1;
  ClientDataSet1Latitude.AsFloat := StrToFloatDef(edtCustomizedLatitude.Text, 0);
  ClientDataSet1Longitude.AsFloat := StrToFloatDef(edtCustomizedLongitude.Text, 0);
  ClientDataSet1.Post;
end;

procedure THeatmapsMainView.btnClearAllClick(Sender: TObject);
begin
  TMSFNCGoogleMaps1.ClearHeatMaps;
end;

procedure THeatmapsMainView.btnDeleteCoordinateClick(Sender: TObject);
begin
  if ClientDataSet1.IsEmpty then
    raise Exception.Create('Select a record to be deleted');

  ClientDataSet1.Delete;
end;

procedure THeatmapsMainView.btnAddPointClick(Sender: TObject);
var
  LCoordinateRecArray: TTMSFNCMapsCoordinateRecArray;
  LHeatMap: TTMSFNCMapsHeatMap;
begin
  SetLength(LCoordinateRecArray, 2);

  LCoordinateRecArray[0].Latitude := 37.782551;
  LCoordinateRecArray[0].Longitude := -122.445368;
  LCoordinateRecArray[0].Weight := 1; //Optional setting

  LCoordinateRecArray[1].Latitude := 37.782745;
  LCoordinateRecArray[1].Longitude := -122.444586;
  LCoordinateRecArray[1].Weight := 1; //Optional setting

  TMSFNCGoogleMaps1.BeginUpdate;
  LHeatMap := TMSFNCGoogleMaps1.AddHeatMap(LCoordinateRecArray);
  LHeatMap.Opacity := 1;
  LHeatMap.GradientStartColor := gcGreen;
  LHeatMap.GradientMidColor := gcYellow;
  LHeatMap.GradientEndColor := gcRed;
  TMSFNCGoogleMaps1.EndUpdate;
end;

procedure THeatmapsMainView.TMSFNCGoogleMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckAddCoordinatesClickingMap.Checked then
  begin
    edtCustomizedLatitude.Text := AEventData.Coordinate.Latitude.ToString;
    edtCustomizedLongitude.Text := AEventData.Coordinate.Longitude.ToString;
    btnAddCoordinate.Click;
  end;
end;

procedure THeatmapsMainView.btnAddHeatmapsClick(Sender: TObject);
var
  LCoordinateRecArray: TTMSFNCMapsCoordinateRecArray;
  LHeatMap: TTMSFNCMapsHeatMap;
begin
  if ClientDataSet1.IsEmpty then
    raise Exception.Create('Enter the coordinates to continue');

  SetLength(LCoordinateRecArray, ClientDataSet1.RecordCount);

  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin
    LCoordinateRecArray[Pred(ClientDataSet1.RecNo)] := CreateCoordinate(ClientDataSet1Latitude.AsFloat, ClientDataSet1Longitude.AsFloat);

    LCoordinateRecArray[Pred(ClientDataSet1.RecNo)].Latitude := ClientDataSet1Latitude.AsFloat;
    LCoordinateRecArray[Pred(ClientDataSet1.RecNo)].Longitude := ClientDataSet1Longitude.AsFloat;
    LCoordinateRecArray[Pred(ClientDataSet1.RecNo)].Weight := 1; //Optional setting

    ClientDataSet1.Next;
  end;

  TMSFNCGoogleMaps1.BeginUpdate;
  LHeatMap := TMSFNCGoogleMaps1.AddHeatMap(LCoordinateRecArray);
  LHeatMap.Opacity := 1;
  LHeatMap.GradientStartColor := gcGreen;
  LHeatMap.GradientMidColor := gcYellow;
  LHeatMap.GradientEndColor := gcRed;
  TMSFNCGoogleMaps1.EndUpdate;

  if ckZoomInCreated.Checked then
    TMSFNCGoogleMaps1.ZoomToBounds(LCoordinateRecArray);
end;

procedure THeatmapsMainView.btnPointAToPointBClick(Sender: TObject);
begin
  var LNumberOfPoints := StrToIntDef(edtNumberMarkings.Text, 0);
  var LLatPointA := StrToFloatDef(edtLatitudePointA.Text, 0);
  var LLonPointA := StrToFloatDef(edtLongitudePointA.Text, 0);
  var LLatPointB := StrToFloatDef(edtLatitudePointB.Text, 0);
  var LLonPointB := StrToFloatDef(edtLongitudePointB.Text, 0);

  TMSFNCGoogleMaps1.BeginUpdate;
  try
    var LHeatMap := TMSFNCGoogleMaps1.AddHeatMap(nil);
    LHeatMap.Opacity := 1;
    LHeatMap.GradientStartColor := gcGreen;
    LHeatMap.GradientMidColor := gcYellow;
    LHeatMap.GradientEndColor := gcRed;

    for var i := 0 to LNumberOfPoints do
    begin
      var LInterpolationFactor := i / LNumberOfPoints; //INTERPOLACAO 0..1 | 0.25 = 25% do caminho | 0.5 = 50% do caminho ...
      var LWeightedCoordinate := LHeatMap.WeightedCoordinates.Add;
      LWeightedCoordinate.Coordinate.Latitude := LLatPointA + (LLatPointB - LLatPointA) * LInterpolationFactor;
      LWeightedCoordinate.Coordinate.Longitude := LLonPointA + (LLonPointB - LLonPointA) * LInterpolationFactor;
      LWeightedCoordinate.Weight := 10;
    end;
  finally
    TMSFNCGoogleMaps1.EndUpdate;
  end;
end;

end.
