program FNCMapsElementContainers;

uses
  Vcl.Forms,
  ElementContainers.Main.View in 'Src\ElementContainers.Main.View.pas' {ElementContainersMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TElementContainersMainView, ElementContainersMainView);
  Application.Run;
end.
