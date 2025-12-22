program FNCMapsMarkers;

uses
  Vcl.Forms,
  Markers.Main.View in 'Src\Markers.Main.View.pas' {MarkersMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMarkersMainView, MarkersMainView);
  Application.Run;
end.
