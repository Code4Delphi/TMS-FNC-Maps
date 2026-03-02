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
    Top = 97
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
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 4
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 505
      Height = 97
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
      ExplicitHeight = 145
      DesignSize = (
        505
        97)
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
        ExplicitWidth = 252
      end
    end
    object Button1: TButton
      Left = 576
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 680
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Clear'
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 792
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 944
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Button4'
      TabOrder = 4
      OnClick = Button4Click
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
    ExplicitTop = 644
  end
  object TMSFNCOpenLayers1: TTMSFNCOpenLayers
    Left = 0
    Top = 107
    Width = 1300
    Height = 531
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
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
    ExplicitLeft = 408
    ExplicitTop = 176
    ExplicitWidth = 500
    ExplicitHeight = 350
  end
end
