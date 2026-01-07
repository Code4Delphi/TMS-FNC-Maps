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
    Label1: TLabel;
    Label5: TLabel;
    cBoxService: TComboBox;
    edtAPIKeyMap: TEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label2: TLabel;
    lbFontSize: TLabel;
    ckAddLabelClickingMap: TCheckBox;
    cBoxFontColor: TComboBox;
    cBoxBackgroundColor: TComboBox;
    edtFontSize: TEdit;
    ckBold: TCheckBox;
    ckItalic: TCheckBox;
    ckUnderline: TCheckBox;
    ckStrikeOut: TCheckBox;
    Label3: TLabel;
    edtText: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    cBoxBorderColor: TComboBox;
    edtBorderWidth: TEdit;
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
    ckZoomInCreated: TCheckBox;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Order: TIntegerField;
    ClientDataSet1Latitude: TFloatField;
    ClientDataSet1Longitude: TFloatField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
    procedure btnClearAllClick(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure btnAddPointClick(Sender: TObject);
    procedure TMSFNCGoogleMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnAddCoordinateClick(Sender: TObject);
    procedure btnDeleteCoordinateClick(Sender: TObject);
    procedure btnAddHeatmapsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure RefreshLabelsInDataSet;
  public
  end;

var
  HeatmapsMainView: THeatmapsMainView;

implementation

{$R *.dfm}

procedure THeatmapsMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := 6;
  cBoxServiceChange(cBoxService);
end;

procedure THeatmapsMainView.cBoxLanguageChange(Sender: TObject);
begin
  TMSFNCGoogleMaps1.Options.Locale := 'pt-BR';
  TMSFNCGoogleMaps1.ReInitialize;
end;

procedure THeatmapsMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
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

  edtAPIKeyMap.Enabled := not (cBoxService.ItemIndex in [6, 8]);
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

procedure THeatmapsMainView.RefreshLabelsInDataSet;
//var
//  LLabel: TTMSFNCMapsLabel;
begin
//  ClientDataSet1.EmptyDataSet;
//  ClientDataSet1.Open;
//
//  if TMSFNCGoogleMaps1.Labels.Count <= 0 then
//    Exit;
//
//  for var i := 0 to Pred(TMSFNCGoogleMaps1.Labels.Count) do
//  begin
//    LLabel := TMSFNCGoogleMaps1.Labels.Items[i];
//
//    ClientDataSet1.Append;
//    ClientDataSet1Id.AsString := LLabel.ID;
//    ClientDataSet1Text.AsString := LLabel.Text;
//    ClientDataSet1Latitude.AsFloat := LLabel.Coordinate.Latitude;
//    ClientDataSet1Longitude.AsFloat := LLabel.Coordinate.Longitude;
//    ClientDataSet1Visible.AsBoolean := LLabel.Visible;
//    ClientDataSet1.Post;
//  end;
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

procedure THeatmapsMainView.Button1Click(Sender: TObject);
var
  LCoordinateRecArray: TTMSFNCMapsCoordinateRecArray;
  LLat: Double;
  LLong: Double;
  LHeatMap: TTMSFNCMapsHeatMap;
begin
  LLat := 37.782551;
  LLong := -122.445368;

  SetLength(LCoordinateRecArray, 20);

  for var i := 0 to 19 do
  begin
    LCoordinateRecArray[i].Latitude := LLat;
    LCoordinateRecArray[i].Longitude := LLong;
    LCoordinateRecArray[i].Weight := 1; //Optional setting

    LLat := LLat + 1000;
    LLong := LLong - 1000;

    TMSFNCGoogleMaps1.BeginUpdate;
    LHeatMap := TMSFNCGoogleMaps1.AddHeatMap(LCoordinateRecArray);
    LHeatMap.Opacity := 1;
    LHeatMap.GradientStartColor := gcGreen;
    LHeatMap.GradientMidColor := gcYellow;
    LHeatMap.GradientEndColor := gcRed;
    TMSFNCGoogleMaps1.EndUpdate;
  end;
end;

end.
