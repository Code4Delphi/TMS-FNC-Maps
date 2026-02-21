unit UDemo;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.ExtCtrls, WEBLib.WebCtrls,
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCMapsCommonTypes, Vcl.StdCtrls, WEBLib.StdCtrls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCMaps;

type
  TForm1 = class(TWebForm)
    WebPanel1: TWebPanel;
    TMSFNCMaps1: TTMSFNCMaps;
    Label5: TWebLabel;
    MapAPIEdit: TWebEdit;
    Label6: TWebLabel;
    MapServiceCombo: TWebComboBox;
    Label11: TWebLabel;
    SetCircle: TWebButton;
    SetPolygon: TWebButton;
    SetRect: TWebButton;
    SetPolyLine: TWebButton;
    WebButton1: TWebButton;
    procedure MapServiceComboChange(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure SetCircleClick(Sender: TObject);
    procedure TMSFNCMaps1MarkerClick(Sender: TObject;
      AEventData: TTMSFNCMapsEventData);
    procedure TMSFNCMaps1PolyElementClick(Sender: TObject;
      AEventData: TTMSFNCMapsEventData);
    procedure SetPolygonClick(Sender: TObject);
    procedure SetPolyLineClick(Sender: TObject);
    procedure SetRectClick(Sender: TObject);
    procedure TMSFNCMaps1MapInitialized(Sender: TObject);
    procedure WebButton1Click(Sender: TObject);
  private
    { Private declarations }
    prevPopUp: string;
    procedure AddMonumentMarkers;
    procedure CreateMarkerForMonument(ATitle: string; ALatitude: Double; ALongitude: Double; AIconName: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AddMonumentMarkers;
begin
  TMSFNCMaps1.BeginUpdate;

  CreateMarkerForMonument('Невьянская башня', 57.4899061, 60.2234059, 'leaning-tower-of-nevyansk.png');
  CreateMarkerForMonument('Space Needle', 47.6205041, -122.3493886, 'space-needle.png');
  CreateMarkerForMonument('Big Ben', 51.5007292, -0.1246441, 'big-ben.png');
  CreateMarkerForMonument('อนุสาวรีย์ประชาธิปไตย', 13.7567502, 100.5016002, 'democracy-monument.png');
  CreateMarkerForMonument('Moaï', -27.1443627,-109.3675579, 'moai.png');
  CreateMarkerForMonument('Sydney Opera House', -33.8570981,151.2150884, 'sydney-opera-house.png');
  CreateMarkerForMonument('معابد أبو سمبل', 22.3376087,31.62542645, 'abu-simbel.png');
  CreateMarkerForMonument('Cristo Redentor', -22.951916, -43.2106759, 'christ-the-redeemer.png');

  TMSFNCMaps1.EndUpdate;
end;

procedure TForm1.CreateMarkerForMonument(ATitle: string; ALatitude,
  ALongitude: Double; AIconName: string);
begin
  TMSFNCMaps1.AddMarker(ALatitude, ALongitude, ATitle, 'https://tmssoftware.com/site/img/' + AIconName);
end;

procedure TForm1.MapServiceComboChange(Sender: TObject);
begin
  TMSFNCMaps1.APIKey := '';
  MapAPIEdit.Text := '';

  case MapServiceCombo.ItemIndex of
    0: TMSFNCMaps1.Service := msGoogleMaps;
    1: TMSFNCMaps1.Service := msHere;
    2: TMSFNCMaps1.Service := msBingMaps;
    3: TMSFNCMaps1.Service := msAzureMaps;
    4: TMSFNCMaps1.Service := msMapBox;
    5: TMSFNCMaps1.Service := msTomTom;
    6: TMSFNCMaps1.Service := msOpenLayers;
    7: TMSFNCMaps1.Service := msMapKit;
  end;
end;

procedure TForm1.SetCircleClick(Sender: TObject);
var
  c: TTMSFNCMapsCircle;
  tamboraC: TTMSFNCMapsCoordinateRec;
begin
  TMSFNCMaps1.ClearCircles;

  tamboraC.Latitude := -8.24791127099354;
  tamboraC.Longitude := 117.991082668304;

  // r 1300 km ash found
  c := TMSFNCMaps1.AddCircle(tamboraC, 1300000);
  c.DataInteger := 4;
  c.StrokeColor := gcYellow;
  c.FillColor := gcYellow;
  c.FillOpacity := 0.2;

  // r 500 km 5cm ash
  c := TMSFNCMaps1.AddCircle(tamboraC, 500000);
  c.DataInteger := 3;
  c.StrokeColor := gcOrange;
  c.FillColor := gcOrange;
  c.FillOpacity := 0.3;

  // r 75 km 100cm ash
  c := TMSFNCMaps1.AddCircle(tamboraC, 75000);
  c.DataInteger := 2;
  c.StrokeColor := gcRed;
  c.FillColor := gcRed;
  c.FillOpacity := 0.4;

  TMSFNCMaps1.AddMarker(tamboraC).DataInteger := 2;
  TMSFNCMaps1.SetCenterCoordinate(tamboraC);

  TMSFNCMaps1.ZoomToBounds(CreateCircle(tamboraC, 1400000));
end;

procedure TForm1.SetPolygonClick(Sender: TObject);
var
  pg: TTMSFNCMapsPolygon;
  p1, p2, p3, p4: TTMSFNCMapsCoordinateRec;
begin
  TMSFNCMaps1.ClearPolygons;

  p1.Latitude := 40.768082023319;
  p1.Longitude := -73.9818960428238;

  p2.Latitude := 40.8005952613788;
  p2.Longitude := -73.958161778013;

  p3.Latitude := 40.7968781747203;
  p3.Longitude := -73.9492411198608;

  p4.Latitude := 40.7643144104723;
  p4.Longitude := -73.9730009241094;

  pg := TMSFNCMaps1.AddPolygon([p1, p2, p3, p4], True);
  pg.DataInteger := 5;
  pg.StrokeColor := gcBlue;
  pg.StrokeWidth := 2;
  pg.FillColor := gcBlue;
  pg.FillOpacity := 0.1;

  TMSFNCMaps1.AddMarker(40.7811313, -73.9687576).DataInteger := 4;
  TMSFNCMaps1.ZoomToBounds([p1, p2, p3, p4]);
end;

procedure TForm1.SetPolyLineClick(Sender: TObject);
var
  pl: TTMSFNCMapsPolyline;
  har,bat: TTMSFNCMapsCoordinateRec;
begin
  TMSFNCMaps1.ClearPolylines;

  har.Longitude := 49.0564068515288;
  har.Latitude := 24.1373163639494;

  bat.Longitude := 51.4464373615322;
  bat.Latitude := 24.1401611354134;

  pl := TMSFNCMaps1.AddPolyline([har, bat]);
  pl.DataInteger := 6;
  pl.StrokeColor := gcGreen;
  pl.StrokeWidth := 3;

  TMSFNCMaps1.AddMarker((har.Latitude + bat.Latitude)/2, (har.Longitude + bat.Longitude)/2).DataInteger := 3;
  TMSFNCMaps1.ZoomToBounds([har,bat]);
end;

procedure TForm1.SetRectClick(Sender: TObject);
var
  b: TTMSFNCMapsBoundsRec;
  r: TTMSFNCMapsRectangle;
begin
  TMSFNCMaps1.ClearRectangles;

  b.NorthEast.Latitude := 32.217;
  b.NorthEast.Longitude := 110.183;
  b.SouthWest.Latitude := 28.167;
  b.SouthWest.Longitude := 105.283;

  r := TMSFNCMaps1.AddRectangle(b);
  r.DataInteger := 1;
  r.StrokeWidth := 3;
  r.StrokeColor := gcBlack;
  r.FillColor := gcMagenta;
  r.FillOpacity := 0.1;

  TMSFNCMaps1.AddMarker(29.4584295, 106.8656296).DataInteger := 1;
  TMSFNCMaps1.ZoomToBounds(b);
end;

procedure TForm1.TMSFNCMaps1MapInitialized(Sender: TObject);
begin
  AddMonumentMarkers;
end;

procedure TForm1.TMSFNCMaps1MarkerClick(Sender: TObject;
  AEventData: TTMSFNCMapsEventData);
var
  s: string;
begin
  s := '';
  case AEventData.Marker.DataInteger of
    1: s := '<b>Chongqing</b><br><img width="200" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/SkylineOfChongqing.jpg/2880px-SkylineOfChongqing.jpg"/>';
    2: s := '<b>Mount Tambora</b><br><img width="200" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Mount_Tambora_Volcano%2C_Sumbawa_Island%2C_Indonesia.jpg/1920px-Mount_Tambora_Volcano%2C_Sumbawa_Island%2C_Indonesia.jpg"/>';
    3: s := '<b>Highway 10</b><br><iframe src="https://giphy.com/embed/10pk8d1EoR7HrO" width="200" height="200" frameBorder="0" class="giphy-embed"></iframe>';
    4: s := '<b>Central Park</b>';
  end;
  
  if (s <> '') then
  begin
    s := s + '<br>Longitude: <i>'+ AEventData.Marker.Longitude.ToString +'</i><br>Latitude: <i>'+ AEventData.Marker.Latitude.ToString +'</i>';

    TMSFNCMaps1.ShowPopup(AEventData.Marker.Coordinate.ToRec, s);
  end;
end;

procedure TForm1.TMSFNCMaps1PolyElementClick(Sender: TObject;
  AEventData: TTMSFNCMapsEventData);
var
  s: string;
begin
  if prevPopUp <> '' then
    TMSFNCMaps1.ClosePopup(prevPopUp);

  case AEventData.PolyElement.DataInteger of
    1: s := '<font color="#FF00FF"><b>Largest claimed city proper</b></font><br>'
      + '<a target="_blank" href="https://en.wikipedia.org/wiki/List_of_largest_cities"><i>More information...</i></a>';
    2: s := '<font color="#DC143C"><b>Largest eruption in human history</b></font><br>'
      + 'at <a target="_blank" href="https://en.wikipedia.org/wiki/1815_eruption_of_Mount_Tambora">Mount Tambora</a> (1815)<br>'
      + 'The red circle indicates where the volcanic ash was more than 100cm deep';
    3: s := '<font color="#FD6A02"><b>Largest eruption in human history</b></font><br>'
      + 'at <a target="_blank" href="https://en.wikipedia.org/wiki/1815_eruption_of_Mount_Tambora">Mount Tambora</a> (1815)<br>'
      + 'The orange circle indicates 5cm of ash fall';
    4: s := '<font color="#FD6A02"><b>Largest eruption in human history</b></font><br>'
      + 'at <a target="_blank" href="https://en.wikipedia.org/wiki/1815_eruption_of_Mount_Tambora">Mount Tambora</a> (1815)<br>'
      + 'The yellow circle shows where ash fell from the sky';
    5: s :='<font color="blue"><b>Central Park</b></font><br>'
      + '<iframe width="200" height="200" src="https://www.youtube.com/embed/Q3aHgtu2UOI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe>';
    6: s := '<font color="green"><b>Longest straight road</b></font><br>'
      + 'at <a target="_blank" href="https://tribune.com.pk/story/1659009/3-saudi-arabias-highway-10-home-worlds-longest-straight-road">Highway 10</a> (256km)<br>'
      + 'Between Haradh and Al Batha';
  end;

  prevPopUp := TMSFNCMaps1.ShowPopup(AEventData.Coordinate.ToRec, s);
end;

procedure TForm1.WebButton1Click(Sender: TObject);
begin
  if MapAPIEdit.Text <> '' then
    TMSFNCMaps1.APIKey := MapAPIEdit.Text;
end;

procedure TForm1.WebFormCreate(Sender: TObject);
var
  lbl: TWebLabel;
begin
  FormContainer := 'appcontent';
  lbl := TLabel.Create(Self);
  lbl.ElementID := 'title';
  lbl.Caption := 'TMS FNC Maps PolyElements, Markers and Popups Demo';

  lbl := TLabel.Create(Self);
  lbl.ElementID := 'description';
  lbl.Caption := 'Powerful cross-platform, cross-framework and cross-service mapping library';
  
  MapServiceComboChange(Self);
  if MapAPIEdit.Text <> '' then
    TMSFNCMaps1.APIKey := MapAPIEdit.Text;
end;

end.