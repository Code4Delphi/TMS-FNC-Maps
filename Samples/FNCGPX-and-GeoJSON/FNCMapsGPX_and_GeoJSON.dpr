program FNCMapsGPX_and_GeoJSON;

uses
  Vcl.Forms,
  GPXGeoJSON.Main.View in 'Src\GPXGeoJSON.Main.View.pas' {GPXGeoJSONMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGPXGeoJSONMainView, GPXGeoJSONMainView);
  Application.Run;
end.
