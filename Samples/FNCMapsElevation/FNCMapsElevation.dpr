program FNCMapsElevation;

uses
  Vcl.Forms,
  Elevation.Main.View in 'Src\Elevation.Main.View.pas' {ElevationMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TElevationMainView, ElevationMainView);
  Application.Run;
end.
