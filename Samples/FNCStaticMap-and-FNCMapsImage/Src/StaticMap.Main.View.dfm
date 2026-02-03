object StaticMapMainView: TStaticMapMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - FNCStaticMap and FNCMapsImage'
  ClientHeight = 664
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
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
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
      Left = 889
      Top = 0
      Width = 8
      Height = 225
      Beveled = True
      ExplicitLeft = 953
    end
    object GroupBox3: TGroupBox
      Left = 377
      Top = 0
      Width = 512
      Height = 225
      Align = alLeft
      Caption = ' Static '
      TabOrder = 0
      ExplicitLeft = 375
      ExplicitTop = -6
      DesignSize = (
        512
        225)
      object Label7: TLabel
        Left = 12
        Top = 19
        Width = 42
        Height = 15
        Caption = 'Address'
      end
      object Label8: TLabel
        Left = 13
        Top = 61
        Width = 62
        Height = 15
        Caption = 'Zoom Level'
      end
      object Label21: TLabel
        Left = 133
        Top = 59
        Width = 84
        Height = 15
        Caption = 'Static Map Type'
      end
      object btnDisplayMapImage: TButton
        Left = 12
        Top = 145
        Width = 484
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Display map image'
        TabOrder = 0
        OnClick = btnDisplayMapImageClick
      end
      object ckAddMarker: TCheckBox
        Left = 13
        Top = 122
        Width = 92
        Height = 17
        Caption = 'Add Marker'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object edtAddress: TEdit
        Left = 12
        Top = 35
        Width = 484
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Text = 'S'#227'o Paulo'
      end
      object spinZoomLevel: TSpinEdit
        Left = 13
        Top = 78
        Width = 116
        Height = 24
        MaxValue = 25
        MinValue = 0
        TabOrder = 3
        Value = 10
      end
      object cBoxStaticMapType: TComboBox
        Left = 133
        Top = 78
        Width = 363
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Text = 'en-US (English '#8211' United States)'
      end
      object btnSaveMapImageToFile: TButton
        Left = 6
        Top = 194
        Width = 484
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Save map image to file.'
        TabOrder = 5
        OnClick = btnSaveMapImageToFileClick
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
      ExplicitLeft = 6
      ExplicitTop = -5
      DesignSize = (
        369
        225)
      object Label5: TLabel
        Left = 9
        Top = 62
        Width = 107
        Height = 15
        Caption = 'API Key (Static Map)'
      end
      object Label2: TLabel
        Left = 9
        Top = 19
        Width = 104
        Height = 15
        Caption = 'Service (Static Map)'
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
      object Label1: TLabel
        Left = 9
        Top = 170
        Width = 109
        Height = 15
        Caption = 'API Key (Geocoding)'
      end
      object Label4: TLabel
        Left = 9
        Top = 123
        Width = 106
        Height = 15
        Caption = 'Service (Geocoding)'
      end
      object edtAPIKeyStaticMap: TEdit
        Left = 9
        Top = 78
        Width = 347
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 0
        OnExit = edtAPIKeyStaticMapExit
      end
      object cBoxServiceStaticMap: TComboBox
        Left = 9
        Top = 35
        Width = 347
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 1
        OnChange = cBoxServiceStaticMapChange
      end
      object edtAPIKeyGeocoding: TEdit
        Left = 9
        Top = 188
        Width = 347
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 2
        OnExit = edtAPIKeyStaticMapExit
      end
      object cBoxServiceGeocoding: TComboBox
        Left = 9
        Top = 140
        Width = 347
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 3
        OnChange = cBoxServiceStaticMapChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 897
      Top = 0
      Width = 394
      Height = 225
      Align = alClient
      Caption = ' Log '
      TabOrder = 2
      ExplicitLeft = 889
      ExplicitWidth = 200
      object mmLog: TMemo
        Left = 2
        Top = 17
        Width = 390
        Height = 206
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitWidth = 733
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 626
    Width = 1291
    Height = 19
    Panels = <
      item
        Text = 
          'TTMSFNCStaticMap '#233' um componente para recuperar uma URL para uma' +
          ' imagem de mapa est'#225'tica para um determinado localiza'#231#227'o geogr'#225'f' +
          'ica'
        Width = 1000
      end>
  end
  object StatusBar2: TStatusBar
    Left = 0
    Top = 645
    Width = 1291
    Height = 19
    Panels = <
      item
        Text = 
          'TTMSFNCMapsImage '#233' um componente Image que pode recuperar automa' +
          'ticamente uma imagem a partir de uma URL e exibi-lo no formul'#225'ri' +
          'o. Ele suporta os formatos BMP, PNG, GIF, ICO, JPEG'
        Width = 1000
      end>
  end
  object TMSFNCMapsImage1: TTMSFNCMapsImage
    Left = 0
    Top = 225
    Width = 1291
    Height = 401
    Align = alClient
    ParentDoubleBuffered = False
    Color = clBtnFace
    DoubleBuffered = True
    TabOrder = 3
    Bitmaps = <>
    Fill.Kind = gfkNone
    Stroke.Kind = gskNone
    ExplicitTop = 219
  end
  object TMSFNCStaticMap1: TTMSFNCStaticMap
    Left = 390
    Top = 314
    Width = 26
    Height = 26
    Visible = True
  end
  object TMSFNCGeocoding1: TTMSFNCGeocoding
    Left = 510
    Top = 314
    Width = 26
    Height = 26
    Visible = True
    OnGetGeocoding = TMSFNCGeocoding1GetGeocoding
    GeocodingRequests = <>
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'png'
    Filter = 
      'Imagens (*.bmp;*.png;*.gif;*.ico;*.jpg;*.jpeg)|*.bmp;*.png;*.gif' +
      ';*.ico;*.jpg;*.jpeg|Bitmap (*.bmp)|*.bmp|PNG (*.png)|*.png|GIF (' +
      '*.gif)|*.gif|'#205'cone (*.ico)|*.ico|JPEG (*.jpg;*.jpeg)|*.jpg;*.jpe' +
      'g'
    Left = 624
    Top = 315
  end
end
