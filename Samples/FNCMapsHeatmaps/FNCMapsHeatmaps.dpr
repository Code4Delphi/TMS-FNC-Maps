program FNCMapsHeatmaps;

uses
  Vcl.Forms,
  Heatmaps.Main.View in 'Src\Heatmaps.Main.View.pas' {HeatmapsMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(THeatmapsMainView, HeatmapsMainView);
  Application.Run;
end.
