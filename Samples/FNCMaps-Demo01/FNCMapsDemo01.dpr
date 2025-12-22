program FNCMapsDemo01;

uses
  Vcl.Forms,
  Demo01.Main.View in 'Src\Demo01.Main.View.pas' {Demo01MainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDemo01MainView, Demo01MainView);
  Application.Run;
end.
