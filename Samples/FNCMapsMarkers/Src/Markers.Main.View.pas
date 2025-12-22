unit Markers.Main.View;

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
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TMarkersMainView = class(TForm)
    Panel1: TPanel;
    TMSFNCMaps1: TTMSFNCMaps;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cBoxService: TComboBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    Label2: TLabel;
    cBoxLanguage: TComboBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    gBoxCustomized: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtCustomizedLatitude: TEdit;
    edtCustomizedLongitude: TEdit;
    btnAddMarkerCustomized: TButton;
    Label6: TLabel;
    edtCustomizedTitle: TEdit;
    Label7: TLabel;
    edtCustomizedIconURL: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cBoxLanguageChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnAddMarkerCustomizedClick(Sender: TObject);
  private
    procedure ConfigBasicMaps;
  public

  end;

var
  MarkersMainView: TMarkersMainView;

implementation

{$R *.dfm}

procedure TMarkersMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);
  Self.ConfigBasicMaps;
end;

procedure TMarkersMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.Options.Locale := copy(cBoxLanguage.Text, 1, 5);
  TMSFNCMaps1.EndUpdate;
end;

procedure TMarkersMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TMarkersMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TMarkersMainView.cBoxLanguageChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
  TMSFNCMaps1.ReInitialize;
end;

procedure TMarkersMainView.Button2Click(Sender: TObject);
begin
  TMSFNCMaps1.ClearMarkers;
end;

procedure TMarkersMainView.Button1Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(DefaultCoordinate, 'Market C4D - 01');
  TMSFNCMaps1.EndUpdate;
end;

procedure TMarkersMainView.Button4Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(46.819249, -42.198792, 'Market C4D - OK', 'https://code4delphi.com.br/img/ok.png');
  TMSFNCMaps1.EndUpdate;
end;

procedure TMarkersMainView.Button5Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(36.819249, -32.198792, 'Market C4D - OK', 'https://code4delphi.com.br/img/no.png');
  TMSFNCMaps1.EndUpdate;
end;

procedure TMarkersMainView.Button6Click(Sender: TObject);
var
  LMarker: TTMSFNCMapsMarker;
begin
  TMSFNCMaps1.BeginUpdate;

  LMarker := TMSFNCMaps1.AddMarker(26.819249, -22.198792);
  LMarker.Title := 'Market C4D - Customized';
  LMarker.DefaultIcon.Enabled := True;
  LMarker.DefaultIcon.Fill := clBlue;
  LMarker.DefaultIcon.Size := 50;

  TMSFNCMaps1.EndUpdate;
end;

procedure TMarkersMainView.btnAddMarkerCustomizedClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;

  var LLatitude := StrToFloat(edtCustomizedLatitude.Text);
  var LLongitude := StrToFloat(edtCustomizedLongitude.Text);
  TMSFNCMaps1.AddMarker(LLatitude, LLongitude, edtCustomizedTitle.Text, edtCustomizedIconURL.Text);

  TMSFNCMaps1.EndUpdate;
end;

end.
