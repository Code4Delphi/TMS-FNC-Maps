object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Offline'
  ClientHeight = 658
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
    Height = 113
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 776
      Height = 111
      Align = alLeft
      Caption = ' Config '
      TabOrder = 0
      DesignSize = (
        776
        111)
      object Label1: TLabel
        Left = 163
        Top = 24
        Width = 51
        Height = 15
        Caption = 'TileServer'
      end
      object Label2: TLabel
        Left = 16
        Top = 24
        Width = 82
        Height = 15
        Caption = 'LibraryLocation'
      end
      object btnSetConfigurations: TButton
        Left = 16
        Top = 69
        Width = 145
        Height = 25
        Caption = 'Set configurations'
        TabOrder = 0
        OnClick = btnSetConfigurationsClick
      end
      object edtTileServer: TEdit
        Left = 163
        Top = 40
        Width = 594
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Text = 'http://localhost:3650/api/maps/basic-maptiler/{z}/{x}/{y}.png'
      end
      object cBoxLibraryLocation: TComboBox
        Left = 16
        Top = 40
        Width = 145
        Height = 23
        ItemIndex = 0
        TabOrder = 2
        Text = 'Offline'
        Items.Strings = (
          'Offline'
          'Online')
      end
    end
  end
  object TMSFNCOpenLayers1: TTMSFNCOpenLayers
    Left = 0
    Top = 113
    Width = 1307
    Height = 545
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
    ExplicitHeight = 569
  end
end
