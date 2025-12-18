unit Main.View;

interface

uses
  TypInfo, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes, Vcl.StdCtrls, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps, Vcl.ExtCtrls;

type
  TMainView = class(TForm)
    Panel1: TPanel;
    TMSFNCMaps1: TTMSFNCMaps;
    Label1: TLabel;
    cBoxService: TComboBox;
    Button1: TButton;
    GroupBox1: TGroupBox;
    btnAddMarkerDefault: TButton;
    btnAddMarkerOk: TButton;
    btnAddMarkerNo: TButton;
    btnAddMarkerC4D: TButton;
    btnAddMarkerCustomized: TButton;
    GroupBox2: TGroupBox;
    btnAddPolygon: TButton;
    btnAddCircle: TButton;
    btnAddRectangles: TButton;
    GroupBox3: TGroupBox;
    btnAddLabel01: TButton;
    btnAddLabel02: TButton;
    GroupBox4: TGroupBox;
    Button11: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddMarkerDefaultClick(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure btnAddMarkerCustomizedClick(Sender: TObject);
    procedure btnAddPolygonClick(Sender: TObject);
    procedure btnAddCircleClick(Sender: TObject);
    procedure btnAddRectanglesClick(Sender: TObject);
    procedure btnAddLabel01Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnAddLabel02Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure btnAddMarkerOkClick(Sender: TObject);
    procedure btnAddMarkerNoClick(Sender: TObject);
    procedure btnAddMarkerC4DClick(Sender: TObject);
  private
    procedure PreencherComboboxServices;
  public
  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

procedure TMainView.FormCreate(Sender: TObject);
begin
  Self.PreencherComboboxServices;
  cBoxService.ItemIndex := 6;
  cBoxServiceChange(cBoxService);
end;

procedure TMainView.PreencherComboboxServices;
begin
  cBoxService.Clear;
  for var LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
  begin
    cBoxService.Items.AddObject(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)), TObject(Ord(LService)));
    //cBoxService.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
  end;
end;

procedure TMainView.cBoxServiceChange(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;

  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  //d.Service := TTMSFNCDirectionsService(cboDirections.ItemIndex{$IFDEF WEBLIB} + 1 {$ENDIF});
  //g.Service := TTMSFNCGeocodingService(cboGeocoding.ItemIndex);

  //DoKeyEditsChange(Self);

  TMSFNCMaps1.APIKey := 'eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6ImYwYzZjMDA2OWQxMjQ5YTQ4M2NiYTBhOTdhZWYyYTgzIiwiaCI6Im11cm11cjY0In0=';

  TMSFNCMaps1.EndUpdate;
end;

procedure TMainView.btnAddMarkerDefaultClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(DefaultCoordinate, 'Marker Default');
  TMSFNCMaps1.EndUpdate;
end;

procedure TMainView.btnAddMarkerOkClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(47.457421, -83.215685, 'Marker OK', 'https://code4delphi.com.br/img/ok.png');
  TMSFNCMaps1.EndUpdate;
end;

procedure TMainView.btnAddMarkerNoClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(52.321560, 75.866337, 'Marker No', 'https://code4delphi.com.br/img/no.png');
  TMSFNCMaps1.EndUpdate;
end;

procedure TMainView.btnAddMarkerC4DClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(-25.562780, -52.629749, 'Marker C4D', 'https://code4delphi.com.br/img/c4d-24x24.png');
  TMSFNCMaps1.EndUpdate;
end;

procedure TMainView.btnAddMarkerCustomizedClick(Sender: TObject);
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

procedure TMainView.Button1Click(Sender: TObject);
begin
  TMSFNCMaps1.SetZoomLevel(1);
end;

procedure TMainView.btnAddPolygonClick(Sender: TObject);
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

procedure TMainView.btnAddCircleClick(Sender: TObject);
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

procedure TMainView.btnAddRectanglesClick(Sender: TObject);
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

procedure TMainView.btnAddLabel01Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddLabel(50.105082, -118.859648, '<b>C4D</b><br>Code4Delphi');
  TMSFNCMaps1.EndUpdate;
end;

procedure TMainView.btnAddLabel02Click(Sender: TObject);
var
  LMapsLabel: TTMSFNCMapsLabel;
begin
  TMSFNCMaps1.BeginUpdate;
  LMapsLabel := TMSFNCMaps1.AddLabel(57.261558, -14.946536, '<b>C4D</b><br>Code4Delphi', gcWhite, gcDarkslateblue);
  LMapsLabel.Font.Size := 14;
  TMSFNCMaps1.EndUpdate;
end;

procedure TMainView.Button11Click(Sender: TObject);
//var
//  ca: TTMSFNCMapsCoordinateRecArray;
//  hm: TTMSFNCMapsHeatMap;
begin
//  SetLength(ca, 2);
//
//  ca[0].Latitude := 37.782551;
//  ca[0].Longitude := -122.445368;
//  //Optional setting
//  ca[0].Weight := 1;
//  //
//
//  ca[1].Latitude := 37.782745;
//  ca[1].Longitude := -122.444586;
//  //Optional setting
//  ca[1].Weight := 1;
//  //
//
//  TMSFNCMaps1.BeginUpdate;
//  hm := TMSFNCMaps1.AddHeatMap(ca);
//  //Optional settings
//  hm.Opacity := 1;
//  hm.GradientStartColor := gcGreen;
//  hm.GradientMidColor := gcYellow;
//  hm.GradientEndColor := gcRed;
//  //
//  TMSFNCMaps1.EndUpdate;
end;

end.
