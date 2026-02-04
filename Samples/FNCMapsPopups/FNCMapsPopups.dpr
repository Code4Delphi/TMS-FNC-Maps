program FNCMapsPopups;

uses
  Vcl.Forms,
  Popups.Main.View in 'Src\Popups.Main.View.pas' {PopupsMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPopupsMainView, PopupsMainView);
  Application.Run;
end.
