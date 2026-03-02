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
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

var
  GeoTIFFMainView: TGeoTIFFMainView;

implementation

{$R *.dfm}

procedure TGeoTIFFMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Button1.Click;
end;

procedure TGeoTIFFMainView.Button1Click(Sender: TObject);
var
  LLayer: TTMSFNCOpenLayersTileLayer;
begin
  TMSFNCOpenLayers1.BeginUpdate;
  TMSFNCOpenLayers1.Options.DefaultLatitude := 16.71;
  TMSFNCOpenLayers1.Options.DefaultLongitude := 33.51;
  TMSFNCOpenLayers1.Options.DefaultZoomLevel := 9;

  LLayer := TMSFNCOpenLayers1.TileLayers.Add;
  LLayer.Source := tlsGeoTiff;
  //LLayer.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/10/T/FK/2021/7/S2B_10TFK_20210713_0_L2A/TCI.tif';
  LLayer.URL := 'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a-cogs/15/T/UH/2022/6/S2A_15TUH_20220623_0_L2A/TCI.tif';
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

end.
