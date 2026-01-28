unit TollCost.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  TypInfo,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes,
  Vcl.StdCtrls,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  Vcl.ExtCtrls,
  VCL.TMSFNCTollCost,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCloudBase,
  VCL.TMSFNCGeocoding, StepByStepHTML;

type
  TTollCostMainView = class(TForm)
    pnMapAndBrowser: TPanel;
    pnTop: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter4: TSplitter;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    edtAPIKeyMap: TEdit;
    cBoxServiceMap: TComboBox;
    cBoxLanguage: TComboBox;
    GroupBox2: TGroupBox;
    TMSFNCGeocoding1: TTMSFNCGeocoding;
    TMSFNCTollCost1: TTMSFNCTollCost;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtOrigin: TEdit;
    edtDestination: TEdit;
    cBoxTravelMode: TComboBox;
    cboxCurrency: TComboBox;
    btnShowTollCost: TButton;
    btnClearTollCost: TButton;
    cBoxEmission: TComboBox;
    cBoxCO2: TComboBox;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    edtAPIKeyTollCost: TEdit;
    cBoxServiceTollCost: TComboBox;
    Shape1: TShape;
    Label11: TLabel;
    Shape2: TShape;
    Label12: TLabel;
    edPTVUserName: TEdit;
    Label13: TLabel;
    edPTVToken: TEdit;
    Label14: TLabel;
    edEndPoint: TEdit;
    Splitter3: TSplitter;
    gBoxInstructions: TGroupBox;
    gBoxRouteDetails: TGroupBox;
    Panel2: TPanel;
    lbDistance: TLabel;
    lbDuration: TLabel;
    Label7: TLabel;
    lbTotalCost: TLabel;
    ListBoxTollCost: TListBox;
    pnMap: TPanel;
    Splitter5: TSplitter;
    TMSFNCWebBrowser1: TTMSFNCWebBrowser;
    TMSFNCMaps1: TTMSFNCMaps;
    procedure FormCreate(Sender: TObject);
    procedure btnShowTollCostClick(Sender: TObject);
    procedure btnClearTollCostClick(Sender: TObject);
    procedure TMSFNCGeocoding1GetGeocoding(Sender: TObject;
      const ARequest: TTMSFNCGeocodingRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure TMSFNCTollCost1GetTollCost(Sender: TObject;
      const ARequest: TTMSFNCTollCostRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure cBoxServiceMapChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxServiceTollCostChange(Sender: TObject);
    procedure edtAPIKeyTollCostExit(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure FillcBoxServiceMap;
  public
    oc, dc: TTMSFNCMapsCoordinateRec;
  end;

var
  TollCostMainView: TTollCostMainView;

implementation

{$R *.dfm}

procedure TTollCostMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Self.FillcBoxServiceMap;
  cBoxServiceMap.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);

//  Self.FillcBoxServiceTollCost;
//  cBoxServiceTollCost.ItemIndex := Integer(TTMSFNCDirectionsService.dsGoogle);

  Self.ConfigBasicMaps;
end;

procedure TTollCostMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxServiceMap.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.Options.Locale := copy(cBoxLanguage.Text, 1, 5);
  TMSFNCMaps1.EndUpdate;

  TMSFNCGeocoding1.APIKey := edtAPIKeyMap.Text;
  TMSFNCGeocoding1.Service := TTMSFNCGeocodingService(cBoxServiceMap.ItemIndex); //gsHere

  if cBoxServiceTollCost.ItemIndex = 0 then
  begin
    TMSFNCTollCost1.Service := tcsHere;
    TMSFNCTollCost1.APIKey := edtAPIKeyTollCost.Text;
  end
  else
  begin
    TMSFNCTollCost1.Service := tcsPTVxServer;
    TMSFNCTollCost1.UserName := edPTVUserName.Text;
    TMSFNCTollCost1.Token := edPTVToken.Text;
    TMSFNCTollCost1.ServiceEndpoint := edEndPoint.Text;
  end;


  TMSFNCWebBrowser1.LoadHTML('');
  lbDistance.Caption := '';
  lbDuration.Caption := '';
end;

procedure TTollCostMainView.cBoxServiceMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TTollCostMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TTollCostMainView.cBoxServiceTollCostChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TTollCostMainView.edtAPIKeyTollCostExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TTollCostMainView.cBoxLanguageChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
  TMSFNCMaps1.ReInitialize;
end;

procedure TTollCostMainView.FillcBoxServiceMap;
var
  LService: TTMSFNCMapsService;
begin
  cBoxServiceMap.Items.Clear;

  for LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
    cBoxServiceMap.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
end;

procedure TTollCostMainView.btnClearTollCostClick(Sender: TObject);
begin
  btnShowTollCost.Enabled := True;
  TMSFNCMaps1.Clear;
  TMSFNCWebBrowser1.LoadHTML('');
  lbTotalCost.Caption := '';
  lbDistance.Caption := '';
  lbDuration.Caption := '';
  ListBoxTollCost.Items.Clear;
end;

procedure TTollCostMainView.btnShowTollCostClick(Sender: TObject);
begin
  if (edtOrigin.Text <> '') and (edtDestination.Text <> '') then
  begin
    btnShowTollCost.Enabled := False;
    TMSFNCGeocoding1.GeocodingRequests.Clear;
    TMSFNCGeocoding1.GetGeocoding(edtOrigin.Text);
    TMSFNCGeocoding1.GetGeocoding(edtDestination.Text);
  end
  else
    ShowMessage('Please fill in the Origin and Destination fields first.');
end;

procedure TTollCostMainView.TMSFNCGeocoding1GetGeocoding(Sender: TObject;
  const ARequest: TTMSFNCGeocodingRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
  tm: TTMSFNCTollCostTravelMode;
  wps: TTMSFNCMapsCoordinateRecArray;
  tc: TTMSFNCTollCostCurrency;
  reqcount: integer;
  et: TTMSFNCTollCostEmissionType;
  co2: TTMSFNCTollCostCO2Class;
begin
  reqcount := 2;

  if ARequest.ErrorMessage <> '' then
  begin
    ShowMessage(ARequest.ErrorMessage);
  end
  else
  begin
    if TMSFNCGeocoding1.GeocodingRequests.Count = reqcount then
    begin
      if (TMSFNCGeocoding1.GeocodingRequests[0].Items.Count = 0) or (TMSFNCGeocoding1.GeocodingRequests[0].Items.Count = 0) then
      begin
        ShowMessage('Unknown location');
      end
      else
      begin
        oc := TMSFNCGeocoding1.GeocodingRequests[0].Items[0].Coordinate.ToRec;
        dc := TMSFNCGeocoding1.GeocodingRequests[1].Items[0].Coordinate.ToRec;

        TMSFNCTollCost1.TollCostRequests.Clear;

        TMSFNCMaps1.Clear;
        TMSFNCMaps1.AddMarker(oc);
        TMSFNCMaps1.AddMarker(dc);

        case cBoxCurrency.ItemIndex of
           0: tc := tcEUR;
           1: tc := tcUSD;
           2: tc := tcGBP;
           3: tc := tcBRL;
           4: tc := tcCAD;
        end;

        tm := ttCar;
        if cBoxTravelMode.ItemIndex = 1 then
        begin
          tm := ttCustom;
          TMSFNCTollCost1.Options.TravelInfo.VehicleAxles := 3;
          TMSFNCTollCost1.Options.TravelInfo.VehicleWeight := 7501;
          TMSFNCTollCost1.Options.TravelInfo.VehicleHeight := 299;
        end;

        case cBoxEmission.ItemIndex of
          0: et := etUnknown;
          1: et := etEuroEev;
          2: et := etEuro6;
          3: et := etEuro5;
          4: et := etEuro4;
          5: et := etEuro3;
          6: et := etEuro2;
          7: et := etEuro1;
        end;
        TMSFNCTollCost1.Options.TravelInfo.VehicleEmissionType := et;

        case cBoxCO2.ItemIndex of
          0: co2 := co2Unknown;
          1: co2 := co2Class1;
          2: co2 := co2Class2;
          3: co2 := co2Class3;
          4: co2 := co2Class4;
          5: co2 := co2Class5;
        end;
        TMSFNCTollCost1.Options.TravelInfo.VehicleCO2Class := co2;

        TMSFNCTollCost1.GetTollCost(oc, dc, nil, '', nil, tm, wps, tc, 'en');
      end;
    end;
  end;
end;

procedure TTollCostMainView.TMSFNCTollCost1GetTollCost(Sender: TObject;
  const ARequest: TTMSFNCTollCostRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
  LTollCostItem: TTMSFNCTollCostItem;
begin
  btnShowTollCost.Enabled := True;
  if ARequest.ErrorMessage <> '' then
  begin
    ShowMessage(ARequest.ErrorMessage);
    Exit;
  end;

  if TMSFNCTollCost1.TollCostRequests.Count > 0 then
  begin
    if TMSFNCTollCost1.TollCostRequests[0].Items.Count > 0 then
    begin
      LTollCostItem := TMSFNCTollCost1.TollCostRequests[0].Items[0];
      lbTotalCost.Caption := LTollCostItem.Currency + ' ' + FloatToStr(LTollCostItem.TotalCost);
      lbDistance.Caption := FloatToStr(Round(LTollCostItem.Distance / 1000)) + ' km';
      lbDuration.Caption := FloatToStr(Round(LTollCostItem.Duration / 60)) + ' min';

      TStepByStepHTML.Add(TMSFNCWebBrowser1, LTollCostItem);

      ListBoxTollCost.Items.Clear;
      for var I := 0 to LTollCostItem.TollSystems.Count - 1 do
        ListBoxTollCost.Items.Add(LTollCostItem.TollSystems.Items[I].Summary + ' | ' + LTollCostItem.Currency + ' ' + FormatFloat('0.00', LTollCostItem.TollSystems.Items[I].Cost));

      TMSFNCMaps1.ZoomToBounds(LTollCostItem.Coordinates.ToArray);
      TMSFNCMaps1.AddPolyline(LTollCostItem.Coordinates.ToArray);
    end;
  end;
end;

end.
