object ZoomMainView: TZoomMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Zoom'
  ClientHeight = 656
  ClientWidth = 957
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 957
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 198
      Height = 129
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
      ExplicitLeft = -4
      ExplicitTop = -5
      ExplicitHeight = 121
      object Label1: TLabel
        Left = 5
        Top = 22
        Width = 37
        Height = 15
        Caption = 'Service'
      end
      object Label5: TLabel
        Left = 5
        Top = 66
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object cBoxService: TComboBox
        Left = 5
        Top = 39
        Width = 186
        Height = 23
        Style = csDropDownList
        DropDownCount = 15
        TabOrder = 0
        OnChange = cBoxServiceChange
        Items.Strings = (
          'GoogleMaps'
          'Here'
          'AzureMaps'
          'BingMaps'
          'TomTom'
          'MapBox'
          'OpenLayers'
          'MapKit'
          'Leaflet')
      end
      object edtAPIKeyMap: TEdit
        Left = 5
        Top = 83
        Width = 186
        Height = 23
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
    end
    object Panel1: TPanel
      Left = 198
      Top = 0
      Width = 759
      Height = 129
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitHeight = 121
      object GroupBox5: TGroupBox
        Left = 0
        Top = 80
        Width = 759
        Height = 49
        Align = alBottom
        Caption = ' Zoom '
        TabOrder = 0
        ExplicitTop = 72
        object TrackBar1: TTrackBar
          Left = 64
          Top = 17
          Width = 631
          Height = 30
          Align = alClient
          Max = 30
          Min = 2
          Position = 2
          TabOrder = 0
          OnTracking = TrackBar1Tracking
        end
        object btnZoomMin: TButton
          Left = 2
          Top = 17
          Width = 31
          Height = 30
          Align = alLeft
          Caption = '|<'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnZoomMinClick
        end
        object btnZoomMenos: TButton
          Left = 33
          Top = 17
          Width = 31
          Height = 30
          Align = alLeft
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnZoomMenosClick
        end
        object btnZoomMax: TButton
          Left = 726
          Top = 17
          Width = 31
          Height = 30
          Align = alRight
          Caption = '>|'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnZoomMaxClick
        end
        object btnZoomMais: TButton
          Left = 695
          Top = 17
          Width = 31
          Height = 30
          Align = alRight
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = btnZoomMaisClick
        end
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 129
    Width = 957
    Height = 527
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    OnZoomChanged = TMSFNCMaps1ZoomChanged
    OnGetZoomLevel = TMSFNCMaps1GetZoomLevel
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    ElementContainers = <>
    Labels = <>
    HeadLinks = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.DefaultZoomLevel = 1.000000000000000000
    ExplicitTop = 121
    ExplicitHeight = 535
  end
end
