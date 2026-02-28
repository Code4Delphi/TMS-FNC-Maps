unit AI.TipsPlaces.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.JSON,
  System.Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  Vcl.ExtCtrls,  
  VCL.TMSFNCCustomComponent,  
  VCL.TMSFNCDirections,
  VCL.TMSFNCRouteCalculator,
  VCL.TMSFNCCloudBase,
  TMS.MCP.CloudAI,
  TMS.MCP.CustomComponent,
  TMS.MCP.CloudBase,  
  AudioRecorder, Vcl.Buttons, VCL.TMSFNCPlaces, VCL.TMSFNCGooglePlaces,
  System.TypInfo, VCL.TMSFNCGeocoding;

type
  TAITipsPlacesMainView = class(TForm)
    TMSFNCMaps1: TTMSFNCMaps;
    TMSMCPCloudAI1: TTMSMCPCloudAI;
    pnTop: TPanel;
    gBoxTanscription: TGroupBox;
    mmTanscription: TMemo;
    gBoxResponse: TGroupBox;
    mmResponse: TMemo;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    edtAPIKeyAI: TEdit;
    cBoxIAService: TComboBox;
    pnButtonsTop: TPanel;
    btnStartRecording: TButton;
    btnStopRecording: TButton;
    cBoxLanguageAI: TComboBox;
    ckSpeakAudioRecording: TCheckBox;
    ckSpeakResponse: TCheckBox;
    btnStopTalking: TButton;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label21: TLabel;
    edtAPIKeyMap: TEdit;
    cBoxLanguageMap: TComboBox;
    TMSFNCGooglePlaces1: TTMSFNCGooglePlaces;
    TMSFNCGeocoding1: TTMSFNCGeocoding;
    ProgressBar1: TProgressBar;
    btnClearMarkers: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TMSMCPCloudAI1TranscribeAudio(Sender: TObject; HttpStatusCode: Integer; HttpResult, Text: string);
    procedure TMSMCPCloudAI1SpeechAudio(Sender: TObject; HttpStatusCode: Integer; HttpResult: string; SoundBuffer: TMemoryStream);
    procedure btnStartRecordingClick(Sender: TObject);
    procedure btnStopRecordingClick(Sender: TObject);
    procedure TMSMCPCloudAI1Executed(Sender: TObject; AResponse: TTMSMCPCloudAIResponse; AHttpStatusCode: Integer; AHttpResult: string);
    procedure btnStopTalkingClick(Sender: TObject);
    procedure TMSFNCGooglePlaces1SearchByText(Sender: TObject; const ARequest: TTMSFNCPlacesRequest;
      const ARequestResult: TTMSFNCCloudBaseRequestResult);
    procedure cBoxLanguageMapChange(Sender: TObject);
    procedure edtAPIKeyMapChange(Sender: TObject);
    procedure cBoxIAServiceChange(Sender: TObject);
    procedure edtAPIKeyAIChange(Sender: TObject);
    procedure btnClearMarkersClick(Sender: TObject);
  private
    procedure ScreenRecordingOff;
    procedure ScreenRecordingOn;
    function GetLanguageAI: string;
    procedure AIExecute;
    procedure ConfigBasicMaps;
    procedure ConfigBasicAI;
    procedure SearchTextMap(const AKeyword: string; const ACoordinateRecn: TTMSFNCMapsCoordinateRec);
    procedure OnExecuteKeyword(Sender: TObject; Args: TJSONObject; var Result: string);
  public
    FAudioRecorder: TAudioRecorder;
    procedure InitTools;
  end;

var
  AITipsPlacesMainView: TAITipsPlacesMainView;

implementation

{$R *.dfm}

procedure TAITipsPlacesMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  ReportMemoryLeaksOnShutdown := True;

  Self.InitTools;

  FAudioRecorder := TAudioRecorder.Create;
  Self.ScreenRecordingOff;

  //CARREGAR IAS DISPONIVEIS
  cBoxIAService.Items.Assign(TMSMCPCloudAI1.GetServices(True));
  cBoxIAService.ItemIndex := 6;

  Self.ConfigBasicAI;
  Self.ConfigBasicMaps;
end;

procedure TAITipsPlacesMainView.FormDestroy(Sender: TObject);
begin
  if Assigned(FAudioRecorder) then
    FAudioRecorder.Free;
