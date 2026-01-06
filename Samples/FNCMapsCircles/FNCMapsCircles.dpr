program FNCMapsCircles;

uses
  Vcl.Forms,
  Circles.Main.View in 'Src\Circles.Main.View.pas' {CirclesMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCirclesMainView, CirclesMainView);
  Application.Run;
end.
