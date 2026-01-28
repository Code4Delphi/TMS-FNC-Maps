object DirectionsMainView: TDirectionsMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Directions - Step by Step'
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
    Height = 313
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 241
      Top = 0
      Width = 8
      Height = 313
      Beveled = True
      ExplicitLeft = 873
      ExplicitTop = -6
      ExplicitHeight = 263
    end
    object Splitter2: TSplitter
      Left = 599
      Top = 0
      Width = 8
      Height = 313
      Beveled = True
      ExplicitLeft = 1273
      ExplicitTop = 19
      ExplicitHeight = 263
    end
    object Splitter4: TSplitter
      Left = 1107
      Top = 0
      Width = 8
      Height = 313
      Beveled = True
      ExplicitLeft = 1153
      ExplicitHeight = 263
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 241
      Height = 313
      Margins.Bottom = 2
      Align = alLeft
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Config basic '
      TabOrder = 0
      DesignSize = (
        241
        313)
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
        Width = 96
        Height = 15
        Caption = 'Directions API Key'
      end
      object Label4: TLabel
        Left = 9
        Top = 123
        Width = 93
        Height = 15
        Caption = 'Directions Service'
      end
      object Label3: TLabel
        Left = 9
        Top = 259
        Width = 52
        Height = 15
        Caption = 'Language'
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
      object edtAPIKeyDirections: TEdit
        Left = 9
        Top = 186
        Width = 219
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 2
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceDirections: TComboBox
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
      object cBoxLanguage: TComboBox
        Left = 9
        Top = 276
        Width = 219
        Height = 23
        ItemIndex = 0
        TabOrder = 4
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
      object cBoxTravelMode: TComboBox
        Left = 9
        Top = 232
        Width = 219
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 5
        OnChange = cBoxServiceMapChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 249
      Top = 0
      Width = 350
      Height = 313
      Align = alLeft
      Caption = ' Route between addresses '
      TabOrder = 1
      DesignSize = (
        350
        313)
      object Label8: TLabel
        Left = 8
        Top = 21
        Width = 69
        Height = 15
        Caption = 'Start Address'
      end
      object Label9: TLabel
        Left = 8
        Top = 68
        Width = 65
        Height = 15
        Caption = 'End Address'
      end
      object btnGetDirections: TButton
        Left = 8
        Top = 151
        Width = 331
        Height = 25
        Caption = 'GetDirections'
        TabOrder = 0
        OnClick = btnGetDirectionsClick
      end
      object edtStartAddress: TEdit
        Left = 8
        Top = 37
        Width = 331
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Text = 'P'#227'o de a'#231'ucar Rio de Janeiro'
      end
      object edtEndAddress: TEdit
        Left = 8
        Top = 84
        Width = 331
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Text = 'Corcovado Rio de Janeiro'
      end
      object ckAlternatives: TCheckBox
        Left = 8
        Top = 119
        Width = 97
        Height = 17
        Caption = 'Alternatives'
        TabOrder = 3
      end
      object Button1: TButton
        Left = 8
        Top = 182
        Width = 331
        Height = 25
        Caption = 'Clear'
        TabOrder = 4
        OnClick = Button1Click
      end
    end
    object GroupBox3: TGroupBox
      Left = 607
      Top = 0
      Width = 500
      Height = 313
      Align = alLeft
      Caption = 'Step by Step'
      TabOrder = 2
      object mmStepByStep: TMemo
        Left = 2
        Top = 17
        Width = 496
        Height = 294
        Align = alClient
        Lines.Strings = (
          '')
        ScrollBars = ssVertical
        TabOrder = 0
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
          'TTMSFNCDirections '#233' componente para recuperar dire'#231#245'es, informa'#231 +
          #245'es de rota e instru'#231#245'es passo a passo para coordenadas de orige' +
          'm e destino'
        Width = 1000
      end>
  end
  object TMSFNCDirections1: TTMSFNCDirections
    Left = 378
    Top = 248
    Width = 26
    Height = 26
    Visible = True
    OnGetDirections = TMSFNCDirections1GetDirections
    DirectionsRequests = <>
  end
  object pnBothMaps: TPanel
    Left = 0
    Top = 313
    Width = 1291
    Height = 287
    Align = alClient
    TabOrder = 4
    object Splitter3: TSplitter
      Left = 864
      Top = 1
      Width = 8
      Height = 285
      Align = alRight
      Beveled = True
      ExplicitLeft = 869
      ExplicitHeight = 335
    end
    object TMSFNCMaps1: TTMSFNCMaps
      Left = 1
      Top = 1
      Width = 863
      Height = 285
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
    end
    object TMSFNCWebBrowser1: TTMSFNCWebBrowser
      Left = 872
      Top = 1
      Width = 418
      Height = 285
      Align = alRight
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 1
    end
  end
end
