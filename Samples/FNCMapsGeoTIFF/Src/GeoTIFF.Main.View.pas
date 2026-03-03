unit GeoTIFF.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
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
  VCL.TMSFNCOpenLayers;

type
  TGeoTIFFMainView = class(TForm)
    pnTop: TPanel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    TMSFNCOpenLayers1: TTMSFNCOpenLayers;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    btnTif01: TButton;
    btnTif02: TButton;
    GroupBox3: TGroupBox;
    mmLogs: TMemo;
    btnTif03: TButton;
    edtLoadTifs: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnTif01Click(Sender: TObject);
    procedure btnTif02Click(Sender: TObject);
    procedure TMSFNCOpenLayers1MapDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnTif03Click(Sender: TObject);
    procedure edtLoadTifsClick(Sender: TObject);
  private
    procedure LoadTif(const AUrl: string; const ALatitude, ALongitude: Double);
    procedure LoadTifs;
  public

  end;

var
  GeoTIFFMainView: TGeoTIFFMainView;

implementation

{$R *.dfm}

procedure TGeoTIFFMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  //btnTif02.Click;
  Self.LoadTifs;
end;

procedure TGeoTIFFMainView.Button1Click(Sender: TObject);
var
  LLayer: TTMSFNCOpenLayersTileLayer;
begin
//  TMSFNCOpenLayers1.BeginUpdate;
//  TMSFNCOpenLayers1.Options.DefaultLatitude := 16.71;
//  TMSFNCOpenLayers1.Options.DefaultLongitude := 33.51;
//  TMSFNCOpenLayers1.Options.DefaultZoomLevel := 9;
//
//  LLayer := TMSFNCOpenLayers1.TileLayers.Add;
//  LLayer.Source := tlsGeoTiff;
//  //LLayer.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/10/T/FK/2021/7/S2B_10TFK_20210713_0_L2A/TCI.tif';
//  LLayer.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/15/T/UH/2022/6/S2A_15TUH_20220623_0_L2A/TCI.tif';
//  TMSFNCOpenLayers1.EndUpdate;


  TMSFNCOpenLayers1.BeginUpdate;
  TMSFNCOpenLayers1.Options.DefaultLatitude := 16.71;
  TMSFNCOpenLayers1.Options.DefaultLongitude := 33.51;
  TMSFNCOpenLayers1.Options.DefaultZoomLevel := 9;
  LLayer := TMSFNCOpenLayers1.TileLayers.Add;
  LLayer.Source := tlsGeoTiff;
  LLayer.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/36/Q/WD/2020/7/S2A_36QWD_20200701_0_L2A/TCI.tif';
  TMSFNCOpenLayers1.EndUpdate;

end;

procedure TGeoTIFFMainView.Button2Click(Sender: TObject);
begin
  TMSFNCOpenLayers1.ClearTileLayers;
end;


procedure TGeoTIFFMainView.Button3Click(Sender: TObject);
var
  LLayer: TTMSFNCOpenLayersTileLayer;
begin
  TMSFNCOpenLayers1.BeginUpdate;
  LLayer := TMSFNCOpenLayers1.TileLayers.Add;
  LLayer.Source := tlsXYZ;
  //LLayer.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/10/T/FK/2021/7/S2B_10TFK_20210713_0_L2A/TCI.tif';
  LLayer.URL := 'https://www.code4delphi.com.br/NaturalEarth-II/NE2_HR_LC_SR_W_DR.tif';
  TMSFNCOpenLayers1.EndUpdate;
end;

procedure TGeoTIFFMainView.Button4Click(Sender: TObject);
var
  LLayer: TTMSFNCOpenLayersTileLayer;
begin
  TMSFNCOpenLayers1.BeginUpdate;
  TMSFNCOpenLayers1.Options.DefaultLatitude := -24.24433501024076;
  TMSFNCOpenLayers1.Options.DefaultLongitude := -51.67401306509581;
  TMSFNCOpenLayers1.Options.DefaultZoomLevel := 9;

  LLayer := TMSFNCOpenLayers1.TileLayers.Add;
  LLayer.Source := tlsGeoTiff;
  LLayer.URL := 'http://code4delphi.com.br/Maps/BDGEx/ivaipora2.tif';
  TMSFNCOpenLayers1.EndUpdate;
