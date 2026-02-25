unit FMX.Main.View;

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
  FMX.ListBox,
  FMX.TMSFNCTypes,
  FMX.TMSFNCUtils,
  FMX.TMSFNCGraphics,
  FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCMapsCommonTypes,
  FMX.TMSFNCCustomControl,
  FMX.TMSFNCWebBrowser,
  FMX.TMSFNCMaps,
  FMX.TMSFNCGoogleMaps,
  FMX.TMSFNCCustomComponent,
  FMX.TMSFNCRouteCalculator,
  FMX.TMSFNCGeocoding,
  FMX.TMSFNCCloudBase;

type
  TFMXMainView = class(TForm)
    pnHeader: TPanel;
    ImageLogo: TImage;
    Label1: TLabel;
    TabControl1: TTabControl;
    tabConfig: TTabItem;
    S: TGroupBox;
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
    edtRouteCalculator: TButton;
    TMSFNCRouteCalculator1: TTMSFNCRouteCalculator;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1MapDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure edtRouteCalculatorClick(Sender: TObject);
    procedure TMSFNCRouteCalculator1GetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
  private
    procedure FillcBoxService;
    procedure ConfigBasicMaps;
  public

  end;

var
  FMXMainView: TFMXMainView;

implementation

{$R *.fmx}

procedure TFMXMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  TabControl1.ActiveTab := tabConfig;
  Self.FillcBoxService;
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);
  Self.ConfigBasicMaps;
end;

procedure TFMXMainView.FillcBoxService;
var
  LService: TTMSFNCMapsService;
begin
  cBoxService.Items.Clear;

  for LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
    cBoxService.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
end;

procedure TFMXMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKey.Text;
  TMSFNCMaps1.Options.Locale := copy(cBoxLanguage.Text, 1, 5);
  TMSFNCMaps1.EndUpdate;

  TMSFNCRouteCalculator1.Service := TTMSFNCRouteCalculatorService.csGoogle; //TTMSFNCRouteCalculatorService(cBoxService.ItemIndex);
  TMSFNCRouteCalculator1.APIKey := edtAPIKey.Text;
end;

procedure TFMXMainView.btnConfirmClick(Sender: TObject);
begin
  Self.ConfigBasicMaps;
  TabControl1.ActiveTab := tabMap;
end;

procedure TFMXMainView.TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckAddMarkerOnClick.IsChecked then
  begin
    TMSFNCMaps1.BeginUpdate;
    TMSFNCMaps1.AddMarker(AEventData.Coordinate.ToRec, 'Market My', 'https://code4delphi.com.br/img/c4d.png');
    TMSFNCMaps1.EndUpdate;
  end;
end;

procedure TFMXMainView.TMSFNCMaps1MapDblClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  TMSFNCMaps1.AddMarker(AEventData.Coordinate.ToRec);
end;

procedure TFMXMainView.edtRouteCalculatorClick(Sender: TObject);
begin
  TMSFNCRouteCalculator1.GetGeocoding(edtAddress.Text);
end;

procedure TFMXMainView.TMSFNCRouteCalculator1GetGeocoding(Sender: TObject; const ARequest: TTMSFNCGeocodingRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
  if ARequestResult.Success and (ARequest.Items.Count > 0) then
  begin
    TMSFNCMaps1.ZoomToBounds(ARequest.Items[0].Coordinate.ToRec, ARequest.Items[0].Coordinate.ToRec);
    TMSFNCMaps1.SetZoomLevel(19);
  end;
end;

end.
