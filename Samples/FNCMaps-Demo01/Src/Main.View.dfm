object MainView: TMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Demo01'
  ClientHeight = 653
  ClientWidth = 1121
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1121
    Height = 185
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 37
      Height = 15
      Caption = 'Service'
    end
    object cBoxService: TComboBox
      Left = 24
      Top = 41
      Width = 193
      Height = 23
      Style = csDropDownList
      DropDownCount = 15
      TabOrder = 0
      OnChange = cBoxServiceChange
    end
    object Button1: TButton
      Left = 24
      Top = 81
      Width = 113
      Height = 25
      Caption = 'Zoom'
      TabOrder = 1
      OnClick = Button1Click
    end
    object GroupBox1: TGroupBox
      Left = 435
      Top = 1
      Width = 185
      Height = 183
      Align = alRight
      Caption = ' Markers '
      TabOrder = 2
      object btnAddMarkerDefault: TButton
        Left = 2
        Top = 17
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add marker Default'
        TabOrder = 0
        OnClick = btnAddMarkerDefaultClick
        ExplicitLeft = 0
        ExplicitTop = 11
      end
      object btnAddMarkerOk: TButton
        Left = 2
        Top = 42
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add marker OK'
        TabOrder = 1
        OnClick = btnAddMarkerOkClick
        ExplicitLeft = 0
        ExplicitTop = 36
      end
      object btnAddMarkerNo: TButton
        Left = 2
        Top = 67
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add marker NO'
        TabOrder = 2
        OnClick = btnAddMarkerNoClick
        ExplicitLeft = 0
        ExplicitTop = 61
      end
      object btnAddMarkerC4D: TButton
        Left = 2
        Top = 92
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add marker C4D'
        TabOrder = 3
        OnClick = btnAddMarkerC4DClick
      end
      object btnAddMarkerCustomized: TButton
        Left = 2
        Top = 117
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add marker Customized'
        TabOrder = 4
        OnClick = btnAddMarkerCustomizedClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 620
      Top = 1
      Width = 185
      Height = 183
      Align = alRight
      Caption = ' Polygon  '
      TabOrder = 3
      object btnAddPolygon: TButton
        Left = 2
        Top = 17
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add Polygon (Bermuda triangle)'
        TabOrder = 0
        OnClick = btnAddPolygonClick
        ExplicitLeft = 0
        ExplicitTop = 11
      end
      object btnAddCircle: TButton
        Left = 2
        Top = 42
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add Circle'
        TabOrder = 1
        OnClick = btnAddCircleClick
      end
      object btnAddRectangles: TButton
        Left = 2
        Top = 67
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add Rectangles'
        TabOrder = 2
        OnClick = btnAddRectanglesClick
        ExplicitLeft = 3
        ExplicitTop = 61
      end
    end
    object GroupBox3: TGroupBox
      Left = 805
      Top = 1
      Width = 130
      Height = 183
      Align = alRight
      Caption = ' Labels '
      TabOrder = 4
      object btnAddLabel01: TButton
        Left = 2
        Top = 17
        Width = 126
        Height = 25
        Align = alTop
        Caption = 'Add Label'
        TabOrder = 0
        OnClick = btnAddLabel01Click
        ExplicitLeft = 1
        ExplicitTop = 11
      end
      object btnAddLabel02: TButton
        Left = 2
        Top = 42
        Width = 126
        Height = 25
        Align = alTop
        Caption = 'Add Label'
        TabOrder = 1
        OnClick = btnAddLabel02Click
      end
    end
    object GroupBox4: TGroupBox
      Left = 935
      Top = 1
      Width = 185
      Height = 183
      Align = alRight
      Caption = ' HeatMaps '
      TabOrder = 5
      object Button11: TButton
        Left = 2
        Top = 17
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'HeatMaps'
        TabOrder = 0
        OnClick = Button11Click
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 185
    Width = 1121
    Height = 468
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
    Labels = <
      item
        Text = ''
        Coordinate.Longitude = -74.044501999999990000
        Coordinate.Latitude = 40.689247000000000000
        Visible = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Roboto'
        Font.Style = []
      end>
    HeadLinks = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.DefaultZoomLevel = 12.000000000000000000
  end
end
