unit Zoom.Main.View;

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
  Vcl.Dialogs, Vcl.ExtCtrls, VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TZoomMainView = class(TForm)
    pnTop: TPanel;
    TMSFNCMaps1: TTMSFNCMaps;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    cBoxService: TComboBox;
    edtAPIKeyMap: TEdit;
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    TrackBar1: TTrackBar;
    btnZoomMin: TButton;
    btnZoomMenos: TButton;
    btnZoomMax: TButton;
    btnZoomMais: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure btnZoomMinClick(Sender: TObject);
    procedure btnZoomMenosClick(Sender: TObject);
    procedure btnZoomMaisClick(Sender: TObject);
    procedure btnZoomMaxClick(Sender: TObject);
    procedure TrackBar1Tracking(Sender: TObject);
    procedure TMSFNCMaps1GetZoomLevel(Sender: TObject; AZoomLevel: Double);
    procedure TMSFNCMaps1ZoomChanged(Sender: TObject; AEventData: TTMSFNCMapsEventData);
  private
    procedure ConfigBasicMaps;
  public

  end;

var
  ZoomMainView: TZoomMainView;

implementation

{$R *.dfm}

procedure TZoomMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);
  Self.ConfigBasicMaps;
end;

procedure TZoomMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.EndUpdate;

  edtAPIKeyMap.Enabled := not (cBoxService.ItemIndex in [6, 8]);
end;

procedure TZoomMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TZoomMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TZoomMainView.btnZoomMinClick(Sender: TObject);
begin
  TrackBar1.Position := TrackBar1.Min;
  TMSFNCMaps1.SetZoomLevel(TrackBar1.Position);
end;

procedure TZoomMainView.btnZoomMenosClick(Sender: TObject);
begin
  TrackBar1.Position := TrackBar1.Position - 1;
  TMSFNCMaps1.SetZoomLevel(TrackBar1.Position);
end;

procedure TZoomMainView.btnZoomMaisClick(Sender: TObject);
begin
  TrackBar1.Position := TrackBar1.Position + 1;
  TMSFNCMaps1.SetZoomLevel(TrackBar1.Position);
end;

procedure TZoomMainView.btnZoomMaxClick(Sender: TObject);
begin
  TrackBar1.Position := TrackBar1.Max;
  TMSFNCMaps1.SetZoomLevel(TrackBar1.Position);
end;

procedure TZoomMainView.TrackBar1Tracking(Sender: TObject);
begin
  TMSFNCMaps1.SetZoomLevel(TrackBar1.Position);
end;

procedure TZoomMainView.TMSFNCMaps1GetZoomLevel(Sender: TObject; AZoomLevel: Double);
begin
  TrackBar1.Position := Round(AZoomLevel);
end;

procedure TZoomMainView.TMSFNCMaps1ZoomChanged(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  TMSFNCMaps1.GetZoomLevel;
end;

end.