end;

procedure TGeoTIFFMainView.btnTif01Click(Sender: TObject);
begin
  var LUrl := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/36/Q/WD/2020/7/S2A_36QWD_20200701_0_L2A/TCI.tif';
  var LLatitude := 16.71;
  var LLongitude := 33.51;
  Self.LoadTif(LUrl, LLatitude, LLongitude);

  TMSFNCOpenLayers1.ReInitialize;
end;

procedure TGeoTIFFMainView.btnTif02Click(Sender: TObject);
begin
  var LUrl := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/15/T/UH/2022/6/S2A_15TUH_20220623_0_L2A/TCI.tif';
  var LLatitude := 4.33351373111931;
  var LLongitude := -9.54677751829766;
  Self.LoadTif(LUrl, LLatitude, LLongitude);

  TMSFNCOpenLayers1.ReInitialize;
end;

procedure TGeoTIFFMainView.btnTif03Click(Sender: TObject);
begin
  //var LUrl := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/22/L/PD/2022/2/S2B_22LPD_20220215_0_L2A/TCI.tif';
  var LUrl := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/08/V/JE/2023/8/S2A_08VJE_20230808_0_L2A/TCI.tif';
  var LLatitude := 4.33351373111931;
  var LLongitude := -9.54677751829766;
  Self.LoadTif(LUrl, LLatitude, LLongitude);

  TMSFNCOpenLayers1.ReInitialize;
end;

procedure TGeoTIFFMainView.LoadTif(const AUrl: string; const ALatitude, ALongitude: Double);
var
  LLayer: TTMSFNCOpenLayersTileLayer;
begin
  TMSFNCOpenLayers1.BeginUpdate;
//  TMSFNCOpenLayers1.Options.DefaultLatitude := ALatitude;
//  TMSFNCOpenLayers1.Options.DefaultLongitude := ALongitude;
//  TMSFNCOpenLayers1.Options.DefaultZoomLevel := 9;
  LLayer := TMSFNCOpenLayers1.TileLayers.Add;
  LLayer.Source := tlsGeoTiff;
  LLayer.URL := AUrl;
  TMSFNCOpenLayers1.EndUpdate;
end;

procedure TGeoTIFFMainView.TMSFNCOpenLayers1MapDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  mmLogs.Lines.Add(Format('Latitude, longitude: %e, %e', [AEventData.Coordinate.Latitude, AEventData.Coordinate.Longitude]));
end;

procedure TGeoTIFFMainView.edtLoadTifsClick(Sender: TObject);
begin
  Self.LoadTifs;
end;

procedure TGeoTIFFMainView.LoadTifs;
begin
  TMSFNCOpenLayers1.BeginUpdate;

//  var LLayer1 := TMSFNCOpenLayers1.TileLayers.Add;
//  LLayer1.Source := tlsGeoTiff;
//  LLayer1.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/15/T/UH/2022/6/S2A_15TUH_20220623_0_L2A/TCI.tif';
//
//  var LLayer2 := TMSFNCOpenLayers1.TileLayers.Add;
//  LLayer2.Source := tlsGeoTiff;
//  LLayer2.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/36/Q/WD/2020/7/S2A_36QWD_20200701_0_L2A/TCI.tif';
//
  var LLayer4 := TMSFNCOpenLayers1.TileLayers.Add;
  LLayer4.Source := tlsGeoTiff;
  //LLayer4.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/22/K/DU/2026/1/S2B_22KDU_20260106_0_L2A/TCI.tif';
  //LLayer4.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/22/K/DU/2026/1/S2B_22KDU_20260126_0_L2A/TCI.tif';
  LLayer4.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/22/K/DU/2026/1/S2C_22KDU_20260121_0_L2A/TCI.tif';


  TMSFNCOpenLayers1.EndUpdate;
end;

end.
