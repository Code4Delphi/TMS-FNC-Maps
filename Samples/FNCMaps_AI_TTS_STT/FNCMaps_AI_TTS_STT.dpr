program FNCMaps_AI_TTS_STT;



uses
  Vcl.Forms,
  SpeechMap.Main.View in 'Src\SpeechMap.Main.View.pas' {SpeechMapMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TSpeechMapMainView, SpeechMapMainView);
  Application.Run;
end.
