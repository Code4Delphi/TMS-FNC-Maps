program FNCMapsGeocoding;

uses
  Vcl.Forms,
  Geocoding.Main.View in 'Src\Geocoding.Main.View.pas' {GeocodingMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGeocodingMainView, GeocodingMainView);
  Application.Run;
end.
