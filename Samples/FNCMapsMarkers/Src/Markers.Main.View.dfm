object MarkersMainView: TMarkersMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Markers'
  ClientHeight = 646
  ClientWidth = 1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1080
    Height = 193
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 232
      Height = 191
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
      object Label1: TLabel
        Left = 15
        Top = 22
        Width = 37
        Height = 15
        Caption = 'Service'
      end
      object Label5: TLabel
        Left = 15
        Top = 65
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object Label2: TLabel
        Left = 15
        Top = 109
        Width = 52
        Height = 15
        Caption = 'Language'
      end
      object cBoxService: TComboBox
        Left = 15
        Top = 39
        Width = 200
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
        Left = 15
        Top = 82
        Width = 200
        Height = 23
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
      object cBoxLanguage: TComboBox
        Left = 15
        Top = 128
        Width = 200
        Height = 23
        ItemIndex = 0
        TabOrder = 2
        Text = 'en-US (English '#8211' United States)'
        OnChange = cBoxLanguageChange
        Items.Strings = (
          'en-US (English '#8211' United States)'
          'en-GB (English '#8211' Great Britain)'
          'fr-FR (French '#8211' France)'
          'nl-NL (Dutch '#8211' Netherlands)'
          'it-IT (Italian '#8211' Italy)'
          'pt-BR (Portuguese '#8211' Brazil)')
      end
    end
    object GroupBox2: TGroupBox
      Left = 233
      Top = 1
      Width = 456
      Height = 191
      Align = alLeft
      Caption = ' Markers '
      TabOrder = 1
      object Button1: TButton
        Left = 16
        Top = 55
        Width = 209
        Height = 25
        Caption = 'Add Marker default'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 16
        Top = 24
        Width = 209
        Height = 25
        Caption = 'Clear Markers'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 239
        Top = 37
        Width = 209
        Height = 25
        Caption = 'Add Marker '
        TabOrder = 2
      end
      object Button4: TButton
        Left = 16
        Top = 86
        Width = 209
        Height = 25
        Caption = 'Add Marker Ok'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 16
        Top = 117
        Width = 209
        Height = 25
        Caption = 'Add Marker No'
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 16
        Top = 148
        Width = 209
        Height = 25
        Caption = 'Add Marker Customized'
        TabOrder = 5
        OnClick = Button6Click
      end
    end
    object gBoxCustomized: TGroupBox
      Left = 689
      Top = 1
      Width = 390
      Height = 191
      Align = alClient
      Caption = ' Market Customized '
      TabOrder = 2
      object Label3: TLabel
        Left = 10
        Top = 20
        Width = 43
        Height = 15
        Caption = 'Latitude'
      end
      object Label4: TLabel
        Left = 183
        Top = 20
        Width = 54
        Height = 15
        Caption = 'Longitude'
      end
      object Label6: TLabel
        Left = 10
        Top = 65
        Width = 23
        Height = 15
        Caption = 'Title'
      end
      object Label7: TLabel
        Left = 10
        Top = 111
        Width = 47
        Height = 15
        Caption = 'Icon URL'
      end
      object edtCustomizedLatitude: TEdit
        Left = 10
        Top = 37
        Width = 170
        Height = 23
        TabOrder = 0
        Text = '56.819249'
      end
      object edtCustomizedLongitude: TEdit
        Left = 183
        Top = 37
        Width = 170
        Height = 23
        TabOrder = 1
        Text = '-32.198792'
      end
      object btnAddMarkerCustomized: TButton
        Left = 6
        Top = 160
        Width = 343
        Height = 25
        Caption = 'Add Marker C4D'
        TabOrder = 2
        OnClick = btnAddMarkerCustomizedClick
      end
      object edtCustomizedTitle: TEdit
        Left = 10
        Top = 82
        Width = 343
        Height = 23
        TabOrder = 3
        Text = 'Marker C4D teste'
      end
      object edtCustomizedIconURL: TEdit
        Left = 10
        Top = 128
        Width = 343
        Height = 23
        TabOrder = 4
        Text = 'https://code4delphi.com.br/img/c4d-24x24.png'
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 193
    Width = 1080
    Height = 453
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
    Options.DefaultZoomLevel = 1.000000000000000000
  end
end
