unit GeoTIFF.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,
  System.JSON,
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
  VCL.TMSFNCOpenLayers,
  Sentinel2.Utils;

type
  TGeoTIFFMainView = class(TForm)
    pnTop: TPanel;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    TMSFNCOpenLayers1: TTMSFNCOpenLayers;
    GroupBox2: TGroupBox;
    btnGeoTiff01: TButton;
    Button2: TButton;
    btnAddUrl: TButton;
    GroupBox1: TGroupBox;
    ckShowBaseLayer: TCheckBox;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    btnGeoTiff02: TButton;
    Label2: TLabel;
    edtUrl: TEdit;
    GroupBox3: TGroupBox;
    mmLog: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    ckGetLinksClickMap: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnGeoTiff01Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ckShowBaseLayerClick(Sender: TObject);
    procedure TrackBar1Tracking(Sender: TObject);
    procedure btnGeoTiff02Click(Sender: TObject);
    procedure btnAddUrlClick(Sender: TObject);
    procedure TMSFNCOpenLayers1MapDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
  private
    procedure ConfigBasicMaps;
  public

  end;

var
  GeoTIFFMainView: TGeoTIFFMainView;

implementation

{$R *.dfm}

procedure TGeoTIFFMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Self.ConfigBasicMaps;
  //button3.Click;
end;



procedure TGeoTIFFMainView.TrackBar1Tracking(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TGeoTIFFMainView.ConfigBasicMaps;
var
  LLayer: TTMSFNCOpenLayersTileLayer;
begin
  TMSFNCOpenLayers1.BeginUpdate;
  TMSFNCOpenLayers1.Options.ShowBaseLayer := ckShowBaseLayer.Checked;

  for LLayer in TMSFNCOpenLayers1.TileLayers do
  begin
    LLayer.Opacity := TrackBar1.Position / 10;
  end;

  TMSFNCOpenLayers1.EndUpdate;
end;

procedure TGeoTIFFMainView.btnGeoTiff01Click(Sender: TObject);
var
  LLayer: TTMSFNCOpenLayersTileLayer;
begin
  TMSFNCOpenLayers1.BeginUpdate;
  TMSFNCOpenLayers1.SetCenterCoordinate(16.71, 33.51);
  TMSFNCOpenLayers1.SetZoomLevel(9);

  LLayer := TMSFNCOpenLayers1.TileLayers.Add;
  LLayer.Source := tlsGeoTiff;
  LLayer.Opacity := TrackBar1.Position / 10;
  LLayer.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/36/Q/WD/2020/7/S2A_36QWD_20200701_0_L2A/TCI.tif';
  TMSFNCOpenLayers1.EndUpdate;
end;

procedure TGeoTIFFMainView.btnGeoTiff02Click(Sender: TObject);
var
  LLayer: TTMSFNCOpenLayersTileLayer;
begin
  TMSFNCOpenLayers1.BeginUpdate;
  TMSFNCOpenLayers1.SetCenterCoordinate(-24.241, -51.672);
  TMSFNCOpenLayers1.SetZoomLevel(8);

  LLayer := TMSFNCOpenLayers1.TileLayers.Add;
  LLayer.Source := tlsGeoTiff;
  LLayer.Opacity := TrackBar1.Position / 10;
  LLayer.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/22/K/DU/2026/1/S2C_22KDU_20260121_0_L2A/TCI.tif';
  TMSFNCOpenLayers1.EndUpdate;
end;

procedure TGeoTIFFMainView.ckShowBaseLayerClick(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TGeoTIFFMainView.TMSFNCOpenLayers1MapDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckGetLinksClickMap.Checked then
  begin
    TSentinel2Utils.GetLinks(AEventData.Coordinate.Latitude, AEventData.Coordinate.Longitude, 1, mmLog.Lines);
  end;
end;

procedure TGeoTIFFMainView.Button2Click(Sender: TObject);
begin
  TMSFNCOpenLayers1.ClearTileLayers;
end;

procedure TGeoTIFFMainView.btnAddUrlClick(Sender: TObject);
var
  LLayer: TTMSFNCOpenLayersTileLayer;
begin
  if Trim(edtUrl.Text).IsEmpty then
    raise Exception.Create('Informe a URL desejada');

  TMSFNCOpenLayers1.BeginUpdate;
  LLayer := TMSFNCOpenLayers1.TileLayers.Add;
  LLayer.Source := tlsGeoTiff;
  LLayer.Opacity := TrackBar1.Position / 10;
  LLayer.URL := edtUrl.Text;
  TMSFNCOpenLayers1.EndUpdate;
end;

end.
