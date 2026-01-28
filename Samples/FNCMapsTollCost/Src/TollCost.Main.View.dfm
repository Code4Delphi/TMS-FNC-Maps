object TollCostMainView: TTollCostMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps TTMSFNCTollCost Demo'
  ClientHeight = 685
  ClientWidth = 1291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 13
  object Splitter3: TSplitter
    Left = 0
    Top = 305
    Width = 1291
    Height = 8
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitWidth = 1589
  end
  object pnMapAndBrowser: TPanel
    Left = 0
    Top = 313
    Width = 1291
    Height = 353
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 411
    object Splitter5: TSplitter
      Left = 870
      Top = 1
      Width = 10
      Height = 351
      Align = alRight
      Beveled = True
      ExplicitLeft = 877
      ExplicitHeight = 409
    end
    object gBoxInstructions: TGroupBox
      Left = 880
      Top = 1
      Width = 410
      Height = 351
      Align = alRight
      Caption = ' Instructions '
      TabOrder = 0
      ExplicitHeight = 409
      object TMSFNCWebBrowser1: TTMSFNCWebBrowser
        Left = 2
        Top = 15
        Width = 406
        Height = 334
        Align = alClient
        ParentDoubleBuffered = False
        DoubleBuffered = True
        TabOrder = 0
        ExplicitHeight = 392
      end
    end
    object pnMap: TPanel
      Left = 1
      Top = 1
      Width = 869
      Height = 351
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 409
      object TMSFNCMaps1: TTMSFNCMaps
        Left = 1
        Top = 1
        Width = 867
        Height = 349
        Align = alClient
        ParentDoubleBuffered = False
        DoubleBuffered = True
        TabOrder = 0
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
        ExplicitHeight = 407
      end
    end
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1291
    Height = 305
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 694
      Top = 0
      Width = 8
      Height = 305
      Beveled = True
      ExplicitLeft = 159
      ExplicitTop = 19
    end
    object Splitter2: TSplitter
      Left = 969
      Top = 0
      Width = 8
      Height = 305
      Beveled = True
      ExplicitLeft = 956
      ExplicitTop = 18
    end
    object Splitter4: TSplitter
      Left = 217
      Top = 0
      Width = 11
      Height = 305
      Beveled = True
      ExplicitLeft = 149
      ExplicitTop = 2
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 217
      Height = 305
      Margins.Bottom = 2
      Align = alLeft
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Config basic '
      TabOrder = 0
      DesignSize = (
        217
        305)
      object Label17: TLabel
        Left = 9
        Top = 62
        Width = 143
        Height = 13
        Caption = 'API Key (Map and Geocoding)'
      end
      object Label18: TLabel
        Left = 9
        Top = 19
        Width = 143
        Height = 13
        Caption = 'Service (Map and Geocoding )'
      end
      object Label21: TLabel
        Left = 9
        Top = 109
        Width = 47
        Height = 13
        Caption = 'Language'
      end
      object edtAPIKeyMap: TEdit
        Left = 9
        Top = 79
        Width = 201
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceMap: TComboBox
        Left = 9
        Top = 36
        Width = 201
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 0
        OnChange = cBoxServiceMapChange
      end
      object cBoxLanguage: TComboBox
        Left = 9
        Top = 128
        Width = 201
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
      Left = 702
      Top = 0
      Width = 267
      Height = 305
      Align = alLeft
      Caption = ' TollCost '
      TabOrder = 2
      DesignSize = (
        267
        305)
      object Label2: TLabel
        Left = 13
        Top = 24
        Width = 28
        Height = 13
        Caption = 'Origin'
      end
      object Label3: TLabel
        Left = 13
        Top = 51
        Width = 54
        Height = 13
        Caption = 'Destination'
      end
      object Label4: TLabel
        Left = 13
        Top = 105
        Width = 59
        Height = 13
        Caption = 'Travel Mode'
      end
      object Label5: TLabel
        Left = 13
        Top = 78
        Width = 44
        Height = 13
        Caption = 'Currency'
      end
      object Label15: TLabel
        Left = 13
        Top = 132
        Width = 67
        Height = 13
        Caption = 'Emission Type'
      end
      object Label16: TLabel
        Left = 13
        Top = 159
        Width = 49
        Height = 13
        Caption = 'CO2 Class'
      end
      object edtOrigin: TEdit
        Left = 82
        Top = 21
        Width = 174
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'New York'
      end
      object edtDestination: TEdit
        Left = 82
        Top = 48
        Width = 174
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Text = 'Washington DC'
      end
      object cBoxTravelMode: TComboBox
        Left = 82
        Top = 102
        Width = 174
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemIndex = 0
        TabOrder = 2
        Text = 'Car'
        Items.Strings = (
          'Car'
          'Truck')
      end
      object cboxCurrency: TComboBox
        Left = 82
        Top = 75
        Width = 174
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemIndex = 1
        TabOrder = 3
        Text = 'USD'
        Items.Strings = (
          'EUR'
          'USD'
          'GBP'
          'BRL'
          'CAD')
      end
      object btnShowTollCost: TButton
        Left = 82
        Top = 193
        Width = 174
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Show Toll Cost'
        TabOrder = 4
        OnClick = btnShowTollCostClick
      end
      object btnClearTollCost: TButton
        Left = 82
        Top = 224
        Width = 174
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Clear Toll Cost'
        TabOrder = 5
        OnClick = btnClearTollCostClick
      end
      object cBoxEmission: TComboBox
        Left = 82
        Top = 129
        Width = 174
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemIndex = 0
        TabOrder = 6
        Text = 'Unknown'
        Items.Strings = (
          'Unknown'
          'Eure Eev'
          'Euro 6'
          'Euro 5'
          'Euro 4'
          'Euro 3'
          'Euro 2'
          'Euro 1')
      end
      object cBoxCO2: TComboBox
        Left = 82
        Top = 156
        Width = 174
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemIndex = 0
        TabOrder = 7
        Text = 'Unknown'
        Items.Strings = (
          'Unknown'
          '1'
          '2'
          '3'
          '4'
          '5')
      end
    end
    object GroupBox3: TGroupBox
      Left = 228
      Top = 0
      Width = 466
      Height = 305
      Align = alLeft
      Caption = ' Config TollCost '
      TabOrder = 1
      ExplicitLeft = 230
      ExplicitTop = 2
      DesignSize = (
        466
        305)
      object Label19: TLabel
        Left = 8
        Top = 86
        Width = 130
        Height = 13
        Caption = 'API Key (for Here TollCost)'
      end
      object Label20: TLabel
        Left = 8
        Top = 19
        Width = 84
        Height = 13
        Caption = 'Service (TollCost)'
      end
      object Shape1: TShape
        Left = 8
        Top = 75
        Width = 445
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Pen.Color = clGray
        ExplicitWidth = 542
      end
      object Label11: TLabel
        Left = 8
        Top = 152
        Width = 59
        Height = 13
        Caption = 'PTV xServer'
      end
      object Shape2: TShape
        Left = 8
        Top = 139
        Width = 445
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Pen.Color = clGray
        ExplicitWidth = 542
      end
      object Label12: TLabel
        Left = 8
        Top = 171
        Width = 48
        Height = 13
        Caption = 'Username'
      end
      object Label13: TLabel
        Left = 8
        Top = 210
        Width = 29
        Height = 13
        Caption = 'Token'
      end
      object Label14: TLabel
        Left = 8
        Top = 250
        Width = 42
        Height = 13
        Caption = 'Endpoint'
      end
      object edtAPIKeyTollCost: TEdit
        Left = 8
        Top = 102
        Width = 445
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 0
        OnExit = edtAPIKeyTollCostExit
      end
      object cBoxServiceTollCost: TComboBox
        Left = 8
        Top = 36
        Width = 445
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        ItemIndex = 0
        TabOrder = 1
        Text = 'Here'
        OnChange = cBoxServiceTollCostChange
        Items.Strings = (
          'Here'
          'PTV xServer')
      end
      object edPTVUserName: TEdit
        Left = 8
        Top = 186
        Width = 445
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object edPTVToken: TEdit
        Left = 8
        Top = 224
        Width = 445
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object edEndPoint: TEdit
        Left = 8
        Top = 265
        Width = 445
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Text = 
          'https://xserver2-europe-eu-test.cloud.ptvgroup.com/services/rs/X' +
          'Route/calculateRoute'
      end
    end
    object gBoxRouteDetails: TGroupBox
      Left = 977
      Top = 0
      Width = 314
      Height = 305
      Align = alClient
      Caption = ' Route Details '
      TabOrder = 3
      ExplicitLeft = 975
      ExplicitTop = 2
      ExplicitWidth = 308
      object Panel2: TPanel
        Left = 2
        Top = 15
        Width = 310
        Height = 54
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 317
        object lbDistance: TLabel
          Left = 96
          Top = 1
          Width = 41
          Height = 13
          Caption = 'Distance'
        end
        object lbDuration: TLabel
          Left = 224
          Top = 1
          Width = 41
          Height = 13
          Caption = 'Duration'
        end
        object Label7: TLabel
          Left = 16
          Top = 33
          Width = 41
          Height = 13
          Caption = 'Toll Cost'
        end
        object lbTotalCost: TLabel
          Left = 96
          Top = 33
          Width = 49
          Height = 13
          Caption = 'Total Cost'
        end
      end
      object ListBoxTollCost: TListBox
        Left = 2
        Top = 69
        Width = 310
        Height = 234
        Align = alClient
        ItemHeight = 13
        TabOrder = 1
        ExplicitWidth = 317
      end
    end
  end
  object TMSFNCGeocoding1: TTMSFNCGeocoding
    Left = 54
    Top = 210
    Width = 26
    Height = 26
    Visible = True
    OnGetGeocoding = TMSFNCGeocoding1GetGeocoding
    GeocodingRequests = <>
  end
  object TMSFNCTollCost1: TTMSFNCTollCost
    Left = 173
    Top = 210
    Width = 26
    Height = 26
    Visible = True
    OnGetTollCost = TMSFNCTollCost1GetTollCost
    TollCostRequests = <>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 666
    Width = 1291
    Height = 19
    Panels = <
      item
        Text = 
          'TTMSFNCTollCost '#233' um componente para recuperar informa'#231#245'es de cu' +
          'sto de ped'#225'gio de rota para coordenadas de origem e destino usan' +
          'do um servi'#231'o REST API existente'
        Width = 1000
      end>
    ExplicitTop = 645
  end
end
