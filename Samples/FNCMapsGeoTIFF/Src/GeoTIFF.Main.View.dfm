object GeoTIFFMainView: TGeoTIFFMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - GeoTIFF'
  ClientHeight = 657
  ClientWidth = 1300
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
    Width = 1300
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
    Width = 1300
    Height = 217
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 505
      Height = 217
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
      DesignSize = (
        505
        217)
      object Label5: TLabel
        Left = 5
        Top = 26
        Width = 108
        Height = 15
        Caption = 'OpenLayers API Key:'
      end
      object edtAPIKeyMap: TEdit
        Left = 5
        Top = 43
        Width = 492
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 505
      Top = 0
      Width = 320
      Height = 217
      Align = alLeft
      Caption = ' Comands '
      TabOrder = 1
      object Button1: TButton
        Left = 24
        Top = 42
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 208
        Top = 25
        Width = 75
        Height = 25
        Caption = 'Clear'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 113
        Top = 42
        Width = 75
        Height = 25
        Caption = 'Button3'
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 113
        Top = 73
        Width = 75
        Height = 25
        Caption = 'Button4'
        TabOrder = 3
        OnClick = Button4Click
      end
      object btnTif01: TButton
        Left = 232
        Top = 56
        Width = 75
        Height = 25
        Caption = 'btnTif01'
        TabOrder = 4
        OnClick = btnTif01Click
      end
      object btnTif02: TButton
        Left = 224
        Top = 87
        Width = 75
        Height = 25
        Caption = 'btnTif02'
        TabOrder = 5
        OnClick = btnTif02Click
      end
      object btnTif03: TButton
        Left = 224
        Top = 118
        Width = 75
        Height = 25
        Caption = 'btnTif03'
        TabOrder = 6
        OnClick = btnTif03Click
      end
      object edtLoadTifs: TButton
        Left = 80
        Top = 144
        Width = 75
        Height = 25
        Caption = 'LoadTifs'
        TabOrder = 7
        OnClick = edtLoadTifsClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 825
      Top = 0
      Width = 440
      Height = 217
      Align = alLeft
      Caption = ' Logs '
      TabOrder = 2
      object mmLogs: TMemo
        Left = 2
        Top = 17
        Width = 436
        Height = 198
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 638
    Width = 1300
    Height = 19
    Panels = <
      item
        Text = 
          'GeoTIFF '#233' um formato de imagem raster que armazena dados geogr'#225'f' +
          'icos (como proje'#231#227'o e coordenadas) no pr'#243'prio arquivo, sendo amp' +
          'lamente usado em GIS'
        Width = 1000
      end>
  end
  object TMSFNCOpenLayers1: TTMSFNCOpenLayers
    Left = 0
    Top = 227
    Width = 1300
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
  end
end
