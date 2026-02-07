program FNCMaps3D;

uses
  Vcl.Forms,
  Maps3D.Main.View in 'Src\Maps3D.Main.View.pas' {Maps3DMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMaps3DMainView, Maps3DMainView);
  Application.Run;
end.
