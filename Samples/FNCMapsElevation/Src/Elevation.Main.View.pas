unit Elevation.Main.View;

interface

uses
  TypInfo,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
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
  Vcl.Grids,
  Vcl.DBGrids,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes,
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCloudBase,
  VCL.TMSFNCElevation,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps;

type
  TElevationMainView = class(TForm)
    pnTop: TPanel;
    GroupBox3: TGroupBox;
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
    edtAPIKeyElevation: TEdit;
    cBoxServiceElevation: TComboBox;
    btnGetElevation: TButton;
    Splitter3: TSplitter;
    btnClearElevationData: TButton;
    TMSFNCElevation1: TTMSFNCElevation;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    Splitter2: TSplitter;
    btnListElevationData: TButton;
    ckGeElevationOnClickMap: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxServiceMapChange(Sender: TObject);
    procedure ckHistoryEnabledClick(Sender: TObject);
    procedure btnClearElevationDataClick(Sender: TObject);
    procedure btnGetElevationClick(Sender: TObject);
    procedure TMSFNCElevation1GetElevation(Sender: TObject; const ARequest: TTMSFNCElevationRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnListElevationDataClick(Sender: TObject);
  private
    FCoordinateRec: TTMSFNCMapsCoordinateRec;
    procedure ConfigBasicMaps;
    procedure FillcBoxServiceMap;
    procedure FillcBoxServiceElevation;
  public
  end;

var
  ElevationMainView: TElevationMainView;

implementation

{$R *.dfm}

procedure TElevationMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';

  Self.FillcBoxServiceMap;
  cBoxServiceMap.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);

  Self.FillcBoxServiceElevation;
  cBoxServiceElevation.ItemIndex := Integer(TTMSFNCElevationService.esGoogle);

  Self.ConfigBasicMaps;
end;

procedure TElevationMainView.FillcBoxServiceMap;
var
  LService: TTMSFNCMapsService;
begin
  cBoxServiceMap.Items.Clear;

  for LService := Low(TTMSFNCMapsService) to High(TTMSFNCMapsService) do
    cBoxServiceMap.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapsService), Ord(LService)));
end;

procedure TElevationMainView.FillcBoxServiceElevation;
var
  LService: TTMSFNCElevationService;
begin
  cBoxServiceElevation.Items.Clear;

  for LService := Low(TTMSFNCElevationService) to High(TTMSFNCElevationService) do
    cBoxServiceElevation.Items.Add(GetEnumName(TypeInfo(TTMSFNCElevationService), Ord(LService)));
end;

procedure TElevationMainView.cBoxServiceMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TElevationMainView.ckHistoryEnabledClick(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TElevationMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TElevationMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxServiceMap.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;

  TMSFNCElevation1.APIKey := edtAPIKeyElevation.Text;
  TMSFNCElevation1.Service := TTMSFNCElevationService(cBoxServiceElevation.ItemIndex);

  TMSFNCMaps1.EndUpdate;
end;

procedure TElevationMainView.btnGetElevationClick(Sender: TObject);
begin
  FCoordinateRec.Latitude := 40.689908;
  FCoordinateRec.Longitude := -74.045154;
  TMSFNCElevation1.GetElevation(FCoordinateRec);

  TMSFNCMaps1.AddMarker(FCoordinateRec);
  TMSFNCMaps1.ZoomToBounds(TMSFNCMaps1.Markers.ToCoordinateArray)
end;

procedure TElevationMainView.TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckGeElevationOnClickMap.Checked then
  begin
    FCoordinateRec := AEventData.Coordinate.ToRec;
    TMSFNCElevation1.GetElevation(FCoordinateRec);
    TMSFNCMaps1.AddMarker(FCoordinateRec);
  end;
end;

procedure TElevationMainView.TMSFNCElevation1GetElevation(Sender: TObject; const ARequest: TTMSFNCElevationRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
var
  LMsg: string;
begin
  LMsg := Format('Latitude: %.6f e Longitude: %.6f ', [FCoordinateRec.Latitude, FCoordinateRec.Longitude]);

  if not TMSFNCElevation1.FindElevation(FCoordinateRec) then
  begin
    Memo1.Lines.Add(LMsg + 'Altitude not found. ' + ARequest.Status + ' ' + ARequest.ErrorMessage);
    Exit;
  end;

  Memo1.Lines.Add(LMsg + Format('Elevation: %.3f ', [FCoordinateRec.Elevation]))
end;

procedure TElevationMainView.btnListElevationDataClick(Sender: TObject);
var
  LItem: TTMSFNCMapsCoordinateRec;
begin
  if Length(TMSFNCElevation1.ElevationData) <= 0 then
  begin
    ShowMessage('ElevationData is empty');
    Exit;
  end;

  Memo1.Lines.Clear;

  for var i := 0 to Length(TMSFNCElevation1.ElevationData) - 1 do
  begin
    LItem := TMSFNCElevation1.ElevationData[i];

    var LMsg := Format('Latitude: %.6f e Longitude: %.6f - Elevation: %.3f ', [LItem.Latitude, LItem.Longitude, LItem.Elevation]);
    Memo1.Lines.Add(LMsg);
  end;
end;

procedure TElevationMainView.btnClearElevationDataClick(Sender: TObject);
begin
  TMSFNCElevation1.ClearElevationData;
  Memo1.Lines.Clear;
  TMSFNCMaps1.ClearMarkers;
end;
end.
