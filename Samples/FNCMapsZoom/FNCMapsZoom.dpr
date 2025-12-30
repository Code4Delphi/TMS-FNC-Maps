program FNCMapsZoom;

uses
  Vcl.Forms,
  Zoom.Main.View in 'Src\Zoom.Main.View.pas' {ZoomMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TZoomMainView, ZoomMainView);
  Application.Run;
end.
