program FNCMapsRectangles;

uses
  Vcl.Forms,
  Rectangles.Main.View in 'Src\Rectangles.Main.View.pas' {RectanglesMainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TRectanglesMainView, RectanglesMainView);
  Application.Run;
end.
