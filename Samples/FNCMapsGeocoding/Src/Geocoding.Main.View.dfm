object GeocodingMainView: TGeocodingMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Geocoding'
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
      Left = 793
      Top = 0
      Width = 8
      Height = 263
      Beveled = True
      ExplicitLeft = 826
      ExplicitTop = 16
    end
    object GroupBox3: TGroupBox
      Left = 169
      Top = 0
      Width = 624
      Height = 263
      Align = alLeft
      Caption = ' Config '
      TabOrder = 0
      ExplicitLeft = 171
      ExplicitTop = -6
      DesignSize = (
        624
        263)
      object Label3: TLabel
        Left = 6
        Top = 21
        Width = 42
        Height = 15
        Caption = 'Address'
      end
      object btnClearAllMarkers: TButton
        Left = 6
        Top = 131
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
      object btnOnGetGeocodingEvent: TButton
        Left = 6
        Top = 67
        Width = 267
        Height = 25
        Caption = 'Using the OnGetGeocoding event with ID'
        TabOrder = 1
        OnClick = btnOnGetGeocodingEventClick
      end
      object Button2: TButton
        Left = 6
        Top = 98
        Width = 267
        Height = 25
        Caption = 'GetGeocoding with callback'
        TabOrder = 2
        OnClick = Button2Click
      end
      object edtAddress: TEdit
        Left = 6
        Top = 38
        Width = 612
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Text = 'P'#227'o de a'#231'ucar Rio de Janeiro'
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
        TabOrder = 4
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 169
      Height = 263
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 1
      object Label5: TLabel
        Left = 9
        Top = 66
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object Label2: TLabel
        Left = 9
        Top = 22
        Width = 37
        Height = 15
        Caption = 'Service'
      end
      object edtAPIKeyMap: TEdit
        Left = 9
        Top = 85
        Width = 150
        Height = 23
        PasswordChar = '*'
        TabOrder = 0
        OnExit = edtAPIKeyMapExit
      end
      object cBoxService: TComboBox
        Left = 9
        Top = 38
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
    object GroupBox2: TGroupBox
      Left = 801
      Top = 0
      Width = 490
      Height = 263
      Align = alClient
      Caption = ' Logs '
      TabOrder = 2
      object Panel1: TPanel
        Left = 2
        Top = 17
        Width = 486
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object ckGetReverseGeocodingByClickingMap: TCheckBox
          Left = 4
          Top = 4
          Width = 277
          Height = 17
          Caption = 'GetReverseGeocoding by clicking on the map'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
      object mmLog: TMemo
        Left = 2
        Top = 48
        Width = 486
        Height = 213
        Align = alClient
        TabOrder = 1
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
          'TMSFNCGeocoding: Geocodifica'#231#227'o de um endere'#231'o ou a geocodifica'#231 +
          #227'o reversa de uma coordenada utilizando um servi'#231'o de API REST'
        Width = 1000
      end>
  end
  object TMSFNCGeocoding1: TTMSFNCGeocoding
    Left = 69
    Top = 114
    Width = 26
    Height = 26
    Visible = True
    OnGetGeocoding = TMSFNCGeocoding1GetGeocoding
    OnGetReverseGeocodingResult = TMSFNCGeocoding1GetReverseGeocodingResult
    GeocodingRequests = <>
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 263
    Width = 1291
    Height = 337
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 4
    OnMapClick = TMSFNCMaps1MapClick
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
end
