unit Main.View;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  TypInfo,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.TabControl,
  FMX.TMSFNCTypes,
  FMX.TMSFNCUtils,
  FMX.TMSFNCGraphics,
  FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCMapsCommonTypes,
  FMX.TMSFNCCustomControl,
  FMX.TMSFNCWebBrowser,
  FMX.TMSFNCMaps,
  FMX.TMSFNCGoogleMaps,
  FMX.ListBox;

type
  TMainView = class(TForm)
    pnHeader: TPanel;
    ImageLogo: TImage;
    Label1: TLabel;
    TabControl1: TTabControl;
    tabConfig: TTabItem;
    gBoxConfigs: TGroupBox;
    lbService: TLabel;
    lbAPIKey: TLabel;
    edtAPIKey: TEdit;
    lbLanguage: TLabel;
    Panel1: TPanel;
    btnConfirm: TButton;
    tabMap: TTabItem;
    TabControlProducts: TTabControl;
    pnMap: TPanel;
    TMSFNCMaps1: TTMSFNCMaps;
    cBoxService: TComboBox;
    cBoxLanguage: TComboBox;
    Expander1: TExpander;
    ckAddMarkerOnClick: TCheckBox;
    Label2: TLabel;
    edtAddress: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1MapDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
  private
    procedure FillcBoxService;
    procedure ConfigBasicMaps;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainView: TMainView;

implementation

{$R *.fmx}

procedure TMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  TabControl1.ActiveTab := tabConfig;
  Self.FillcBoxService;
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);
  Self.ConfigBasicMaps;
end;

procedure TMainView.FillcBoxService;
var
  LService: TTMSFNCMapsService;
begin
  cBoxService.Items.Clear;

  for LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
    cBoxService.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
end;

procedure TMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKey.Text;
  TMSFNCMaps1.Options.Locale := copy(cBoxLanguage.Text, 1, 5);
  TMSFNCMaps1.EndUpdate;
end;

procedure TMainView.btnConfirmClick(Sender: TObject);
begin
  Self.ConfigBasicMaps;
  TabControl1.ActiveTab := tabMap;
end;

procedure TMainView.TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckAddMarkerOnClick.IsChecked then
  begin
    TMSFNCMaps1.BeginUpdate;
    TMSFNCMaps1.AddMarker(AEventData.Coordinate.ToRec, 'Market My', 'https://code4delphi.com.br/img/c4d.png');
    TMSFNCMaps1.EndUpdate;
  end;
end;

procedure TMainView.TMSFNCMaps1MapDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  TMSFNCMaps1.AddMarker(AEventData.Coordinate.ToRec);
end;

end.
