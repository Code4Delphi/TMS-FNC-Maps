unit Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  VCL.TMSFNCOpenLayers,
  Vcl.StdCtrls;

type
  TMainView = class(TForm)
    pnTop: TPanel;
    TMSFNCOpenLayers1: TTMSFNCOpenLayers;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    btnSetConfigurations: TButton;
    edtTileServer: TEdit;
    Label2: TLabel;
    cBoxLibraryLocation: TComboBox;
    procedure btnSetConfigurationsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCOpenLayers1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
  private
    procedure ConfigBasicMaps;
  public

  end;

var
  MainView: TMainView;

implementation

{$R *.dfm}

procedure TMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
end;

procedure TMainView.btnSetConfigurationsClick(Sender: TObject);
begin
  Self.ConfigBasicMaps;
  TMSFNCOpenLayers1.SetCenterCoordinate(47.404901, -351.394401);
end;

procedure TMainView.ConfigBasicMaps;
begin
  TMSFNCOpenLayers1.BeginUpdate;
  TMSFNCOpenLayers1.LibraryLocation := TTMSFNCMapsLibraryLocation(cBoxLibraryLocation.ItemIndex);

  TMSFNCOpenLayers1.Options.TileServer := '';
  if TMSFNCOpenLayers1.LibraryLocation = TTMSFNCMapsLibraryLocation.llOffline then
    TMSFNCOpenLayers1.Options.TileServer := edtTileServer.Text;

  TMSFNCOpenLayers1.EndUpdate;
end;

procedure TMainView.TMSFNCOpenLayers1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  //Memo1.Lines.Add(AEventData.Coordinate.Latitude.ToString);
  //Memo1.Lines.Add(AEventData.Coordinate.Longitude.ToString);
end;

end.
