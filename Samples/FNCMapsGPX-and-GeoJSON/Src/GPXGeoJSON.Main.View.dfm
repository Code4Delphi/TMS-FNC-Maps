object GPXGeoJSONMainView: TGPXGeoJSONMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - GPX/GeoJSON'
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
    Height = 263
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 249
      Top = 0
      Width = 8
      Height = 263
      Beveled = True
      ExplicitLeft = 873
      ExplicitTop = -6
    end
    object Splitter2: TSplitter
      Left = 609
      Top = 0
      Width = 8
      Height = 263
      Beveled = True
      ExplicitLeft = 1273
      ExplicitTop = 19
    end
    object Splitter3: TSplitter
      Left = 241
      Top = 0
      Width = 8
      Height = 263
      Beveled = True
      ExplicitLeft = 235
      ExplicitTop = 19
    end
    object GroupBox3: TGroupBox
      Left = 617
      Top = 0
      Width = 312
      Height = 263
      Align = alLeft
      Caption = 'GPX'
      TabOrder = 0
      ExplicitLeft = 615
      ExplicitTop = -6
      object btExport: TButton
        Left = 229
        Top = 35
        Width = 75
        Height = 25
        Caption = 'Export'
        TabOrder = 0
        OnClick = btExportClick
      end
      object btImport: TButton
        Left = 6
        Top = 35
        Width = 75
        Height = 25
        Caption = 'Import'
        TabOrder = 1
        OnClick = btImportClick
      end
      object btnClearMap: TButton
        Left = 6
        Top = 78
        Width = 298
        Height = 25
        Caption = 'Clear map'
        TabOrder = 2
        OnClick = btnClearMapClick
      end
      object btnImportWithWaypoint: TButton
        Left = 85
        Top = 35
        Width = 140
        Height = 25
        Hint = 'Importar com pontos de refer'#234'ncia'
        Caption = 'Import with Waypoint '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnImportWithWaypointClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 241
      Height = 263
      Margins.Bottom = 2
      Align = alLeft
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Config basic '
      TabOrder = 1
      DesignSize = (
        241
        263)
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
        Width = 219
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Pen.Color = clGray
      end
      object Label1: TLabel
        Left = 9
        Top = 170
        Width = 131
        Height = 15
        Caption = 'Route Calculator API Key'
      end
      object Label4: TLabel
        Left = 9
        Top = 123
        Width = 128
        Height = 15
        Caption = 'Route Calculator Service'
      end
      object Label7: TLabel
        Left = 9
        Top = 216
        Width = 65
        Height = 15
        Caption = 'Travel Mode'
      end
      object edtAPIKeyMap: TEdit
        Left = 9
        Top = 79
        Width = 219
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 0
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceMap: TComboBox
        Left = 9
        Top = 36
        Width = 219
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 1
        OnChange = cBoxServiceMapChange
      end
      object edtAPIKeyRoute: TEdit
        Left = 9
        Top = 186
        Width = 219
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 2
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceRoute: TComboBox
        Left = 9
        Top = 140
        Width = 219
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 3
        OnChange = cBoxServiceMapChange
      end
      object cBoxTravelMode: TComboBox
        Left = 9
        Top = 232
        Width = 219
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 4
        OnChange = cBoxServiceMapChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 257
      Top = 0
      Width = 352
      Height = 263
      Align = alLeft
      Caption = ' Route between addresses '
      TabOrder = 2
      DesignSize = (
        352
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
        Width = 331
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Text = 'P'#227'o de a'#231'ucar Rio de Janeiro'
      end
      object edtEndAddress: TEdit
        Left = 6
        Top = 84
        Width = 331
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Text = 'Corcovado Rio de Janeiro'
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
          'TTMSFNCRouteCalculator '#233' um componente para construir e editar r' +
          'otas personalizadas utilizando um servi'#231'o existente de API de ge' +
          'ocoding e directions'
        Width = 1000
      end>
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 263
    Width = 1291
    Height = 337
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
  end
  object TMSFNCRouteCalculator1: TTMSFNCRouteCalculator
    Left = 396
    Top = 170
    Width = 26
    Height = 26
    Visible = True
    OnGetGeocoding = TMSFNCRouteCalculator1GetGeocoding
    Routes = <>
  end
  object OpenDialog1: TOpenDialog
    Left = 648
    Top = 219
  end
  object SaveDialog1: TSaveDialog
    Left = 752
    Top = 219
  end
end
