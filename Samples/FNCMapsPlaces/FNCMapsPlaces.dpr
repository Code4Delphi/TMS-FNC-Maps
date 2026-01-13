program FNCMapsPlaces;

uses
  Vcl.Forms,
  Places.Main.View in 'Src\Places.Main.View.pas' {PlacesMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPlacesMainView, PlacesMainView);
  Application.Run;
end.
