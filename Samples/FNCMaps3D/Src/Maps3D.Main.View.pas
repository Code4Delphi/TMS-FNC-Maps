unit Maps3D.Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.TypInfo,
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
  VCL.TMSFNCCustomComponent,
  VCL.TMSFNCCloudBase,
  VCL.TMSFNCGeocoding,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  VCL.TMSFNCMapBox,
  VCL.TMSFNCMapsCommonTypes;

type
  TMaps3DMainView = class(TForm)
    pnTop: TPanel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    edtAPIKeyMap: TEdit;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    GroupBox3: TGroupBox;
    TMSFNCMapBox1: TTMSFNCMapBox;
    Label1: TLabel;
    cBoxMapStyle: TComboBox;
    Label2: TLabel;
    cBoxTimeOfDay: TComboBox;
    Label3: TLabel;
    edtTilt: TEdit;
    Label4: TLabel;
    edtHeading: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    btnClearAllMarkers: TButton;
    Button2: TButton;
    edtAddress: TEdit;
    ckZoomInCreated: TCheckBox;
    TMSFNCGeocoding1: TTMSFNCGeocoding;
    procedure FormCreate(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure cBoxMapStyleChange(Sender: TObject);
    procedure edtTiltExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure ConfigBasicMaps;
    procedure FillcBoxMapStyle;
    procedure FillcBoxTimeOfDay;
    procedure ZoomInCoordinateRec(const ACoordinateRec: TTMSFNCMapsCoordinateRec);
  public

  end;

var
  Maps3DMainView: TMaps3DMainView;

implementation

{$R *.dfm}

procedure TMaps3DMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  TMSFNCMapBox1.Options.DefaultLatitude := 40.7072977277808;
  TMSFNCMapBox1.Options.DefaultLongitude := -74.009335080825;

  Self.FillcBoxMapStyle;
  cBoxMapStyle.ItemIndex := Integer(TTMSFNCMapBoxMapStyle.mbs3D);

  Self.FillcBoxTimeOfDay;
  cBoxTimeOfDay.ItemIndex := Integer(TTMSFNCMapBoxTimeOfDay.todDay);

  Self.ConfigBasicMaps;
end;

procedure TMaps3DMainView.FillcBoxMapStyle;
var
  LStyle: TTMSFNCMapBoxMapStyle;
begin
  cBoxMapStyle.Items.Clear;

  for LStyle := Low(TTMSFNCMapBoxMapStyle) to High(TTMSFNCMapBoxMapStyle) do
    cBoxMapStyle.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapBoxMapStyle), Ord(LStyle)));
end;

procedure TMaps3DMainView.FillcBoxTimeOfDay;
var
  LStyle: TTMSFNCMapBoxTimeOfDay;
begin
  cBoxTimeOfDay.Items.Clear;

  for LStyle := Low(TTMSFNCMapBoxTimeOfDay) to High(TTMSFNCMapBoxTimeOfDay) do
    cBoxTimeOfDay.Items.Add(GetEnumName(TypeInfo(TTMSFNCMapBoxTimeOfDay), Ord(LStyle)));
end;

procedure TMaps3DMainView.cBoxMapStyleChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TMaps3DMainView.ConfigBasicMaps;
begin
  TMSFNCMapBox1.BeginUpdate;
  TMSFNCMapBox1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMapBox1.Options.MapStyle := TTMSFNCMapBoxMapStyle(cBoxMapStyle.ItemIndex);
  TMSFNCMapBox1.Options.TimeOfDay := TTMSFNCMapBoxTimeOfDay(cBoxTimeOfDay.ItemIndex);
  TMSFNCMapBox1.Options.Tilt := StrToIntDef(edtTilt.Text, 70);
  TMSFNCMapBox1.Options.Heading := StrToIntDef(edtHeading.Text, 0);
  TMSFNCMapBox1.EndUpdate;

  TMSFNCGeocoding1.APIKey := edtAPIKeyMap.Text;
  TMSFNCGeocoding1.Service := TTMSFNCGeocodingService.gsMapBox;
end;

procedure TMaps3DMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TMaps3DMainView.edtTiltExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TMaps3DMainView.Button2Click(Sender: TObject);
var
 LStartAddress: TTMSFNCMapsCoordinateRec;
begin
  TMSFNCGeocoding1.GetGeocoding(edtAddress.Text,
    procedure(const ARequest: TTMSFNCGeocodingRequest; const ARequestResult: TTMSFNCCloudBaseRequestResult)
    begin
      LStartAddress := ARequest.Items[0].Coordinate.ToRec;
      TMSFNCMapBox1.SetCenterCoordinate(LStartAddress);
      TMSFNCMapBox1.AddMarker(LStartAddress);

      Self.ZoomInCoordinateRec(LStartAddress);
    end);
end;

procedure TMaps3DMainView.ZoomInCoordinateRec(const ACoordinateRec: TTMSFNCMapsCoordinateRec);
begin
  if not ckZoomInCreated.Checked then
    Exit;

  TMSFNCMapBox1.ZoomToBounds(ACoordinateRec, ACoordinateRec);
  TMSFNCMapBox1.SetZoomLevel(18);
end;


end.
