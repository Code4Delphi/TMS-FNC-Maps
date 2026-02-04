object PopupsMainView: TPopupsMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Popups'
  ClientHeight = 663
  ClientWidth = 1162
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
    Top = 241
    Width = 1162
    Height = 10
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitLeft = -407
    ExplicitWidth = 1569
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1162
    Height = 241
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 4
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 198
      Height = 241
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
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
      Left = 198
      Top = 0
      Width = 136
      Height = 241
      Align = alLeft
      Caption = ' Polylines '
      TabOrder = 1
      ExplicitLeft = 410
      object btnPolylinesAdd: TButton
        AlignWithMargins = True
        Left = 5
        Top = 17
        Width = 126
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Polyline'
        TabOrder = 0
        OnClick = btnPolylinesAddClick
        ExplicitLeft = 6
        ExplicitTop = 20
      end
      object btnPolylinesClear: TButton
        AlignWithMargins = True
        Left = 5
        Top = 44
        Width = 126
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Clear Polylines'
        TabOrder = 1
        OnClick = btnPolylinesClearClick
        ExplicitLeft = 2
        ExplicitTop = 42
        ExplicitWidth = 132
      end
    end
    object GroupBox2: TGroupBox
      Left = 334
      Top = 0
      Width = 195
      Height = 241
      Align = alLeft
      Caption = ' Polygon '
      TabOrder = 2
      ExplicitLeft = 333
      ExplicitTop = 4
      object btnAddPolygon: TButton
        AlignWithMargins = True
        Left = 5
        Top = 17
        Width = 185
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Polygon (Bermuda triangle)'
        TabOrder = 0
        OnClick = btnAddPolygonClick
        ExplicitLeft = -13
        ExplicitTop = 9
        ExplicitWidth = 198
      end
      object btnClearAllPolygons: TButton
        AlignWithMargins = True
        Left = 5
        Top = 44
        Width = 185
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Clear All Polygons'
        TabOrder = 1
        OnClick = btnClearAllPolygonsClick
        ExplicitLeft = -19
        ExplicitTop = 37
        ExplicitWidth = 198
      end
    end
    object GroupBox3: TGroupBox
      Left = 529
      Top = 0
      Width = 142
      Height = 241
      Align = alLeft
      Caption = ' Markers '
      TabOrder = 3
      ExplicitLeft = 530
      ExplicitTop = 4
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
        ExplicitLeft = -27
        ExplicitTop = 211
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
        ExplicitTop = 71
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
        ExplicitLeft = 6
        ExplicitTop = 98
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
        ExplicitLeft = 6
        ExplicitTop = 101
        ExplicitWidth = 138
      end
    end
    object GroupBox4: TGroupBox
      Left = 671
      Top = 0
      Width = 142
      Height = 241
      Align = alLeft
      Caption = ' Cicle '
      TabOrder = 4
      object btnAddCircle: TButton
        Left = 2
        Top = 17
        Width = 138
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Add clircle'
        TabOrder = 0
        OnClick = btnAddCircleClick
        ExplicitLeft = 5
        ExplicitTop = 8
        ExplicitWidth = 105
      end
      object btnClearAllCircles: TButton
        Left = 2
        Top = 42
        Width = 138
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
        ExplicitLeft = 4
        ExplicitTop = 28
        ExplicitWidth = 105
      end
    end
    object GroupBox5: TGroupBox
      Left = 813
      Top = 0
      Width = 172
      Height = 241
      Align = alLeft
      Caption = ' Popups'
      TabOrder = 5
      ExplicitLeft = 817
      ExplicitTop = 4
      object btnCloseAllPopups: TButton
        Left = 2
        Top = 42
        Width = 168
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
        ExplicitLeft = 4
        ExplicitTop = 11
      end
      object btnAddPopup: TButton
        Left = 2
        Top = 17
        Width = 168
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
        ExplicitLeft = 4
        ExplicitTop = 25
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 251
    Width = 1162
    Height = 393
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
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 644
    Width = 1162
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
end
