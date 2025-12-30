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
    Height = 201
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 209
      Height = 201
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
      ExplicitLeft = -4
      ExplicitTop = -5
      object Label1: TLabel
        Left = 11
        Top = 21
        Width = 37
        Height = 15
        Caption = 'Service'
      end
      object Label5: TLabel
        Left = 11
        Top = 65
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object cBoxService: TComboBox
        Left = 11
        Top = 38
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
        Left = 11
        Top = 82
        Width = 186
        Height = 23
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
      object ckShowZoomControl: TCheckBox
        Left = 11
        Top = 113
        Width = 186
        Height = 17
        Caption = 'ShowZoomControl'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = ckShowZoomControlClick
      end
      object ckZoomOnDblClick: TCheckBox
        Left = 11
        Top = 134
        Width = 186
        Height = 17
        Caption = 'ZoomOnDblClick'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = ckShowZoomControlClick
      end
      object ckZoomOnWheelScroll: TCheckBox
        Left = 11
        Top = 154
        Width = 186
        Height = 17
        Caption = 'ZoomOnWheelScroll'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = ckShowZoomControlClick
      end
      object ckPanning: TCheckBox
        Left = 11
        Top = 174
        Width = 186
        Height = 17
        Caption = 'Panning'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = ckShowZoomControlClick
      end
    end
    object Panel1: TPanel
      Left = 209
      Top = 0
      Width = 748
      Height = 201
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 197
      ExplicitTop = -6
      ExplicitWidth = 759
      ExplicitHeight = 129
      object GroupBox5: TGroupBox
        Left = 0
        Top = 152
        Width = 748
        Height = 49
        Align = alBottom
        Caption = ' Zoom '
        TabOrder = 0
        ExplicitTop = 80
        ExplicitWidth = 759
        object TrackBar1: TTrackBar
          Left = 64
          Top = 17
          Width = 620
          Height = 30
          Align = alClient
          Max = 30
          Min = 2
          Position = 2
          TabOrder = 0
          OnTracking = TrackBar1Tracking
          ExplicitWidth = 631
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
          Left = 715
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
          ExplicitLeft = 726
        end
        object btnZoomMais: TButton
          Left = 684
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
          ExplicitLeft = 695
        end
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 201
    Width = 957
    Height = 455
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
    ExplicitTop = 205
  end
end
