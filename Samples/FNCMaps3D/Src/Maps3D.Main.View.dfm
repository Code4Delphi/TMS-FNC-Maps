object Maps3DMainView: TMaps3DMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Maps 3D'
  ClientHeight = 663
  ClientWidth = 1332
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
  object Splitter1: TSplitter
    Left = 0
    Top = 217
    Width = 1332
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
    Width = 1332
    Height = 217
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 321
      Height = 217
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
      DesignSize = (
        321
        217)
      object Label5: TLabel
        Left = 5
        Top = 18
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object edtAPIKeyMap: TEdit
        Left = 5
        Top = 35
        Width = 308
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 0
        OnExit = edtAPIKeyMapExit
      end
    end
    object GroupBox3: TGroupBox
      Left = 321
      Top = 0
      Width = 336
      Height = 217
      Align = alLeft
      Caption = ' Config maps'
      TabOrder = 1
      DesignSize = (
        336
        217)
      object Label1: TLabel
        Left = 5
        Top = 18
        Width = 49
        Height = 15
        Caption = 'MapStyle'
      end
      object Label2: TLabel
        Left = 5
        Top = 62
        Width = 60
        Height = 15
        Caption = 'TimeOfDay'
      end
      object Label3: TLabel
        Left = 5
        Top = 107
        Width = 17
        Height = 15
        Hint = 'Inclina'#231#227'o'
        Caption = 'Tilt'
        ParentShowHint = False
        ShowHint = True
      end
      object Label4: TLabel
        Left = 5
        Top = 153
        Width = 45
        Height = 15
        Hint = 'Inclina'#231#227'o'
        Caption = 'Heading'
        ParentShowHint = False
        ShowHint = True
      end
      object cBoxMapStyle: TComboBox
        Left = 5
        Top = 35
        Width = 323
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = cBoxMapStyleChange
      end
      object cBoxTimeOfDay: TComboBox
        Left = 5
        Top = 79
        Width = 323
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnChange = cBoxMapStyleChange
      end
      object edtTilt: TEdit
        Left = 5
        Top = 123
        Width = 121
        Height = 23
        NumbersOnly = True
        TabOrder = 2
        Text = '70'
        OnExit = edtTiltExit
      end
      object edtHeading: TEdit
        Left = 5
        Top = 170
        Width = 121
        Height = 23
        NumbersOnly = True
        TabOrder = 3
        Text = '0'
        OnExit = edtTiltExit
      end
    end
    object GroupBox2: TGroupBox
      Left = 657
      Top = 0
      Width = 624
      Height = 217
      Align = alLeft
      Caption = ' Config '
      TabOrder = 2
      DesignSize = (
        624
        217)
      object Label6: TLabel
        Left = 6
        Top = 21
        Width = 42
        Height = 15
        Caption = 'Address'
      end
      object btnClearAllMarkers: TButton
        Left = 6
        Top = 98
        Width = 267
        Height = 25
        Caption = 'Clear all Markers'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnClearAllMarkersClick
      end
      object Button2: TButton
        Left = 6
        Top = 67
        Width = 267
        Height = 25
        Caption = 'GetGeocoding with callback'
        TabOrder = 1
        OnClick = Button2Click
      end
      object edtAddress: TEdit
        Left = 6
        Top = 38
        Width = 612
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Text = 'Avenida Paulista S'#227'o Paulo'
      end
      object ckZoomInCreated: TCheckBox
        AlignWithMargins = True
        Left = 281
        Top = 84
        Width = 119
        Height = 22
        Cursor = crHandPoint
        Margins.Left = 5
        Caption = 'Zoom in created'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 644
    Width = 1332
    Height = 19
    Panels = <
      item
        Width = 250
      end
      item
        Width = 250
      end
      item
        Width = 250
      end>
  end
  object TMSFNCMapBox1: TTMSFNCMapBox
    Left = 0
    Top = 227
    Width = 1332
    Height = 417
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
    Options.DefaultZoomLevel = 15.000000000000000000
    Options.Version = '3.5.1'
    Options.Tilt = 70
    ElementContainers = <>
    HeadLinks = <>
  end
  object TMSFNCGeocoding1: TTMSFNCGeocoding
    Left = 957
    Top = 153
    Width = 26
    Height = 26
    Visible = True
    GeocodingRequests = <>
  end
end
