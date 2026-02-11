object GPXGeoJSONMainView: TGPXGeoJSONMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - GPX/GeoJSON'
  ClientHeight = 680
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
    Height = 263
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 369
      Top = 0
      Width = 8
      Height = 263
      Beveled = True
      ExplicitLeft = 249
      ExplicitTop = -6
    end
    object Splitter2: TSplitter
      Left = 746
      Top = 0
      Width = 8
      Height = 263
      Beveled = True
      ExplicitLeft = 1273
      ExplicitTop = 19
    end
    object Splitter3: TSplitter
      Left = 1257
      Top = 0
      Width = 8
      Height = 263
      Beveled = True
      ExplicitLeft = 1001
      ExplicitTop = -6
    end
    object GroupBox3: TGroupBox
      Left = 754
      Top = 0
      Width = 503
      Height = 263
      Align = alLeft
      Caption = ' GPX '
      TabOrder = 0
      ExplicitLeft = 752
      ExplicitTop = -6
      DesignSize = (
        503
        263)
      object Shape2: TShape
        Left = 8
        Top = 49
        Width = 481
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Pen.Color = clGray
        ExplicitWidth = 347
      end
      object Shape3: TShape
        Left = 8
        Top = 131
        Width = 481
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Pen.Color = clGray
        ExplicitWidth = 347
      end
      object Shape4: TShape
        Left = 8
        Top = 174
        Width = 481
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Pen.Color = clGray
        ExplicitWidth = 347
      end
      object btExport: TButton
        Left = 8
        Top = 18
        Width = 480
        Height = 25
        Caption = 'Export'
        TabOrder = 0
        OnClick = btExportClick
      end
      object btImport: TButton
        Left = 8
        Top = 96
        Width = 480
        Height = 25
        Caption = 'Import'
        TabOrder = 1
        OnClick = btImportClick
      end
      object btnClearMap: TButton
        Left = 8
        Top = 182
        Width = 480
        Height = 26
        Caption = 'Clear map'
        TabOrder = 2
        OnClick = btnClearMapClick
      end
      object btnImportWithWaypoint: TButton
        Left = 8
        Top = 143
        Width = 480
        Height = 25
        Hint = 'Importar com pontos de refer'#234'ncia'
        Caption = 'Import with Waypoint '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnImportWithWaypointClick
      end
      object ckAutoDisplay: TCheckBox
        Left = 7
        Top = 67
        Width = 92
        Height = 17
        Caption = 'Auto Display'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object ckDisplayTimeStamps: TCheckBox
        Left = 343
        Top = 67
        Width = 138
        Height = 17
        Caption = 'Display TimeStamps'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object ckZoomToBounds: TCheckBox
        Left = 102
        Top = 67
        Width = 117
        Height = 17
        Caption = 'Zoom To Bounds'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object ckDisplayElevation: TCheckBox
        Left = 224
        Top = 67
        Width = 119
        Height = 17
        Caption = 'Display Elevation'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 369
      Height = 263
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 1
      ExplicitLeft = 6
      ExplicitTop = -6
      DesignSize = (
        369
        263)
      object Label5: TLabel
        Left = 9
        Top = 59
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object Label2: TLabel
        Left = 9
        Top = 16
        Width = 64
        Height = 15
        Caption = 'Map Service'
      end
      object Shape1: TShape
        Left = 9
        Top = 111
        Width = 347
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Pen.Color = clGray
      end
      object Label1: TLabel
        Left = 9
        Top = 167
        Width = 131
        Height = 15
        Caption = 'Route Calculator API Key'
      end
      object Label4: TLabel
        Left = 9
        Top = 120
        Width = 128
        Height = 15
        Caption = 'Route Calculator Service'
      end
      object Label7: TLabel
        Left = 9
        Top = 213
        Width = 65
        Height = 15
        Caption = 'Travel Mode'
      end
      object edtAPIKeyMap: TEdit
        Left = 9
        Top = 76
        Width = 347
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 0
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceMap: TComboBox
        Left = 9
        Top = 33
        Width = 347
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 1
        OnChange = cBoxServiceMapChange
      end
      object edtAPIKeyRoute: TEdit
        Left = 9
        Top = 183
        Width = 347
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 2
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceRoute: TComboBox
        Left = 9
        Top = 137
        Width = 347
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 3
        OnChange = cBoxServiceMapChange
      end
      object cBoxTravelMode: TComboBox
        Left = 9
        Top = 229
        Width = 347
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 4
        OnChange = cBoxServiceMapChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 377
      Top = 0
      Width = 369
      Height = 263
      Align = alLeft
      Caption = ' Route between addresses '
      TabOrder = 2
      ExplicitLeft = 379
      DesignSize = (
        369
        263)
      object Label8: TLabel
        Left = 6
        Top = 21
        Width = 69
        Height = 15
        Caption = 'Start Address'
      end
      object Label9: TLabel
        Left = 6
        Top = 68
        Width = 65
        Height = 15
        Caption = 'End Address'
      end
      object btnCalculateRouteBetweenAddress: TButton
        Left = 3
        Top = 113
        Width = 211
        Height = 25
        Caption = 'Calculate route between addresses'
        TabOrder = 0
        OnClick = btnCalculateRouteBetweenAddressClick
      end
      object edtStartAddress: TEdit
        Left = 6
        Top = 37
        Width = 355
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Text = 'P'#227'o de a'#231'ucar Rio de Janeiro'
        ExplicitWidth = 394
      end
      object edtEndAddress: TEdit
        Left = 6
        Top = 84
        Width = 355
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Text = 'Corcovado Rio de Janeiro'
        ExplicitWidth = 394
      end
      object btnImportToRouteCalculator: TButton
        Left = 3
        Top = 144
        Width = 209
        Height = 25
        Caption = 'Import to TMSFNCRouteCalculator'
        TabOrder = 3
        OnClick = btnImportToRouteCalculatorClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 661
    Width = 1291
    Height = 19
    Panels = <
      item
        Text = 
          'GPX (GPS eXchange Format) '#233' um formato de arquivo XML criado par' +
          'a trocar dados de GPS entre sistemas e dispositivos'
        Width = 1000
      end>
    ExplicitTop = 600
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 263
    Width = 1291
    Height = 398
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
    Options.DefaultZoomLevel = 12.000000000000000000
    ExplicitTop = 268
  end
  object TMSFNCRouteCalculator1: TTMSFNCRouteCalculator
    Left = 524
    Top = 183
    Width = 26
    Height = 26
    Visible = True
    OnGetGeocoding = TMSFNCRouteCalculator1GetGeocoding
    Routes = <>
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.gpx'
    Filter = 'GPX (*.gpx)|*.gpx'
    Left = 800
    Top = 259
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.gpx'
    Filter = 'GPX (*.gpx)|*.gpx'
    Left = 1016
    Top = 267
  end
end
