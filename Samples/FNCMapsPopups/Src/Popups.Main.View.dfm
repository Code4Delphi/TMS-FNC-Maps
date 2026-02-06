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
      Width = 192
      Height = 289
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
      DesignSize = (
        192
        289)
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
        Width = 179
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
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
        Width = 179
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
    end
    object gBoxPolylines: TGroupBox
      Left = 441
      Top = 0
      Width = 115
      Height = 289
      Align = alLeft
      Caption = ' Polylines '
      TabOrder = 1
      ExplicitLeft = 433
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
      end
    end
    object GroupBox2: TGroupBox
      Left = 192
      Top = 0
      Width = 249
      Height = 289
      Align = alLeft
      Caption = ' Polygon '
      TabOrder = 2
      object Label2: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 17
        Width = 239
        Height = 15
        Margins.Top = 0
        Align = alTop
        Caption = ' Text for popup'
        ExplicitLeft = 4
        ExplicitTop = 0
        ExplicitWidth = 225
      end
      object btnAddPolygon: TButton
        AlignWithMargins = True
        Left = 5
        Top = 188
        Width = 239
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Polygon (Bermuda triangle)'
        TabOrder = 0
        OnClick = btnAddPolygonClick
        ExplicitTop = 64
        ExplicitWidth = 225
      end
      object btnClearAllPolygons: TButton
        AlignWithMargins = True
        Left = 5
        Top = 215
        Width = 239
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Clear All Polygons'
        TabOrder = 1
        OnClick = btnClearAllPolygonsClick
        ExplicitTop = 91
        ExplicitWidth = 225
      end
      object mmTextForPopup: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 35
        Width = 239
        Height = 147
        Margins.Top = 0
        Margins.Bottom = 6
        Align = alTop
        Lines.Strings = (
          'Subscribe to the <b>Code4Delphi</b> '
          'channel')
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 556
      Top = 0
      Width = 142
      Height = 289
      Align = alLeft
      Caption = ' Markers '
      TabOrder = 3
      ExplicitLeft = 548
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
      Left = 698
      Top = 0
      Width = 107
      Height = 289
      Align = alLeft
      Caption = ' Cicle '
      TabOrder = 4
      ExplicitLeft = 684
      object btnAddCircle: TButton
        Left = 2
        Top = 17
        Width = 103
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Add clircle'
        TabOrder = 0
        OnClick = btnAddCircleClick
        ExplicitWidth = 105
      end
      object btnClearAllCircles: TButton
        Left = 2
        Top = 42
        Width = 103
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
        ExplicitWidth = 105
      end
    end
    object GroupBox5: TGroupBox
      Left = 805
      Top = 0
      Width = 139
      Height = 289
      Align = alLeft
      Caption = ' Popups'
      TabOrder = 5
      ExplicitLeft = 799
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
      end
    end
    object gBoxRouteDetails: TGroupBox
      Left = 944
      Top = 0
      Width = 388
      Height = 289
      Align = alClient
      Caption = ' Ids de popups'
      TabOrder = 6
      ExplicitLeft = 938
      ExplicitWidth = 394
      object Panel2: TPanel
        Left = 2
        Top = 17
        Width = 384
        Height = 44
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 390
        object btnClosePopupByID: TButton
          Left = 4
          Top = 13
          Width = 141
          Height = 25
          Caption = 'Close popup by ID'
          TabOrder = 0
          OnClick = btnClosePopupByIDClick
        end
      end
      object ListBoxLogs: TListBox
        Left = 2
        Top = 61
        Width = 384
        Height = 226
        Align = alClient
        ItemHeight = 15
        TabOrder = 1
        ExplicitWidth = 390
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
end
