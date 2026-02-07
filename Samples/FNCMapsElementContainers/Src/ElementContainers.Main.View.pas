unit ElementContainers.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Clipbrd,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Menus,
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps;

type
  TElementContainersMainView = class(TForm)
    TMSFNCMaps1: TTMSFNCMaps;
    pnTop: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    cBoxService: TComboBox;
    edtAPIKeyMap: TEdit;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    GroupBox3: TGroupBox;
    Button2: TButton;
    ckElementContainerVisibility: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TMSFNCMaps1ElementContainers0Actions0Execute(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1ElementContainers0Actions1Execute(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1ElementContainers0Actions2Execute(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1ZoomChanged(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1GetZoomLevel(Sender: TObject; AZoomLevel: Double);
    procedure ckElementContainerVisibilityClick(Sender: TObject);
  private
    procedure ConfigBasicMaps;
  public

  end;

var
  ElementContainersMainView: TElementContainersMainView;

implementation

{$R *.dfm}

procedure TElementContainersMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);
  Self.ConfigBasicMaps;
end;

procedure TElementContainersMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.EndUpdate;

  edtAPIKeyMap.Enabled := not (cBoxService.ItemIndex in [6, 8]);
end;

procedure TElementContainersMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TElementContainersMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TElementContainersMainView.Button2Click(Sender: TObject);
begin
  TMSFNCMaps1.ClearMarkers;
end;

procedure TElementContainersMainView.TMSFNCMaps1ElementContainers0Actions0Execute(Sender: TObject;
  AEventData: TTMSFNCMapsEventData);
begin
  TMSFNCMaps1.AddMarker(CenterCoordinate, '', 'https://code4delphi.com.br/img/c4d-24x24.png');
  ShowMessage(AEventData.CustomData);
end;

procedure TElementContainersMainView.TMSFNCMaps1ElementContainers0Actions1Execute(Sender: TObject;
  AEventData: TTMSFNCMapsEventData);
begin
  ShowMessage(AEventData.CustomData);
end;

procedure TElementContainersMainView.ckElementContainerVisibilityClick(Sender: TObject);
begin
   TMSFNCMaps1.ElementContainers.Items[0].Visible := ckElementContainerVisibility.Checked;
end;

procedure TElementContainersMainView.TMSFNCMaps1ElementContainers0Actions2Execute(Sender: TObject;
  AEventData: TTMSFNCMapsEventData);
var
  LReturn: string;
  LZoom: Double;
begin
  LReturn := StringReplace(AEventData.CustomData, '"', '', [rfReplaceAll]);
  LZoom := StrToFloatDef(LReturn, -1);

  if LZoom >= 0 then
    TMSFNCMaps1.SetZoomLevel(LZoom);
end;

procedure TElementContainersMainView.TMSFNCMaps1ZoomChanged(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  TMSFNCMaps1.GetZoomLevel;
end;

procedure TElementContainersMainView.TMSFNCMaps1GetZoomLevel(Sender: TObject; AZoomLevel: Double);
begin
  TMSFNCMaps1.ExecuteJavaScript('document.getElementById("customRange1").value = ' + TTMSFNCUtils.FloatToStrDot(AZoomLevel));
  TMSFNCMaps1.ExecuteJavaScript('document.getElementById("customZoom1").innerText = ' + TTMSFNCUtils.FloatToStrDot(Round(AZoomLevel)));
end;

end.
