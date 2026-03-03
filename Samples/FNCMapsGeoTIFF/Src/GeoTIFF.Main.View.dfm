object GeoTIFFMainView: TGeoTIFFMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - GeoTIFF'
  ClientHeight = 657
  ClientWidth = 1313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 217
    Width = 1313
    Height = 10
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitLeft = -407
    ExplicitTop = 241
    ExplicitWidth = 1569
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1313
    Height = 217
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 4
    ExplicitWidth = 1300
    object GroupBox2: TGroupBox
      Left = 225
      Top = 0
      Width = 368
      Height = 217
      Align = alLeft
      Caption = ' GeoTIFF '
      TabOrder = 0
      DesignSize = (
        368
        217)
      object Label2: TLabel
        Left = 10
        Top = 118
        Width = 60
        Height = 15
        Caption = 'URL Geotiff'
      end
      object btnGeoTiff01: TButton
        Left = 10
        Top = 51
        Width = 179
        Height = 25
        Caption = 'Add GeoTiff 01'
        TabOrder = 0
        OnClick = btnGeoTiff01Click
      end
      object Button2: TButton
        Left = 10
        Top = 22
        Width = 179
        Height = 25
        Caption = 'Clear'
        TabOrder = 1
        OnClick = Button2Click
      end
      object btnAddUrl: TButton
        Left = 10
        Top = 166
        Width = 75
        Height = 25
        Caption = 'Add'
        TabOrder = 2
        OnClick = btnAddUrlClick
      end
      object btnGeoTiff02: TButton
        Left = 10
        Top = 82
        Width = 179
        Height = 25
        Caption = 'Add GeoTiff 02'
        TabOrder = 3
        OnClick = btnGeoTiff02Click
      end
      object edtUrl: TEdit
        Left = 10
        Top = 139
        Width = 347
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Text = 
          'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a' +
          '-cogs/23/K/LP/2026/1/S2B_23KLP_20260110_0_L2A/TCI.tif'
        ExplicitWidth = 803
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 225
      Height = 217
      Align = alLeft
      Caption = ' Configs '
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 61
        Width = 41
        Height = 15
        Caption = 'Opacity'
      end
      object ckShowBaseLayer: TCheckBox
        Left = 16
        Top = 30
        Width = 185
        Height = 17
        Caption = 'ShowBaseLayer (default layer)'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = ckShowBaseLayerClick
      end
      object TrackBar1: TTrackBar
        Left = 16
        Top = 78
        Width = 201
        Height = 45
        PageSize = 1
        Position = 9
        TabOrder = 1
        OnTracking = TrackBar1Tracking
      end
    end
    object GroupBox3: TGroupBox
      Left = 593
      Top = 0
      Width = 680
      Height = 217
      Align = alLeft
      Caption = ' Get image links (sentinel-2) '
      TabOrder = 2
      ExplicitLeft = 599
      ExplicitTop = 4
      object mmLog: TMemo
        Left = 2
        Top = 76
        Width = 676
        Height = 139
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 13
        ExplicitHeight = 198
      end
      object Panel1: TPanel
        Left = 2
        Top = 17
        Width = 676
        Height = 59
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = 11
        object Button1: TButton
          Left = 289
          Top = 28
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 0
        end
        object ckGetLinksClickMap: TCheckBox
          Left = 16
          Top = 13
          Width = 209
          Height = 17
          Caption = 'Get links by clicking on the map'
          TabOrder = 1
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 638
    Width = 1313
    Height = 19
    Panels = <
      item
        Text = 
          'GeoTIFF '#233' um formato de imagem raster que armazena dados geogr'#225'f' +
          'icos (como proje'#231#227'o e coordenadas) no pr'#243'prio arquivo, sendo amp' +
          'lamente usado em GIS'
        Width = 1000
      end>
    ExplicitWidth = 1300
  end
  object TMSFNCOpenLayers1: TTMSFNCOpenLayers
    Left = 0
    Top = 227
    Width = 1313
    Height = 411
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
    OnMapDblClick = TMSFNCOpenLayers1MapDblClick
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.DefaultZoomLevel = 2.000000000000000000
    Options.Version = 'v10.7.0'
    LocalFileAccess = True
    TileLayers = <>
    ElementContainers = <>
    HeadLinks = <>
    Clusters = <>
    HeatMaps = <>
    ExplicitTop = 223
  end
end
