program FNCTimeZone;

uses
  Vcl.Forms,
  TimeZone.Main.View in 'Src\TimeZone.Main.View.pas' {TimeZoneMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTimeZoneMainView, TimeZoneMainView);
  Application.Run;
end.
