unit Labels.Main.View;

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
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps;

type
  TLabelsMainView = class(TForm)
    pnTop: TPanel;
    TMSFNCMaps1: TTMSFNCMaps;
    GroupBox3: TGroupBox;
    btnAddSimpleLabel: TButton;
    btnAddLabelBackgroundColor: TButton;
    StatusBar1: TStatusBar;
    btnClearAllLabels: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    cBoxService: TComboBox;
    edtAPIKeyMap: TEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label2: TLabel;
    lbFontSize: TLabel;
    ckAddLabelClickingMap: TCheckBox;
    cBoxFontColor: TComboBox;
    cBoxBackgroundColor: TComboBox;
    edtFontSize: TEdit;
    ckBold: TCheckBox;
    ckItalic: TCheckBox;
    ckUnderline: TCheckBox;
    ckStrikeOut: TCheckBox;
    Label3: TLabel;
    edtText: TEdit;
    btnAddLabelWithHTMLAndCSS: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Id: TStringField;
    ClientDataSet1Visible: TBooleanField;
    DataSource1: TDataSource;
    GroupBox4: TGroupBox;
    Panel2: TPanel;
    btnRefresh: TButton;
    btnDelete: TButton;
    btnVisibleInvisible: TButton;
    DBGrid1: TDBGrid;
    ClientDataSet1Latitude: TFloatField;
    ClientDataSet1Longitude: TFloatField;
    ClientDataSet1Text: TStringField;
    Label4: TLabel;
    Label6: TLabel;
    cBoxBorderColor: TComboBox;
    edtBorderWidth: TEdit;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure btnAddSimpleLabelClick(Sender: TObject);
    procedure btnAddLabelBackgroundColorClick(Sender: TObject);
    procedure TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnClearAllLabelsClick(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure btnAddLabelWithHTMLAndCSSClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnVisibleInvisibleClick(Sender: TObject);
  private
    FLastLat: Double;
    FLastLon: Double;
    procedure ConfigBasicMaps;
    procedure RefreshLabelsInDataSet;
    function GetLabelBySelected: TTMSFNCMapsLabel;
  public
  end;

var
  LabelsMainView: TLabelsMainView;

implementation

{$R *.dfm}

procedure TLabelsMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := 6;
  cBoxServiceChange(cBoxService);
end;

procedure TLabelsMainView.TMSFNCMaps1MapMouseMove(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  FLastLat := AEventData.Coordinate.Latitude;
  FLastLon := AEventData.Coordinate.Longitude;

  StatusBar1.Panels[0].Text := 'Lat: ' + FLastLat.ToString;
  StatusBar1.Panels[1].Text := 'Lon: ' + FLastLon.ToString;
end;

procedure TLabelsMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TLabelsMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TLabelsMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.EndUpdate;

  edtAPIKeyMap.Enabled := not (cBoxService.ItemIndex in [6, 8]);
end;

procedure TLabelsMainView.btnAddSimpleLabelClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddLabel(50.105082, -138.859648, '<b>C4D</b><br>Code4Delphi');
  TMSFNCMaps1.EndUpdate;

  Self.RefreshLabelsInDataSet;
end;

procedure TLabelsMainView.btnAddLabelBackgroundColorClick(Sender: TObject);
var
  LMapsLabel: TTMSFNCMapsLabel;
begin
  TMSFNCMaps1.BeginUpdate;
  LMapsLabel := TMSFNCMaps1.AddLabel(57.261558, -14.946536, '<b>C4D</b><br>Code4Delphi', gcWhite, gcDarkslateblue);
  LMapsLabel.Font.Size := 14;
  TMSFNCMaps1.EndUpdate;

  Self.RefreshLabelsInDataSet;
end;

procedure TLabelsMainView.btnAddLabelWithHTMLAndCSSClick(Sender: TObject);
const
  TEXT = '<span style="color:#e74c3c;font-weight:bold;font-family:Arial;border:4px solid #3498db;padding:4px 8px;border-radius:4px;">C4D</span>';
begin
  TMSFNCMaps1.BeginUpdate;
  var LMapsLabel := TMSFNCMaps1.AddLabel(34.993704, -85.669502, TEXT);
  LMapsLabel.Font.Size := 48;
  TMSFNCMaps1.EndUpdate;

  Self.RefreshLabelsInDataSet;
end;

procedure TLabelsMainView.btnClearAllLabelsClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearLabels;
  Self.RefreshLabelsInDataSet;
end;

procedure TLabelsMainView.btnDeleteClick(Sender: TObject);
var
  LLabel: TTMSFNCMapsLabel;
begin
  LLabel := Self.GetLabelBySelected;

  if LLabel = nil then
    Exit;

  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Labels.Delete(LLabel.Index);
  TMSFNCMaps1.EndUpdate;

  Self.RefreshLabelsInDataSet;
end;

procedure TLabelsMainView.btnVisibleInvisibleClick(Sender: TObject);
var
  LLabel: TTMSFNCMapsLabel;
begin
  LLabel := Self.GetLabelBySelected;

  TMSFNCMaps1.BeginUpdate;
  LLabel.Visible := not LLabel.Visible;
  TMSFNCMaps1.EndUpdate;

  ClientDataSet1.Edit;
  ClientDataSet1Visible.AsBoolean := LLabel.Visible;
  ClientDataSet1.Post;
end;

function TLabelsMainView.GetLabelBySelected: TTMSFNCMapsLabel;
begin
  if ClientDataSet1.IsEmpty then
    raise Exception.Create('Select an item to be continue');

  Result := TMSFNCMaps1.Labels.ItemByID[ClientDataSet1Id.AsString];

  if Result = nil then
    raise Exception.Create('Label not found');
end;

procedure TLabelsMainView.TMSFNCMaps1MapClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
begin
  if ckAddLabelClickingMap.Checked then
  begin
    TMSFNCMaps1.BeginUpdate;
    var LMapsLabel: TTMSFNCMapsLabel;
    LMapsLabel := TMSFNCMaps1.AddLabel(AEventData.Coordinate.Latitude, AEventData.Coordinate.Longitude, edtText.Text);
    LMapsLabel.Font.Size := StrToIntDef(edtFontSize.Text, 14);
    LMapsLabel.Font.Color := TTMSFNCGraphicsColor(StringToColor(cBoxFontColor.Text));

    if cBoxBackgroundColor.Text <> 'None' then
      LMapsLabel.BackgroundColor := TTMSFNCGraphicsColor(StringToColor(cBoxBackgroundColor.Text));

    if ckBold.Checked then
      LMapsLabel.Font.Style := LMapsLabel.Font.Style + [TFontStyle.fsBold];

    if ckItalic.Checked then
      LMapsLabel.Font.Style := LMapsLabel.Font.Style + [TFontStyle.fsItalic];

    if ckUnderline.Checked then
      LMapsLabel.Font.Style := LMapsLabel.Font.Style + [TFontStyle.fsUnderline];

    if ckStrikeOut.Checked then
      LMapsLabel.Font.Style := LMapsLabel.Font.Style + [TFontStyle.fsStrikeOut];

    LMapsLabel.BorderWidth := StrToIntDef(edtBorderWidth.Text, 0);
    LMapsLabel.BorderColor := TTMSFNCGraphicsColor(StringToColor(cBoxBorderColor.Text));
    TMSFNCMaps1.EndUpdate;

    Self.RefreshLabelsInDataSet;
  end;
end;

procedure TLabelsMainView.RefreshLabelsInDataSet;
var
  LLabel: TTMSFNCMapsLabel;
begin
  ClientDataSet1.EmptyDataSet;
  ClientDataSet1.Open;

  if TMSFNCMaps1.Labels.Count <= 0 then
    Exit;

  for var i := 0 to Pred(TMSFNCMaps1.Labels.Count) do
  begin
    LLabel := TMSFNCMaps1.Labels.Items[i];

    ClientDataSet1.Append;
    ClientDataSet1Id.AsString := LLabel.ID;
    ClientDataSet1Text.AsString := LLabel.Text;
    ClientDataSet1Latitude.AsFloat := LLabel.Coordinate.Latitude;
    ClientDataSet1Longitude.AsFloat := LLabel.Coordinate.Longitude;
    ClientDataSet1Visible.AsBoolean := LLabel.Visible;
    ClientDataSet1.Post;
  end;
end;

end.
