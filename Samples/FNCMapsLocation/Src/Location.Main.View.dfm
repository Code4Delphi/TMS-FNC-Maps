object LocationMainView: TLocationMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Location'
  ClientHeight = 619
  ClientWidth = 1291
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
    Width = 1291
    Height = 273
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -6
    object Splitter1: TSplitter
      Left = 881
      Top = 0
      Width = 8
      Height = 273
      Beveled = True
      ExplicitLeft = 873
      ExplicitTop = -6
      ExplicitHeight = 263
    end
    object Splitter3: TSplitter
      Left = 505
      Top = 0
      Width = 8
      Height = 273
      Beveled = True
      ExplicitLeft = 235
      ExplicitTop = 19
      ExplicitHeight = 263
    end
    object GroupBox3: TGroupBox
      Left = 513
      Top = 0
      Width = 368
      Height = 273
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = 503
      ExplicitTop = -6
      ExplicitHeight = 233
      DesignSize = (
        368
        273)
      object btnGetGeocoding: TButton
        Left = 7
        Top = 15
        Width = 350
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Get current geographic location'
        TabOrder = 0
        OnClick = btnGetGeocodingClick
      end
      object btnClearMarkers: TButton
        Left = 6
        Top = 46
        Width = 350
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Clear Markers'
        TabOrder = 1
        OnClick = btnClearMarkersClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 505
      Height = 273
      Margins.Bottom = 2
      Align = alLeft
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Config basic '
      TabOrder = 1
      DesignSize = (
        505
        273)
      object Label5: TLabel
        Left = 9
        Top = 62
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object Label2: TLabel
        Left = 9
        Top = 19
        Width = 64
        Height = 15
        Caption = 'Map Service'
      end
      object Shape1: TShape
        Left = 9
        Top = 114
        Width = 483
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Pen.Color = clGray
        ExplicitWidth = 219
      end
      object Label1: TLabel
        Left = 9
        Top = 170
        Width = 89
        Height = 15
        Caption = 'Location API Key'
      end
      object Label4: TLabel
        Left = 9
        Top = 123
        Width = 86
        Height = 15
        Caption = 'Location Service'
      end
      object Label3: TLabel
        Left = 9
        Top = 219
        Width = 111
        Height = 15
        Caption = 'Location Connection'
      end
      object edtAPIKeyMap: TEdit
        Left = 9
        Top = 79
        Width = 483
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 0
        OnExit = edtAPIKeyMapExit
        ExplicitWidth = 219
      end
      object cBoxServiceMap: TComboBox
        Left = 9
        Top = 36
        Width = 483
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 1
        OnChange = cBoxServiceMapChange
        ExplicitWidth = 219
      end
      object edtAPIKeyLocation: TEdit
        Left = 9
        Top = 186
        Width = 483
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 2
        OnExit = edtAPIKeyMapExit
        ExplicitWidth = 219
      end
      object cBoxServiceLocation: TComboBox
        Left = 9
        Top = 140
        Width = 483
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 3
        OnChange = cBoxServiceMapChange
        ExplicitWidth = 219
      end
      object cBoxLocationConnection: TComboBox
        Left = 9
        Top = 236
        Width = 483
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 4
        OnChange = cBoxServiceMapChange
        OnExit = edtAPIKeyMapExit
        ExplicitWidth = 475
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 600
    Width = 1291
    Height = 19
    Panels = <
      item
        Text = 
          'FNCMapsLocation '#233' um componente para recuperar a localiza'#231#227'o geo' +
          'gr'#225'fica atual usando um servi'#231'o REST API existente'
        Width = 1000
      end>
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 273
    Width = 1291
    Height = 327
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
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
    Options.DefaultZoomLevel = 2.000000000000000000
    ExplicitLeft = 8
    ExplicitTop = 261
    ExplicitHeight = 337
  end
  object TMSFNCLocation1: TTMSFNCLocation
    Left = 680
    Top = 114
    Width = 26
    Height = 26
    Visible = True
    Connection = lcHTTP
    OnGetLocation = TMSFNCLocation1GetLocation
    LocationRequests = <>
  end
end
