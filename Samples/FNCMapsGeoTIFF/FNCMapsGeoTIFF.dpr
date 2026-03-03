program FNCMapsGeoTIFF;

uses
  Vcl.Forms,
  GeoTIFF.Main.View in 'Src\GeoTIFF.Main.View.pas' {GeoTIFFMainView},
  Sentinel2.Utils in 'Src\Sentinel2.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGeoTIFFMainView, GeoTIFFMainView);
  Application.Run;
end.
