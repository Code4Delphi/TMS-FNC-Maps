program FNCMapsDirections;

uses
  Vcl.Forms,
  Directions.Main.View in 'Src\Directions.Main.View.pas' {DirectionsMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDirectionsMainView, DirectionsMainView);
  Application.Run;
end.
