program FNCMapsRouteCalculator;

uses
  Vcl.Forms,
  RouteCalculator.Main.View in 'Src\RouteCalculator.Main.View.pas' {RouteCalculatorMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TRouteCalculatorMainView, RouteCalculatorMainView);
  Application.Run;
end.
