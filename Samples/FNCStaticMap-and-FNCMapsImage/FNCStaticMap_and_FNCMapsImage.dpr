program FNCStaticMap_and_FNCMapsImage;

uses
  Vcl.Forms,
  StaticMap.Main.View in 'Src\StaticMap.Main.View.pas' {StaticMapMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TStaticMapMainView, StaticMapMainView);
  Application.Run;
end.
