object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Offline'
  ClientHeight = 682
  ClientWidth = 1307
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
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1307
    Height = 145
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 51
      Height = 15
      Caption = 'TileServer'
    end
    object btnSetConfigurations: TButton
      Left = 16
      Top = 77
      Width = 129
      Height = 25
      Caption = 'Set configurations'
      TabOrder = 0
      OnClick = btnSetConfigurationsClick
    end
    object edtTileServer: TEdit
      Left = 16
      Top = 48
      Width = 465
      Height = 23
      TabOrder = 1
      Text = 'http://localhost:3650/api/maps/basic-maptiler/{z}/{x}/{y}.png'
    end
    object Memo1: TMemo
      Left = 800
      Top = 13
      Width = 497
      Height = 116
      Lines.Strings = (
        'Memo1')
      TabOrder = 2
    end
    object Button2: TButton
      Left = 151
      Top = 77
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 3
    end
  end
  object TMSFNCOpenLayers1: TTMSFNCOpenLayers
    Left = 0
    Top = 145
    Width = 1307
    Height = 537
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    OnMapClick = TMSFNCOpenLayers1MapClick
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.DefaultZoomLevel = 12.000000000000000000
    Options.Version = 'v10.2.1'
    LocalFileAccess = True
    LibraryLocation = llOffline
    TileLayers = <>
    ElementContainers = <>
    HeadLinks = <>
    Clusters = <>
    HeatMaps = <>
    ExplicitLeft = -8
  end
end
