object PolygonsGoogleMainView: TPolygonsGoogleMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps Google - Polygons and Polylines'
  ClientHeight = 663
  ClientWidth = 1162
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
    Width = 1162
    Height = 241
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 198
      Height = 241
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
      object Label5: TLabel
        Left = 5
        Top = 66
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object edtAPIKeyMap: TEdit
        Left = 5
        Top = 83
        Width = 186
        Height = 23
        PasswordChar = '*'
        TabOrder = 0
        OnExit = edtAPIKeyMapExit
      end
    end
    object Panel1: TPanel
      Left = 804
      Top = 0
      Width = 212
      Height = 241
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object btnAddPolygon: TButton
        Left = 7
        Top = 30
        Width = 198
        Height = 25
        Caption = 'Add Polygon (Bermuda triangle)'
        TabOrder = 0
        OnClick = btnAddPolygonClick
      end
      object btnClearAllPolygons: TButton
        Left = 7
        Top = 86
        Width = 198
        Height = 25
        Caption = 'Clear All Polygons'
        TabOrder = 1
        OnClick = btnClearAllPolygonsClick
      end
      object btnAddPolygonHoles: TButton
        Left = 7
        Top = 58
        Width = 198
        Height = 25
        Caption = 'Add Polygon Holes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnAddPolygonHolesClick
      end
    end
    object gBoxPolylines: TGroupBox
      Left = 1016
      Top = 0
      Width = 136
      Height = 241
      Align = alLeft
      Caption = ' Polylines '
      TabOrder = 2
      object btnPolylinesAdd: TButton
        Left = 2
        Top = 17
        Width = 132
        Height = 25
        Align = alTop
        Caption = 'Add Polyline'
        TabOrder = 0
        OnClick = btnPolylinesAddClick
      end
      object btnPolylinesClear: TButton
        Left = 2
        Top = 42
        Width = 132
        Height = 25
        Align = alTop
        Caption = 'Clear Polylines'
        TabOrder = 1
        OnClick = btnPolylinesClearClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 198
      Top = 0
      Width = 606
      Height = 241
      Align = alLeft
      Caption = ' Polygon Customized '
      TabOrder = 3
      ExplicitLeft = 199
      ExplicitTop = -6
      object Panel2: TPanel
        Left = 2
        Top = 17
        Width = 602
        Height = 44
        Align = alTop
        BevelEdges = [beBottom]
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 5
        ExplicitTop = 11
        object Label8: TLabel
          Left = 10
          Top = -1
          Width = 43
          Height = 15
          Caption = 'Latitude'
        end
        object Label9: TLabel
          Left = 135
          Top = -1
          Width = 54
          Height = 15
          Caption = 'Longitude'
        end
        object btnAddCoordinate: TButton
          Left = 259
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
          Width = 124
          Height = 23
          TabOrder = 1
          Text = '32.644482'
        end
        object edtCustomizedLongitude: TEdit
          Left = 134
          Top = 15
          Width = 119
          Height = 23
          TabOrder = 2
          Text = '-131.671452'
        end
        object ckAddCoordinatesClickingMap: TCheckBox
          Left = 364
          Top = 16
          Width = 246
          Height = 17
          Cursor = crHandPoint
          Caption = 'Add coordinates by clicking on the map'
          TabOrder = 3
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 61
        Width = 602
        Height = 150
        Align = alClient
        BorderStyle = bsNone
        DataSource = DataSource1
        TabOrder = 1
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
      object Panel3: TPanel
        Left = 2
        Top = 211
        Width = 602
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
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
        object btnAddPolygonInMap: TButton
          Left = 279
          Top = 0
          Width = 153
          Height = 28
          Cursor = crHandPoint
          Align = alRight
          Caption = 'Add polygon in map'
          TabOrder = 1
          OnClick = btnAddPolygonInMapClick
        end
        object ckZoomInCreatedPolygon: TCheckBox
          AlignWithMargins = True
          Left = 437
          Top = 3
          Width = 162
          Height = 22
          Cursor = crHandPoint
          Margins.Left = 5
          Align = alRight
          Caption = 'Zoom in created polygon '
          TabOrder = 2
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 644
    Width = 1162
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
  end
  object TMSFNCGoogleMaps1: TTMSFNCGoogleMaps
    Left = 0
    Top = 241
    Width = 1162
    Height = 403
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
    OnMapClick = TMSFNCGoogleMaps1MapClick
    OnMapMouseMove = TMSFNCGoogleMaps1MapMouseMove
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
    Left = 313
    Top = 105
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
    Left = 397
    Top = 105
  end
end
