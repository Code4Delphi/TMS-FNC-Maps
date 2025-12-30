program FNCMapsPolygonsGoogle;

uses
  Vcl.Forms,
  PolygonsGoogle.Main.View in 'Src\PolygonsGoogle.Main.View.pas' {PolygonsGoogleMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPolygonsGoogleMainView, PolygonsGoogleMainView);
  Application.Run;
end.
