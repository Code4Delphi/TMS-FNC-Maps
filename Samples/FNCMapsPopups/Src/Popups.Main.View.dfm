object PopupsMainView: TPopupsMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Popups'
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
    Top = 289
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
    Height = 289
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 198
      Height = 289
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
      ExplicitHeight = 241
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
        Left = 5
        Top = 83
        Width = 186
        Height = 23
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
    end
    object gBoxPolylines: TGroupBox
      Left = 433
      Top = 0
      Width = 115
      Height = 289
      Align = alLeft
      Caption = ' Polylines '
      TabOrder = 1
      ExplicitLeft = 198
      ExplicitHeight = 153
      object btnPolylinesAdd: TButton
        AlignWithMargins = True
        Left = 5
        Top = 17
        Width = 105
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Polyline'
        TabOrder = 0
        OnClick = btnPolylinesAddClick
        ExplicitWidth = 126
      end
      object btnPolylinesClear: TButton
        AlignWithMargins = True
        Left = 5
        Top = 44
        Width = 105
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Clear Polylines'
        TabOrder = 1
        OnClick = btnPolylinesClearClick
        ExplicitWidth = 126
      end
    end
    object GroupBox2: TGroupBox
      Left = 198
      Top = 0
      Width = 235
      Height = 289
      Align = alLeft
      Caption = ' Polygon '
      TabOrder = 2
      object Label2: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 17
        Width = 225
        Height = 15
        Margins.Top = 0
        Align = alTop
        Caption = ' Text for popup'
        ExplicitWidth = 80
      end
      object btnAddPolygon: TButton
        AlignWithMargins = True
        Left = 5
        Top = 64
        Width = 225
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Polygon (Bermuda triangle)'
        TabOrder = 0
        OnClick = btnAddPolygonClick
        ExplicitTop = 17
        ExplicitWidth = 185
      end
      object btnClearAllPolygons: TButton
        AlignWithMargins = True
        Left = 5
        Top = 91
        Width = 225
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Clear All Polygons'
        TabOrder = 1
        OnClick = btnClearAllPolygonsClick
        ExplicitTop = 44
        ExplicitWidth = 185
      end
      object edtTextForPopup: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 35
        Width = 225
        Height = 23
        Margins.Top = 0
        Margins.Bottom = 6
        Align = alTop
        TabOrder = 2
        Text = 'Subscribe to the Code4Delphi channel'
        ExplicitLeft = 4
        ExplicitTop = 41
        ExplicitWidth = 185
      end
    end
    object GroupBox3: TGroupBox
      Left = 548
      Top = 0
      Width = 142
      Height = 289
      Align = alLeft
      Caption = ' Markers '
      TabOrder = 3
      ExplicitLeft = 529
      ExplicitHeight = 241
      object Button2: TButton
        AlignWithMargins = True
        Left = 5
        Top = 98
        Width = 132
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Clear Markers'
        TabOrder = 0
        OnClick = Button2Click
      end
      object Button4: TButton
        AlignWithMargins = True
        Left = 5
        Top = 17
        Width = 132
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Marker Ok'
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button5: TButton
        AlignWithMargins = True
        Left = 5
        Top = 44
        Width = 132
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Marker No'
        TabOrder = 2
        OnClick = Button5Click
      end
      object btnAddMarkerCustomizedIcon: TButton
        AlignWithMargins = True
        Left = 5
        Top = 71
        Width = 132
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Marker Icon C4D'
        TabOrder = 3
        OnClick = btnAddMarkerCustomizedIconClick
      end
    end
    object GroupBox4: TGroupBox
      Left = 690
      Top = 0
      Width = 109
      Height = 289
      Align = alLeft
      Caption = ' Cicle '
      TabOrder = 4
      ExplicitLeft = 671
      ExplicitHeight = 153
      object btnAddCircle: TButton
        Left = 2
        Top = 17
        Width = 105
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Add clircle'
        TabOrder = 0
        OnClick = btnAddCircleClick
        ExplicitWidth = 138
      end
      object btnClearAllCircles: TButton
        Left = 2
        Top = 42
        Width = 105
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Clear All Circles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnClearAllCirclesClick
        ExplicitWidth = 138
      end
    end
    object GroupBox5: TGroupBox
      Left = 799
      Top = 0
      Width = 139
      Height = 289
      Align = alLeft
      Caption = ' Popups'
      TabOrder = 5
      ExplicitLeft = 780
      ExplicitHeight = 153
      object btnCloseAllPopups: TButton
        Left = 2
        Top = 42
        Width = 135
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Clear All Popups'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnCloseAllPopupsClick
        ExplicitWidth = 168
      end
      object btnAddPopup: TButton
        Left = 2
        Top = 17
        Width = 135
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Add Popups'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnAddPopupClick
        ExplicitWidth = 168
      end
    end
    object gBoxRouteDetails: TGroupBox
      Left = 938
      Top = 0
      Width = 394
      Height = 289
      Align = alClient
      Caption = ' Ids de popups'
      TabOrder = 6
      ExplicitLeft = 902
      ExplicitTop = 4
      ExplicitWidth = 434
      object Panel2: TPanel
        Left = 2
        Top = 17
        Width = 390
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 11
        ExplicitWidth = 430
        object Button1: TButton
          Left = 40
          Top = 13
          Width = 75
          Height = 25
          Caption = 'Close'
          TabOrder = 0
          OnClick = Button1Click
        end
      end
      object ListBoxLogs: TListBox
        Left = 2
        Top = 61
        Width = 390
        Height = 226
        Align = alClient
        ItemHeight = 15
        TabOrder = 1
        ExplicitTop = 71
        ExplicitWidth = 430
        ExplicitHeight = 80
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 299
    Width = 1332
    Height = 345
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    OnMarkerClick = TMSFNCMaps1MarkerClick
    OnPolyElementClick = TMSFNCMaps1PolyElementClick
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
    ExplicitTop = 251
    ExplicitWidth = 1162
    ExplicitHeight = 393
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
    ExplicitWidth = 1162
  end
end
