program FNCMapsFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Main.View in 'Src\FMX.Main.View.pas' {FMXMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMXMainView, FMXMainView);
  Application.Run;
end.
