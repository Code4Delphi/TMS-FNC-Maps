object HeatmapsMainView: THeatmapsMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Heatmaps (mapa de calor)'
  ClientHeight = 614
  ClientWidth = 1323
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
    Width = 1323
    Height = 263
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = -6
    ExplicitWidth = 1228
    object Splitter1: TSplitter
      Left = 849
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
      Width = 144
      Height = 263
      Align = alLeft
      Caption = ' Config '
      TabOrder = 0
      ExplicitLeft = 165
      ExplicitTop = -6
      object btnClearAll: TButton
        Left = 2
        Top = 42
        Width = 140
        Height = 25
        Align = alTop
        Caption = 'Clear all'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnClearAllClick
      end
      object btnAddPoint: TButton
        Left = 2
        Top = 17
        Width = 140
        Height = 25
        Align = alTop
        Caption = 'Add point heatmaps'
        TabOrder = 1
        OnClick = btnAddPointClick
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
      ExplicitLeft = -4
      ExplicitTop = -5
      object Label5: TLabel
        Left = 9
        Top = 26
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object edtAPIKeyMap: TEdit
        Left = 9
        Top = 45
        Width = 150
        Height = 23
        PasswordChar = '*'
        TabOrder = 0
        Text = 'AIzaSyB4M57N8jb8e_UL02psdP9_szUXCxmp1_w'
        OnExit = edtAPIKeyMapExit
      end
    end
    object GroupBox5: TGroupBox
      Left = 313
      Top = 0
      Width = 536
      Height = 263
      Align = alLeft
      Caption = ' Heatmaps Coordinates '
      TabOrder = 2
      object Panel1: TPanel
        Left = 2
        Top = 17
        Width = 532
        Height = 44
        Align = alTop
        BevelEdges = [beBottom]
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 11
        ExplicitWidth = 596
        object Label8: TLabel
          Left = 10
          Top = -1
          Width = 43
          Height = 15
          Caption = 'Latitude'
        end
        object Label9: TLabel
          Left = 89
          Top = -1
          Width = 54
          Height = 15
          Caption = 'Longitude'
        end
        object btnAddCoordinate: TButton
          Left = 168
          Top = 12
          Width = 101
          Height = 25
          Cursor = crHandPoint
          Caption = 'Add Coordinate'
          TabOrder = 0
          OnClick = btnAddCoordinateClick
        end
        object edtCustomizedLatitude: TEdit
          Left = 9
          Top = 14
          Width = 78
          Height = 23
          TabOrder = 1
          Text = '32.644482'
        end
        object edtCustomizedLongitude: TEdit
          Left = 89
          Top = 14
          Width = 73
          Height = 23
          TabOrder = 2
          Text = '-131.671452'
        end
        object ckAddCoordinatesClickingMap: TCheckBox
          Left = 273
          Top = 16
          Width = 246
          Height = 17
          Cursor = crHandPoint
          Caption = 'Add coordinates by clicking on the map'
          TabOrder = 3
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 233
        Width = 532
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 596
        object btnDeleteCoordinate: TButton
          Left = 0
          Top = 0
          Width = 127
          Height = 28
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Delete selected item'
          TabOrder = 0
          OnClick = btnDeleteCoordinateClick
        end
        object btnAddHeatmaps: TButton
          Left = 379
          Top = 0
          Width = 153
          Height = 28
          Cursor = crHandPoint
          Align = alRight
          Caption = 'Add heatmaps'
          TabOrder = 1
          OnClick = btnAddHeatmapsClick
          ExplicitLeft = 270
          ExplicitTop = -4
        end
        object ckZoomInCreated: TCheckBox
          AlignWithMargins = True
          Left = 257
          Top = 3
          Width = 119
          Height = 22
          Cursor = crHandPoint
          Margins.Left = 5
          Align = alRight
          Caption = 'Zoom in created'
          TabOrder = 2
          ExplicitLeft = 256
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 61
        Width = 532
        Height = 172
        Align = alClient
        BorderStyle = bsNone
        DataSource = DataSource1
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Order'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Latitude'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Longitude'
            Width = 200
            Visible = True
          end>
      end
    end
    object gBoxPointAToPointB: TGroupBox
      Left = 857
      Top = 0
      Width = 208
      Height = 263
      Align = alLeft
      Caption = ' Point A to point B '
      TabOrder = 3
      ExplicitLeft = 1153
      ExplicitTop = 45
      object Label1: TLabel
        Left = 7
        Top = 33
        Width = 43
        Height = 15
        Caption = 'Latitude'
      end
      object Label7: TLabel
        Left = 108
        Top = 33
        Width = 54
        Height = 15
        Caption = 'Longitude'
      end
      object Label10: TLabel
        Left = 7
        Top = 17
        Width = 40
        Height = 15
        Caption = 'Point A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 7
        Top = 93
        Width = 43
        Height = 15
        Caption = 'Latitude'
      end
      object Label13: TLabel
        Left = 108
        Top = 93
        Width = 54
        Height = 15
        Caption = 'Longitude'
      end
      object Label14: TLabel
        Left = 7
        Top = 77
        Width = 40
        Height = 15
        Caption = 'Point B'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 7
        Top = 138
        Width = 194
        Height = 15
        Caption = 'Number of markings between points'
      end
      object Label16: TLabel
        Left = 6
        Top = 183
        Width = 38
        Height = 15
        Caption = 'Weight'
      end
      object edtLatitudePointA: TEdit
        Left = 7
        Top = 49
        Width = 98
        Height = 23
        TabOrder = 0
        Text = '12.486955'
      end
      object edtLatitudePointB: TEdit
        Left = 108
        Top = 49
        Width = 93
        Height = 23
        TabOrder = 1
        Text = '-13.453081'
      end
      object edtLongitudePointA: TEdit
        Left = 7
        Top = 109
        Width = 98
        Height = 23
        TabOrder = 2
        Text = '-5.334967'
      end
      object edtLongitudePointB: TEdit
        Left = 108
        Top = 109
        Width = 93
        Height = 23
        TabOrder = 3
        Text = '-42.632769'
      end
      object btnPointAToPointB: TButton
        Left = 7
        Top = 229
        Width = 195
        Height = 25
        Caption = 'Add point A to point B'
        TabOrder = 4
        OnClick = btnPointAToPointBClick
      end
      object edtNumberMarkings: TEdit
        Left = 7
        Top = 155
        Width = 195
        Height = 23
        NumbersOnly = True
        TabOrder = 5
        Text = '15'
      end
      object edtWeight: TEdit
        Left = 6
        Top = 200
        Width = 195
        Height = 23
        NumbersOnly = True
        TabOrder = 6
        Text = '10'
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 595
    Width = 1323
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
    ExplicitWidth = 1228
  end
  object TMSFNCGoogleMaps1: TTMSFNCGoogleMaps
    Left = 0
    Top = 263
    Width = 1323
    Height = 332
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
    OnMapClick = TMSFNCGoogleMaps1MapClick
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.DefaultZoomLevel = 2.000000000000000000
    Options.BackgroundColor = clBlack
    Options.StreetView.Coordinate.Longitude = -74.044501999999990000
    Options.StreetView.Coordinate.Latitude = 40.689247000000000000
    Options.DisablePOI = False
    Options.Version = 'weekly'
    ElementContainers = <>
    HeadLinks = <>
    KMLLayers = <>
    Directions = <>
    Clusters = <>
    OverlayViews = <>
    HeatMaps = <>
    ExplicitWidth = 1228
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      4B0000009619E0BD0100000018000000030000000000030000004B00054F7264
      65720400010000000000084C617469747564650800040000000000094C6F6E67
      697475646508000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Order'
        DataType = ftInteger
      end
      item
        Name = 'Latitude'
        DataType = ftFloat
      end
      item
        Name = 'Longitude'
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'order'
    Params = <>
    StoreDefs = True
    Left = 409
    Top = 129
    object ClientDataSet1Order: TIntegerField
      FieldName = 'Order'
    end
    object ClientDataSet1Latitude: TFloatField
      DisplayWidth = 10
      FieldName = 'Latitude'
    end
    object ClientDataSet1Longitude: TFloatField
      DisplayWidth = 10
      FieldName = 'Longitude'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 493
    Top = 129
  end
end
