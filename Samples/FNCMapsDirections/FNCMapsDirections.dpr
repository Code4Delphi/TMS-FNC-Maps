program FNCMapsDirections;

uses
  Vcl.Forms,
  Directions.Main.View in 'Src\Directions.Main.View.pas' {DirectionsMainView},
  StepByStepHTML in 'Src\StepByStepHTML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDirectionsMainView, DirectionsMainView);
  Application.Run;
end.