end;

procedure TAITipsPlacesMainView.cBoxIAServiceChange(Sender: TObject);
begin
  Self.ConfigBasicAI;
end;

procedure TAITipsPlacesMainView.edtAPIKeyAIChange(Sender: TObject);
begin
  Self.ConfigBasicAI;
end;

procedure TAITipsPlacesMainView.ConfigBasicAI;
begin
  TMSMCPCloudAI1.Service := TTMSMCPCloudAIService(cBoxIAService.Items.Objects[cBoxIAService.ItemIndex]);
  TMSMCPCloudAI1.APIKeys.OpenAI := edtAPIKeyAI.Text;
end;

procedure TAITipsPlacesMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService.msGoogleMaps;
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.Options.Locale := copy(cBoxLanguageMap.Text, 1, 5);
  TMSFNCMaps1.EndUpdate;

  TMSFNCGeocoding1.Service := TTMSFNCGeocodingService.gsGoogle;
  TMSFNCGeocoding1.APIKey := edtAPIKeyMap.Text;

  TMSFNCGooglePlaces1.APIKey := edtAPIKeyMap.Text;
  //TMSFNCGooglePlaces1.UseGooglePlacesNew := True; // opcional
end;

procedure TAITipsPlacesMainView.cBoxLanguageMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
  TMSFNCMaps1.ReInitialize;
end;

procedure TAITipsPlacesMainView.ScreenRecordingOn;
begin
  ProgressBar1.State := pbsNormal;
  btnStartRecording.Enabled := False;
  btnStopRecording.Enabled := True;
  btnStopTalking.Enabled := False;
  mmTanscription.Lines.Clear;
  mmResponse.Lines.Clear;
end;

procedure TAITipsPlacesMainView.ScreenRecordingOff;
begin
  btnStartRecording.Enabled := True;
  btnStopRecording.Enabled := False;
  btnStopTalking.Enabled := False;
  ProgressBar1.State := pbsPaused;
end;

function TAITipsPlacesMainView.GetLanguageAI: string;
begin
  Result := '';
  if cBoxLanguageAI.ItemIndex <= 0 then
    Exit;

  Result := Copy(cBoxLanguageAI.Text, Length(cBoxLanguageAI.Text) - 1, 2);
end;

procedure TAITipsPlacesMainView.btnStartRecordingClick(Sender: TObject);
begin
  Self.ScreenRecordingOn;  
  FAudioRecorder.ClearRecordedData;
  FAudioRecorder.StartRecording;
end;

procedure TAITipsPlacesMainView.btnStopRecordingClick(Sender: TObject);
var
  LAudioStream: TMemoryStream;
begin
  btnStopRecording.Enabled := False;

  FAudioRecorder.StopRecording;
  LAudioStream := FAudioRecorder.GetMP3Stream(20500);
  try
    LAudioStream.Position := 0;
    TMSMCPCloudAI1.Transcribe(LAudioStream, Self.GetLanguageAI); //'en'

    if ckSpeakAudioRecording.Checked then
    begin
      btnStopTalking.Enabled := True;
      FAudioRecorder.PlayMP3FromStream(LAudioStream);
    end;
  finally
    LAudioStream.Free;
  end;
end;

procedure TAITipsPlacesMainView.btnStopTalkingClick(Sender: TObject);
begin
  FAudioRecorder.PlayMP3FromFile('');
  btnStopTalking.Enabled := False;
end;

procedure TAITipsPlacesMainView.btnClearMarkersClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearMarkers;
end;

procedure TAITipsPlacesMainView.TMSMCPCloudAI1SpeechAudio(Sender: TObject; HttpStatusCode: Integer; HttpResult: string;
  SoundBuffer: TMemoryStream);
begin
  btnStopTalking.Enabled := True;
  FAudioRecorder.PlayMP3FromStream(SoundBuffer);
end;

procedure TAITipsPlacesMainView.edtAPIKeyMapChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TAITipsPlacesMainView.TMSMCPCloudAI1TranscribeAudio(Sender: TObject; HttpStatusCode: Integer; HttpResult, Text: string);
begin
  if HttpStatusCode div 100 <> 2 then
  begin
    mmTanscription.Lines.Text := 'Error: ' + HttpStatusCode.ToString + sLineBreak + HttpResult;
    Self.ScreenRecordingOff;
    Exit;
  end;

  mmTanscription.Lines.Text := Text;
  Self.AIExecute;
