program FNCMapsPolygons;

uses
  Vcl.Forms,
  Polygons.Main.View in 'Src\Polygons.Main.View.pas' {PolygonsMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPolygonsMainView, PolygonsMainView);
  Application.Run;
end.
