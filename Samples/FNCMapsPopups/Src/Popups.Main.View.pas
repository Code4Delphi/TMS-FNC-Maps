unit Popups.Main.View;

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
  VCL.TMSFNCTypes,
  VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes,
  VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser,
  VCL.TMSFNCMaps,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Menus;

type
  TPopupsMainView = class(TForm)
    TMSFNCMaps1: TTMSFNCMaps;
    pnTop: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    cBoxService: TComboBox;
    edtAPIKeyMap: TEdit;
    StatusBar1: TStatusBar;
    gBoxPolylines: TGroupBox;
    btnPolylinesAdd: TButton;
    btnPolylinesClear: TButton;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    btnAddPolygon: TButton;
    btnClearAllPolygons: TButton;
    GroupBox3: TGroupBox;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    btnAddMarkerCustomizedIcon: TButton;
    GroupBox4: TGroupBox;
    btnAddCircle: TButton;
    btnClearAllCircles: TButton;
    GroupBox5: TGroupBox;
    btnCloseAllPopups: TButton;
    btnAddPopup: TButton;
    gBoxRouteDetails: TGroupBox;
    Panel2: TPanel;
    ListBoxLogs: TListBox;
    Button1: TButton;
    Label2: TLabel;
    edtTextForPopup: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure cBoxServiceChange(Sender: TObject);
    procedure edtAPIKeyMapExit(Sender: TObject);
    procedure btnAddPolygonClick(Sender: TObject);
    procedure btnClearAllPolygonsClick(Sender: TObject);
    procedure btnPolylinesAddClick(Sender: TObject);
    procedure btnPolylinesClearClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure btnAddMarkerCustomizedIconClick(Sender: TObject);
    procedure btnAddCircleClick(Sender: TObject);
    procedure btnClearAllCirclesClick(Sender: TObject);
    procedure btnCloseAllPopupsClick(Sender: TObject);
    procedure btnAddPopupClick(Sender: TObject);
    procedure TMSFNCMaps1MarkerClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1PolyElementClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
    procedure Button1Click(Sender: TObject);
  private
    procedure ConfigBasicMaps;
  public

  end;

var
  PopupsMainView: TPopupsMainView;

implementation

{$R *.dfm}

procedure TPopupsMainView.FormCreate(Sender: TObject);
begin
  FormatSettings.DecimalSeparator := '.';
  cBoxService.ItemIndex := Integer(TTMSFNCMapsService.msOpenLayers);
  Self.ConfigBasicMaps;
end;

procedure TPopupsMainView.ConfigBasicMaps;
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.Service := TTMSFNCMapsService(cBoxService.ItemIndex);
  TMSFNCMaps1.APIKey := edtAPIKeyMap.Text;
  TMSFNCMaps1.EndUpdate;

  edtAPIKeyMap.Enabled := not (cBoxService.ItemIndex in [6, 8]);
end;

