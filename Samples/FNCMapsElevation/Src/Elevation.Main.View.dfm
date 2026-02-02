object ElevationMainView: TElevationMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Elevation'
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
      Left = 1335
      Top = 0
      Width = 8
      Height = 225
      Beveled = True
      ExplicitLeft = 1283
      ExplicitTop = -32
      ExplicitHeight = 273
    end
    object Splitter3: TSplitter
      Left = 369
      Top = 0
      Width = 8
      Height = 225
      Beveled = True
      ExplicitLeft = 235
      ExplicitTop = 19
      ExplicitHeight = 263
    end
    object Splitter2: TSplitter
      Left = 631
      Top = 0
      Width = 8
      Height = 225
      Beveled = True
      ExplicitLeft = 549
      ExplicitTop = -6
      ExplicitHeight = 273
    end
    object GroupBox3: TGroupBox
      Left = 377
      Top = 0
      Width = 254
      Height = 225
      Align = alLeft
      TabOrder = 0
      DesignSize = (
        254
        225)
      object btnGetElevation: TButton
        Left = 12
        Top = 16
        Width = 232
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Get Elevation Fixe'
        TabOrder = 0
        OnClick = btnGetElevationClick
      end
      object btnClearElevationData: TButton
        Left = 12
        Top = 78
        Width = 232
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Clear ElevationData'
        TabOrder = 1
        OnClick = btnClearElevationDataClick
      end
      object btnListElevationData: TButton
        Left = 12
        Top = 47
        Width = 232
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = 'List ElevationData'
        TabOrder = 2
        OnClick = btnListElevationDataClick
      end
      object ckGeElevationOnClickMap: TCheckBox
        Left = 13
        Top = 122
        Width = 234
        Height = 17
        Caption = 'Get elevation when clicking on the map'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 369
      Height = 225
      Margins.Bottom = 2
      Align = alLeft
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Config basic '
      TabOrder = 1
      DesignSize = (
        369
        225)
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
        Width = 347
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        Pen.Color = clGray
        ExplicitWidth = 219
      end
      object Label1: TLabel
        Left = 9
        Top = 170
        Width = 91
        Height = 15
        Caption = 'Elevation API Key'
      end
      object Label4: TLabel
        Left = 9
        Top = 123
        Width = 88
        Height = 15
        Caption = 'Elevation Service'
      end
      object edtAPIKeyMap: TEdit
        Left = 9
        Top = 79
        Width = 347
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 0
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceMap: TComboBox
        Left = 9
        Top = 36
        Width = 347
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 1
        OnChange = cBoxServiceMapChange
      end
      object edtAPIKeyElevation: TEdit
        Left = 9
        Top = 186
        Width = 347
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 2
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceElevation: TComboBox
        Left = 9
        Top = 140
        Width = 347
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        DropDownCount = 15
        TabOrder = 3
        OnChange = cBoxServiceMapChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 639
      Top = 0
      Width = 696
      Height = 225
      Align = alLeft
      Caption = ' Log '
      TabOrder = 2
      object Memo1: TMemo
        Left = 2
        Top = 17
        Width = 692
        Height = 206
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 645
    Width = 1291
    Height = 19
    Panels = <
      item
        Text = 
          'TTMSFNCElevation '#233' um componente para recuperar a eleva'#231#227'o para ' +
          'uma localiza'#231#227'o geogr'#225'fica especificada usando um servi'#231'o REST A' +
          'PI existente'
        Width = 1000
      end>
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 225
    Width = 1291
    Height = 420
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
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
    Options.DefaultZoomLevel = 2.000000000000000000
  end
  object TMSFNCElevation1: TTMSFNCElevation
    Left = 704
    Top = 122
    Width = 26
    Height = 26
    Visible = True
    OnGetElevation = TMSFNCElevation1GetElevation
    ElevationRequests = <>
  end
end
