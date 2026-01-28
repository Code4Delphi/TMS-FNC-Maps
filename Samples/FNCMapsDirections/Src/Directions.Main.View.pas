unit Directions.Main.View;

interface

uses
  TypInfo,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  Math,
  System.RegularExpressions,
  Clipbrd,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  Datasnap.DBClient,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCMaps,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCloudBase,
  VCL.TMSFNCDirections,
  StepByStepHTML;

type
  TDirectionsMainView = class(TForm)
    pnTop: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    Splitter1: TSplitter;
    Label2: TLabel;
    cBoxServiceMap: TComboBox;
    TMSFNCMaps1: TTMSFNCMaps;
    Shape1: TShape;
    Label1: TLabel;
    Label4: TLabel;
    edtAPIKeyDirections: TEdit;
    cBoxServiceDirections: TComboBox;
    GroupBox2: TGroupBox;
    btnGetDirections: TButton;
    Label8: TLabel;
    edtStartAddress: TEdit;
    Label9: TLabel;
    edtEndAddress: TEdit;
    Splitter2: TSplitter;
    TMSFNCDirections1: TTMSFNCDirections;
    pnBothMaps: TPanel;
    TMSFNCWebBrowser1: TTMSFNCWebBrowser;
    Splitter3: TSplitter;
    GroupBox3: TGroupBox;
    mmStepByStep: TMemo;
    Splitter4: TSplitter;
    Label3: TLabel;
    cBoxLanguage: TComboBox;
    ckAlternatives: TCheckBox;
    Label7: TLabel;
    cBoxTravelMode: TComboBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxServiceMapChange(Sender: TObject);
    procedure ckHistoryEnabledClick(Sender: TObject);
    procedure btnGetDirectionsClick(Sender: TObject);
    procedure TMSFNCDirections1GetDirections(Sender: TObject; const ARequest: TTMSFNCDirectionsRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure Button1Click(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure FillcBoxServiceMap;
    procedure FillcBoxServiceDirections;
    procedure FillcBoxTravelMode;
    procedure AddStepByStepMemo(ADirectionsItem: TTMSFNCDirectionsItem);
    function RemoveTagHTML(const AText: string): string;
  public
  end;

var
  DirectionsMainView: TDirectionsMainView;

implementation

{$R *.dfm}

procedure TDirectionsMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Self.FillcBoxServiceMap;
  cBoxServiceMap.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);

  Self.FillcBoxServiceDirections;
  cBoxServiceDirections.ItemIndex := Integer(TTMSFNCDirectionsService.dsGoogle);

  Self.FillcBoxTravelMode;
  cBoxTravelMode.ItemIndex := Integer(TTMSFNCDirectionsTravelMode.tmDriving);

  Self.ConfigBasicMaps;
end;

procedure TDirectionsMainView.FillcBoxServiceMap;
var
  LService: TTMSFNCMapsService;
begin
  cBoxServiceMap.Items.Clear;

  for LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
    cBoxServiceMap.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
end;

procedure TDirectionsMainView.FillcBoxServiceDirections;
var
  LService: TTMSFNCDirectionsService;
begin
  cBoxServiceDirections.Items.Clear;

  for LService := Low(TTMSFNCDirectionsService) to High(TTMSFNCDirectionsService) do
    cBoxServiceDirections.Items.Add(GetEnumName(TypeInfo(TTMSFNCDirectionsService), Ord(LService)));
end;

procedure TDirectionsMainView.FillcBoxTravelMode;
var
  LService: TTMSFNCDirectionsTravelMode;
begin
  cBoxTravelMode.Items.Clear;

  for LService := Low(TTMSFNCDirectionsTravelMode) to High(TTMSFNCDirectionsTravelMode) do
    cBoxTravelMode.Items.Add(GetEnumName(TypeInfo(TTMSFNCDirectionsTravelMode), Ord(LService)));
end;

procedure TDirectionsMainView.cBoxLanguageChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
  TMSFNCMaps1.ReInitialize;
end;

procedure TDirectionsMainView.cBoxServiceMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TDirectionsMainView.ckHistoryEnabledClick(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TDirectionsMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TDirectionsMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxServiceMap.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.Options.Locale := copy(cBoxLanguage.Text, 1, 5);

  TMSFNCDirections1.APIKey := edtAPIKeyDirections.Text;
  TMSFNCDirections1.Service := TTMSFNCDirectionsService(cBoxServiceDirections.ItemIndex);

  TMSFNCMaps1.EndUpdate;
end;

procedure TDirectionsMainView.btnGetDirectionsClick(Sender: TObject);
begin
  var LAlternatives := ckAlternatives.Checked;
  var LId := '';
  var LTravelMode := TTMSFNCDirectionsTravelMode(cBoxTravelMode.ItemIndex);
  var LLocale := copy(cBoxLanguage.Text, 1, 5);

  TMSFNCMaps1.Polylines.Clear;
  TMSFNCDirections1.GetDirections(edtStartAddress.Text, edtEndAddress.Text, nil, LId, nil, LAlternatives, LTravelMode,
    nil, False, LLocale, mlmCountry);
end;

procedure TDirectionsMainView.Button1Click(Sender: TObject);
begin
  TMSFNCMaps1.Polylines.Clear;
end;

procedure TDirectionsMainView.TMSFNCDirections1GetDirections(Sender: TObject; const ARequest: TTMSFNCDirectionsRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
  LDirectionsItem: TTMSFNCDirectionsItem;
  LRecArrayArray: TTMSFNCMapsCoordinateRecArrayArray;
begin
  if ARequest.Items.Count <= 0 then
    Exit;

  TMSFNCMaps1.BeginUpdate;

  SetLength(LRecArrayArray, ARequest.Items.Count);
  for var i := 0 to Pred(ARequest.Items.Count) do
  begin
    LDirectionsItem := ARequest.Items[i];
    LRecArrayArray[i] := LDirectionsItem.Coordinates.ToArray;
    TMSFNCMaps1.AddPolyline(LDirectionsItem.Coordinates.ToArray).StrokeColor := gcRed;

    Self.AddStepByStepMemo(LDirectionsItem);
    TStepByStepHTML.Add(TMSFNCWebBrowser1, LDirectionsItem);
  end;

  TMSFNCMaps1.ZoomToBounds(LRecArrayArray);
  TMSFNCMaps1.EndUpdate;
end;

function TDirectionsMainView.RemoveTagHTML(const AText: string): string;
begin
  Result := TRegEx.Replace(AText, '<[^>]*>', '');
end;

procedure TDirectionsMainView.AddStepByStepMemo(ADirectionsItem: TTMSFNCDirectionsItem);
begin
  mmStepByStep.Lines.Clear;

  if not Assigned(ADirectionsItem) then
    Exit;

  mmStepByStep.Lines.Add('Total Distance: ' + TTMSFNCUtils.FloatToStrDot(Ceil(ADirectionsItem.Distance / 1000)) + ' km');
  mmStepByStep.Lines.Add('Total Duration: ' + TimeToStr(ADirectionsItem.Duration / SecsPerDay));
  mmStepByStep.Lines.Add('');

  for var i := 0 to Pred(ADirectionsItem.Steps.Count) do
  begin
    mmStepByStep.Lines.Add('#' + Succ(i).ToString);
    mmStepByStep.Lines.Add('Distance: ' + TTMSFNCUtils.FloatToStrDot(Ceil(ADirectionsItem.Steps[i].Distance / 1000)) + ' km');
    mmStepByStep.Lines.Add('Duration: ' + TimeToStr(ADirectionsItem.Steps[i].Duration / SecsPerDay));
    mmStepByStep.Lines.Add(Self.RemoveTagHTML(ADirectionsItem.Steps[i].Instructions));
    mmStepByStep.Lines.Add('');
  end;
end;

end.