procedure TPopupsMainView.cBoxServiceChange(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TPopupsMainView.edtAPIKeyMapExit(Sender: TObject);
begin
  Self.ConfigBasicMaps;
end;

procedure TPopupsMainView.btnAddPolygonClick(Sender: TObject);
var
  LCoordinateRecArray: TTMSFNCMapsCoordinateRecArray;
  LPolygon: TTMSFNCMapsPolygon;
begin
  SetLength(LCoordinateRecArray, 3);
  LCoordinateRecArray[0] := CreateCoordinate(25.789106, -80.226529);
  LCoordinateRecArray[1] := CreateCoordinate(18.4663188, -60.1057427);
  LCoordinateRecArray[2] := CreateCoordinate(32.294887, -64.781380);

  TMSFNCMaps1.BeginUpdate;
  LPolygon := TMSFNCMaps1.AddPolygon(LCoordinateRecArray);
  LPolygon.FillColor := gcOrange;
  LPolygon.FillOpacity := 0.5;
  LPolygon.StrokeColor := gcGreen;
  LPolygon.StrokeWidth := 4;
  LPolygon.DataInteger := 1;
  LPolygon.DataString := edtTextForPopup.Text;
  TMSFNCMaps1.EndUpdate;
end;

procedure TPopupsMainView.btnAddPopupClick(Sender: TObject);
const
 HTML =
   '''
   <div style="font-family: Arial, Helvetica, sans-serif; max-width: 260px; padding: 12px; background-color: #ffffff;
      border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.2);">

      <h3 style="margin: 0 0 8px 0; color: #2c3e50; font-size: 16px;"> Code4Delphi </h3>

      <p style="margin: 0 0 10px 0; font-size: 13px; color: #555555; line-height: 1.4;">
        Comunidade focada no compartilhamento de conhecimento sobre Delphi,
        desenvolvimento de software e boas práticas.
      </p>

      <div style="font-size: 12px; color: #888888; text-align: right;">
        code4delphi.com.br
      </div>
    </div>
   ''';
begin
  TMSFNCMaps1.ShowPopup(DefaultCoordinate, HTML);
end;

procedure TPopupsMainView.btnClearAllCirclesClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearCircles;
end;

procedure TPopupsMainView.btnClearAllPolygonsClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearPolygons;
end;

procedure TPopupsMainView.btnPolylinesAddClick(Sender: TObject);
var
  LCoordinateRecArray: TTMSFNCMapsCoordinateRecArray;
  LPolyline: TTMSFNCMapsPolyline;
begin
  SetLength(LCoordinateRecArray, 4);
  LCoordinateRecArray[0] := CreateCoordinate(26.244485, -38.536689);
  LCoordinateRecArray[1] := CreateCoordinate(27.186568, -16.036689);
  LCoordinateRecArray[2] := CreateCoordinate(8.896288, -27.286689);
  LCoordinateRecArray[3] := CreateCoordinate(26.244485, -38.536689);

  TMSFNCMaps1.BeginUpdate;
  LPolyline := TMSFNCMaps1.AddPolyline(LCoordinateRecArray);
  LPolyline.StrokeColor := gcBlack;
  LPolyline.StrokeWidth := 4;
  LPolyline.DataInteger := 2;
  LPolyline.DataString := 'Text for Polyline popup';
  TMSFNCMaps1.EndUpdate;
end;

procedure TPopupsMainView.btnPolylinesClearClick(Sender: TObject);
begin
  TMSFNCMaps1.ClearPolylines;
end;

procedure TPopupsMainView.btnAddCircleClick(Sender: TObject);
var
  LCircle: TTMSFNCMapsCircle;
begin
  TMSFNCMaps1.BeginUpdate;
  LCircle := TMSFNCMaps1.AddCircle(CreateCoordinate(64.820128, -18.638252), 400000); //400 KM
  LCircle.FillColor := gcBlue;
  LCircle.FillOpacity := 0.2;
  LCircle.StrokeColor := gcBlack;
  LCircle.StrokeWidth := 4;
  LCircle.DataInteger := 3;
  LCircle.DataString := 'Text for Circle popup';
  TMSFNCMaps1.EndUpdate;
end;

procedure TPopupsMainView.btnCloseAllPopupsClick(Sender: TObject);
begin
  TMSFNCMaps1.CloseAllPopups;
end;

procedure TPopupsMainView.Button2Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.ClearMarkers;
  TMSFNCMaps1.EndUpdate;
end;

procedure TPopupsMainView.Button4Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(44.487517, -57.792144, '', 'https://code4delphi.com.br/img/ok.png').DataInteger := 1;
  TMSFNCMaps1.EndUpdate;
end;

procedure TPopupsMainView.Button5Click(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(38.297293, 11.289882, '', 'https://code4delphi.com.br/img/no.png').DataInteger := 2;
  TMSFNCMaps1.EndUpdate;
end;

procedure TPopupsMainView.btnAddMarkerCustomizedIconClick(Sender: TObject);
begin
  TMSFNCMaps1.BeginUpdate;
  TMSFNCMaps1.AddMarker(-25.454649, -52.870269, '', 'https://code4delphi.com.br/img/c4d-24x24.png').DataInteger := 3;
  TMSFNCMaps1.EndUpdate;
end;

procedure TPopupsMainView.TMSFNCMaps1MarkerClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
var
  LHTML: string;
begin
  LHTML := '';
  case AEventData.Marker.DataInteger of
    1: LHTML := '<b>Chongqing</b><br><img width="200" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/SkylineOfChongqing.jpg/2880px-SkylineOfChongqing.jpg"/>';
    2: LHTML := '<b>Mount Tambora</b><br><img width="200" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Mount_Tambora_Volcano%2C_Sumbawa_Island%2C_Indonesia.jpg/1920px-Mount_Tambora_Volcano%2C_Sumbawa_Island%2C_Indonesia.jpg"/>';
    3: LHTML := '<b>Highway 10</b><br><iframe src="https://giphy.com/embed/10pk8d1EoR7HrO" width="200" height="200" frameBorder="0" class="giphy-embed"></iframe>';
  end;

  if LHTML.Trim.IsEmpty then
    Exit;

  LHTML := LHTML + '<br>Longitude: <i>'+ AEventData.Marker.Longitude.ToString +'</i><br>Latitude: <i>'+ AEventData.Marker.Latitude.ToString +'</i>';

  var LIdPopup := TMSFNCMaps1.ShowPopup(AEventData.Marker.Coordinate.ToRec, LHTML);
  ListBoxLogs.Items.Add(LIdPopup);
end;

procedure TPopupsMainView.TMSFNCMaps1PolyElementClick(Sender: TObject; AEventData: TTMSFNCMapsEventData);
const
  TEMPLATE = '<div style="width: 500px; padding: 12px; background-color: #ffffff; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.2);"> ' +
    '  <font color="#F0F" width="600"><b> DataInteger: %d </b></font> <br>' +
    '  <i> %s </i> '+
    '</div>';
var
  LHTML: string;
  LIdPopup: string;
begin
  LHTML := Format(TEMPLATE, [AEventData.PolyElement.DataInteger, AEventData.PolyElement.DataString]);

  if AEventData.PolyElement.DataInteger = 1 then
    LHTML := LHTML + '<a href="https://www.youtube.com/@code4delphi"> Link here </a>';

  LIdPopup := TMSFNCMaps1.ShowPopup(AEventData.Coordinate.ToRec, LHTML);
  ListBoxLogs.Items.Add(LIdPopup);
end;

procedure TPopupsMainView.Button1Click(Sender: TObject);
begin
  if ListBoxLogs.ItemIndex < 0 then
  begin
    ShowMessage('No items selected');
    Exit;
  end;

  var LId := ListBoxLogs.Items[ListBoxLogs.ItemIndex];
  TMSFNCMaps1.ClosePopup(LId);

  ListBoxLogs.Items.Delete(ListBoxLogs.ItemIndex);
end;

end.
