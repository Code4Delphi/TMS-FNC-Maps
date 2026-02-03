object TimeZoneMainView: TTimeZoneMainView
  Left = 0
  Top = 0
  Caption = 'TMSFNCMaps TTMSFNCTimeZone Demo'
  ClientHeight = 558
  ClientWidth = 1118
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
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 225
    Width = 1118
    Height = 314
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
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
    Options.DefaultZoomLevel = 1.000000000000000000
    ExplicitLeft = 225
    ExplicitTop = 57
    ExplicitWidth = 582
    ExplicitHeight = 432
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1118
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = -173
    ExplicitWidth = 1291
    object Splitter1: TSplitter
      Left = 369
      Top = 0
      Width = 8
      Height = 225
      Beveled = True
      ExplicitLeft = 368
      ExplicitTop = -6
    end
    object Splitter2: TSplitter
      Left = 777
      Top = 0
      Width = 8
      Height = 225
      Beveled = True
      ExplicitLeft = 953
    end
    object GroupBox3: TGroupBox
      Left = 377
      Top = 0
      Width = 400
      Height = 225
      Align = alLeft
      Caption = ' Static '
      TabOrder = 0
      DesignSize = (
        400
        225)
      object Label7: TLabel
        Left = 12
        Top = 19
        Width = 39
        Height = 13
        Caption = 'Address'
      end
      object btnGetTimeZone: TButton
        Left = 6
        Top = 76
        Width = 372
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Get TimeZone'
        TabOrder = 0
        OnClick = btnGetTimeZoneClick
      end
      object edtAddress: TEdit
        Left = 12
        Top = 35
        Width = 372
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Text = 'S'#227'o Paulo'
        ExplicitWidth = 484
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 369
      Height = 225
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 1
      DesignSize = (
        369
        225)
      object Label6: TLabel
        Left = 9
        Top = 62
        Width = 69
        Height = 13
        Caption = 'API Key (Map)'
      end
      object Label9: TLabel
        Left = 9
        Top = 19
        Width = 66
        Height = 13
        Caption = 'Service (Map)'
      end
      object Shape1: TShape
        Left = 9
        Top = 114
        Width = 347
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Pen.Color = clGray
        ExplicitWidth = 219
      end
      object Label10: TLabel
        Left = 9
        Top = 170
        Width = 169
        Height = 13
        Caption = 'API Key (TimeZone and Geocoding)'
      end
      object Label11: TLabel
        Left = 9
        Top = 123
        Width = 166
        Height = 13
        Caption = 'Service (TimeZone and Geocoding)'
      end
      object edtAPIKeyMap: TEdit
        Left = 9
        Top = 78
        Width = 347
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 0
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceMap: TComboBox
        Left = 9
        Top = 35
        Width = 347
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 1
        OnChange = cBoxServiceMapChange
      end
      object edtAPIKeyTimeZone: TEdit
        Left = 9
        Top = 188
        Width = 347
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 2
        OnExit = edtAPIKeyTimeZoneExit
      end
      object cBoxServiceTimeZone: TComboBox
        Left = 9
        Top = 140
        Width = 347
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 3
        OnChange = cBoxServiceTimeZoneChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 785
      Top = 0
      Width = 333
      Height = 225
      Align = alClient
      Caption = ' TimeZone Information '
      TabOrder = 2
      ExplicitLeft = 897
      ExplicitWidth = 394
      object mmLog: TMemo
        Left = 2
        Top = 15
        Width = 329
        Height = 208
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitWidth = 390
      end
    end
  end
  object TMSFNCGeocoding1: TTMSFNCGeocoding
    Left = 552
    Top = 288
    Width = 26
    Height = 26
    Visible = True
    OnGetGeocoding = TMSFNCGeocoding1GetGeocoding
    GeocodingRequests = <>
  end
  object TMSFNCTimeZone1: TTMSFNCTimeZone
    Left = 688
    Top = 288
    Width = 26
    Height = 26
    Visible = True
    OnGetTimeZone = TMSFNCTimeZone1GetTimeZone
    TimeZoneRequests = <>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 539
    Width = 1118
    Height = 19
    Panels = <
      item
        Text = 
          'TTMSFNCTimeZone '#233' um componente para recuperar informa'#231#245'es de fu' +
          'so hor'#225'rio para uma localiza'#231#227'o geogr'#225'fica especificada usando u' +
          'm servi'#231'o de API existente'
        Width = 1000
      end>
    ExplicitTop = 545
  end
end
