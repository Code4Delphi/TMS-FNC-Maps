program FNCMapsTollCost;

uses
  Vcl.Forms,
  TollCost.Main.View in 'Src\TollCost.Main.View.pas' {TollCostMainView},
  StepByStepHTML in 'Src\StepByStepHTML.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTollCostMainView, TollCostMainView);
  Application.Run;
end.
