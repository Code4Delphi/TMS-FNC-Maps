program FNCMapsLabels;

uses
  Vcl.Forms,
  Labels.Main.View in 'Src\Labels.Main.View.pas' {LabelsMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLabelsMainView, LabelsMainView);
  Application.Run;
end.
