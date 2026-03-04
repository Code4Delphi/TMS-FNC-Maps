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
    GroupBox1: TGroupBox;
    ckShowBaseLayer: TCheckBox;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    btnGeoTiff01: TButton;
    btnClearTileLayers: TButton;
    btnAddUrl: TButton;
    btnGeoTiff02: TButton;
    edtUrl: TEdit;
    GroupBox3: TGroupBox;
    mmLog: TMemo;
    Panel1: TPanel;
    ckGetLinksClickMap: TCheckBox;
    Label3: TLabel;
    edtLimit: TEdit;
    Label4: TLabel;
    edtCloudCover: TEdit;
    Label5: TLabel;
    edtRadiusKM: TEdit;
    Panel3: TPanel;
    addFisrtItemToMap: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGeoTiff01Click(Sender: TObject);
    procedure btnClearTileLayersClick(Sender: TObject);
    procedure ckShowBaseLayerClick(Sender: TObject);
    procedure TrackBar1Tracking(Sender: TObject);
    procedure btnGeoTiff02Click(Sender: TObject);
    procedure btnAddUrlClick(Sender: TObject);
    procedure TMSFNCOpenLayers1MapDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure addFisrtItemToMapClick(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure AddUrlLayer(const AURL: string);
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
    LLayer.Opacity := TrackBar1.Position / 10;

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

procedure TGeoTIFFMainView.btnClearTileLayersClick(Sender: TObject);
begin
  TMSFNCOpenLayers1.ClearTileLayers;
end;

procedure TGeoTIFFMainView.TMSFNCOpenLayers1MapDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckGetLinksClickMap.Checked then
  begin
    var LParams: TSentinel2Params;
    LParams.Latitude := AEventData.Coordinate.Latitude;
    LParams.Longitude := AEventData.Coordinate.Longitude;
    LParams.RadiusKM := StrToIntDef(edtRadiusKM.Text, 1);
    LParams.Limit := StrToIntDef(edtLimit.Text, 1);
    LParams.CloudCover := StrToIntDef(edtCloudCover.Text, 1);;
    LParams.Results := mmLog.Lines;
    TSentinel2Utils.GetLinks(LParams);
  end;
end;

procedure TGeoTIFFMainView.btnAddUrlClick(Sender: TObject);
begin
  if Trim(edtUrl.Text).IsEmpty then
    raise Exception.Create('Please provide the desired URL');

  Self.AddUrlLayer(edtUrl.Text);
end;

procedure TGeoTIFFMainView.addFisrtItemToMapClick(Sender: TObject);
begin
  if mmLog.Lines.Count >= 1 then
    Self.AddUrlLayer(mmLog.Lines[0]);
end;

procedure TGeoTIFFMainView.AddUrlLayer(const AURL: string);
var
  LLayer: TTMSFNCOpenLayersTileLayer;
begin
  if AURL.Trim.IsEmpty then
    Exit;

  TMSFNCOpenLayers1.BeginUpdate;
  LLayer := TMSFNCOpenLayers1.TileLayers.Add;
  LLayer.Source := tlsGeoTiff;
  LLayer.Opacity := TrackBar1.Position / 10;
  LLayer.URL := AURL;
  TMSFNCOpenLayers1.EndUpdate;
end;

end.