end;

procedure TAITipsPlacesMainView.AIExecute;
begin
  TMSMCPCloudAI1.Context.Text := mmTanscription.Lines.Text;
  TMSMCPCloudAI1.Execute;
  ProgressBar1.State := pbsNormal;
end;

procedure TAITipsPlacesMainView.TMSMCPCloudAI1Executed(Sender: TObject; AResponse: TTMSMCPCloudAIResponse;
  AHttpStatusCode: Integer; AHttpResult: string);
begin
  Self.ScreenRecordingOff;
  if AHttpStatusCode div 100 <> 2 then
  begin
    mmResponse.Lines.Text := 'Error: ' + AHttpStatusCode.ToString + sLineBreak + AHttpResult;
    Exit;
  end;

  mmResponse.Lines.Text := AResponse.Content.Text;

  if ckSpeakResponse.Checked then
    TMSMCPCloudAI1.Speak(AResponse.Content.Text);
end;


procedure TAITipsPlacesMainView.InitTools;
var
  LTool: TTMSMCPCloudAITool;
  LParam: TTMSMCPCloudAIParameter;
begin
  inherited;

  LTool := TMSMCPCloudAI1.Tools.Add;
  LTool.Name := 'GetKeyword';
  LTool.Description := 'Retrieve the keyword for the type of establishment to be listed on the map.';

  LParam := LTool.Parameters.Add;
  LParam.Name := 'Location';
  LParam.&Type := ptString;
  LParam.Required := True;
  LParam.Description := 'Location to be used to display places on the map.';

  LParam := LTool.Parameters.Add;
  LParam.Name := 'Keyword';
  LParam.&Type := ptString;
  LParam.Required := True;
  LParam.Description := 'Keyword for the type of establishment to be listed on the map';

  LTool.OnExecute := OnExecuteKeyword;
end;

procedure TAITipsPlacesMainView.OnExecuteKeyword(Sender: TObject; Args: TJSONObject; var Result: string);
begin
  if Args.Count <= 0 then
    Exit;

  var LLocation := Args.GetValue<string>('Location');
  var LKeyword := Args.GetValue<string>('Keyword');

  TMSFNCGeocoding1.GetGeocoding(LLocation,
    procedure(const ARequest: TTMSFNCGeocodingRequest; const ARequestResult: TTMSFNCCloudBaseRequestResult)
    begin
      var LCoordinateRec := ARequest.Items[0].Coordinate.ToRec;
      TMSFNCMaps1.SetCenterCoordinate(LCoordinateRec);
      //TMSFNCMaps1.AddMarker(LCoordinateRec);

      Self.SearchTextMap(LKeyword, LCoordinateRec);
    end);
end;

procedure TAITipsPlacesMainView.SearchTextMap(const AKeyword: string; const ACoordinateRecn: TTMSFNCMapsCoordinateRec);
begin
  TMSFNCMaps1.ClearMarkers;

  TMSFNCGooglePlaces1.SearchByText(AKeyword, ACoordinateRecn);

  TMSFNCMaps1.ZoomToBounds(ACoordinateRecn, ACoordinateRecn);
  TMSFNCMaps1.SetZoomLevel(16);
end;

procedure TAITipsPlacesMainView.TMSFNCGooglePlaces1SearchByText(Sender: TObject; const ARequest: TTMSFNCPlacesRequest;
  const ARequestResult: TTMSFNCCloudBaseRequestResult);
begin
   if ARequest.Items.Count = 0 then
    Exit;

  TMSFNCMaps1.BeginUpdate;
  try
    TMSFNCMaps1.ClearMarkers;

    for var I := 0 to Pred(ARequest.Items.Count) do
    begin
      mmResponse.Lines.Add(ARequest.Items[I].Address);

      var LMarker := TMSFNCMaps1.AddMarker(ARequest.Items[I].Coordinate.ToRec);
      LMarker.Title := ARequest.Items[I].Description + ' - ' + ARequest.Items[I].Address;
    end;
  finally
    TMSFNCMaps1.EndUpdate;
  end;
end;


end.
