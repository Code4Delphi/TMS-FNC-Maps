program FNCMapsGeoTIFF;

uses
  Vcl.Forms,
  GeoTIFF.Main.View in 'Src\GeoTIFF.Main.View.pas' {GeoTIFFMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGeoTIFFMainView, GeoTIFFMainView);
  Application.Run;
end.
