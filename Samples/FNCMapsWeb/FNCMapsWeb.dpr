program FNCMapsWeb;

uses
  Vcl.Forms,
  WEBLib.Forms,
  Web.Main.View in 'Src\Web.Main.View.pas' {MainView: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
