program FNCMaps_AI_TipsPlaces;



uses
  Vcl.Forms,
  AI.TipsPlaces.Main.View in 'Src\AI.TipsPlaces.Main.View.pas' {AITipsPlacesMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TAITipsPlacesMainView, AITipsPlacesMainView);
  Application.Run;
end.
