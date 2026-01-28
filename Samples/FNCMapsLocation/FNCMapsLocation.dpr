program FNCMapsLocation;

uses
  Vcl.Forms,
  Location.Main.View in 'Src\Location.Main.View.pas' {LocationMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLocationMainView, LocationMainView);
  Application.Run;
end.
