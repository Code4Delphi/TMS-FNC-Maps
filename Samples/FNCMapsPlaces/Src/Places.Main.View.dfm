object PlacesMainView: TPlacesMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Places (lugares)'
  ClientHeight = 625
  ClientWidth = 1218
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
    Width = 1218
    Height = 180
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1209
      Top = 0
      Width = 8
      Height = 180
      Beveled = True
      ExplicitLeft = 826
      ExplicitTop = 16
      ExplicitHeight = 263
    end
    object GroupBox3: TGroupBox
      Left = 174
      Top = 0
      Width = 1035
      Height = 180
      Align = alLeft
      Caption = ' Config '
      TabOrder = 0
      DesignSize = (
        1035
        180)
      object Label3: TLabel
        Left = 8
        Top = 22
        Width = 42
        Height = 15
        Caption = 'Address'
      end
      object btnClearAllMarkers: TButton
        Left = 899
        Top = 147
        Width = 130
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Clear all Markers'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnClearAllMarkersClick
      end
      object btnAddMarker: TButton
        Left = 938
        Top = 36
        Width = 91
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Add marker'
        TabOrder = 2
        OnClick = btnAddMarkerClick
      end
      object edtSearch: TEdit
        Left = 7
        Top = 37
        Width = 925
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = edtSearchChange
        OnKeyDown = edtSearchKeyDown
      end
      object ListBoxSearch: TListBox
        Left = 8
        Top = 63
        Width = 924
        Height = 78
        Anchors = [akLeft, akTop, akRight]
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clBtnFace
        ItemHeight = 15
        ScrollWidth = 50
        TabOrder = 3
        OnDblClick = ListBoxSearchDblClick
        OnKeyDown = ListBoxSearchKeyDown
      end
      object ckZoomInCreated: TCheckBox
        AlignWithMargins = True
        Left = 779
        Top = 149
        Width = 116
        Height = 22
        Cursor = crHandPoint
        Margins.Left = 5
        Anchors = [akTop, akRight]
        Caption = 'Zoom in created'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 174
      Height = 180
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 1
      object Label5: TLabel
        Left = 11
        Top = 66
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object Label2: TLabel
        Left = 11
        Top = 20
        Width = 37
        Height = 15
        Caption = 'Service'
      end
      object edtAPIKeyMap: TEdit
        Left = 11
        Top = 85
        Width = 152
        Height = 23
        PasswordChar = '*'
        TabOrder = 0
        Text = ''
        OnExit = edtAPIKeyMapExit
      end
      object cBoxService: TComboBox
        Left = 11
        Top = 37
        Width = 152
        Height = 23
        Style = csDropDownList
        DropDownCount = 15
        TabOrder = 1
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
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 606
    Width = 1218
    Height = 19
    Panels = <
      item
        Text = 
          'TTMSFNCPlaces: Sugest'#245'es de preenchimento autom'#225'tico de endere'#231'o' +
          ' utilizando um servi'#231'o de API REST'
        Width = 1000
      end>
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 180
    Width = 1218
    Height = 426
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
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
  object TMSFNCGeocoding1: TTMSFNCGeocoding
    Left = 360
    Top = 131
    Width = 26
    Height = 26
    Visible = True
    GeocodingRequests = <>
  end
  object TMSFNCPlaces1: TTMSFNCPlaces
    Left = 248
    Top = 131
    Width = 26
    Height = 26
    Visible = True
    OnGetAutoComplete = TMSFNCPlaces1GetAutoComplete
    PlacesRequests = <>
  end
end
