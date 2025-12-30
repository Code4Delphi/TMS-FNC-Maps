object PolygonsMainView: TPolygonsMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Polygons and Polylines'
  ClientHeight = 663
  ClientWidth = 1296
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
    Width = 1296
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
      object Label1: TLabel
        Left = 5
        Top = 22
        Width = 37
        Height = 15
        Caption = 'Service'
      end
      object Label5: TLabel
        Left = 5
        Top = 66
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object cBoxService: TComboBox
        Left = 5
        Top = 38
        Width = 186
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
        Left = 5
        Top = 83
        Width = 186
        Height = 23
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
    end
    object Panel1: TPanel
      Left = 817
      Top = 0
      Width = 294
      Height = 241
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 818
      ExplicitTop = -6
      object btnAddPolygon: TButton
        Left = 7
        Top = 30
        Width = 209
        Height = 25
        Cursor = crHandPoint
        Caption = 'Add Polygon (Bermuda triangle)'
        TabOrder = 0
        OnClick = btnAddPolygonClick
      end
      object btnClearAllPolygons: TButton
        Left = 7
        Top = 58
        Width = 209
        Height = 25
        Cursor = crHandPoint
        Caption = 'Clear All Polygons'
        TabOrder = 1
        OnClick = btnClearAllPolygonsClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 198
      Top = 0
      Width = 619
      Height = 241
      Align = alLeft
      Caption = ' Polygon Customized '
      TabOrder = 2
      ExplicitLeft = 197
      ExplicitTop = -6
      object Panel2: TPanel
        Left = 2
        Top = 17
        Width = 615
        Height = 44
        Align = alTop
        BevelEdges = [beBottom]
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 11
        ExplicitWidth = 463
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
          Left = 135
          Top = 14
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
        Width = 615
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
            Width = 117
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Longitude'
            Width = 115
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 2
        Top = 211
        Width = 615
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitWidth = 463
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
          ExplicitLeft = 336
        end
        object btnAddPolygonInMap: TButton
          Left = 292
          Top = 0
          Width = 153
          Height = 28
          Cursor = crHandPoint
          Align = alRight
          Caption = 'Add polygon in map'
          TabOrder = 1
          OnClick = btnAddPolygonInMapClick
          ExplicitLeft = 327
          ExplicitTop = 6
        end
        object ckZoomInCreatedPolygon: TCheckBox
          AlignWithMargins = True
          Left = 450
          Top = 3
          Width = 162
          Height = 22
          Cursor = crHandPoint
          Margins.Left = 5
          Align = alRight
          Caption = 'Zoom in created polygon '
          TabOrder = 2
          ExplicitLeft = 297
          ExplicitTop = 6
          ExplicitHeight = 17
        end
      end
    end
    object gBoxPolylines: TGroupBox
      Left = 1111
      Top = 0
      Width = 185
      Height = 241
      Align = alRight
      Caption = ' Polylines '
      TabOrder = 3
      object btnPolylinesAdd: TButton
        Left = 2
        Top = 17
        Width = 181
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Add Polyline'
        TabOrder = 0
        OnClick = btnPolylinesAddClick
        ExplicitLeft = 3
        ExplicitTop = 11
      end
      object btnPolylinesClear: TButton
        Left = 2
        Top = 42
        Width = 181
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Clear Polylines'
        TabOrder = 1
        OnClick = btnPolylinesClearClick
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 241
    Width = 1296
    Height = 403
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnMapClick = TMSFNCMaps1MapClick
    OnMapMouseMove = TMSFNCMaps1MapMouseMove
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
    ExplicitTop = 242
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 644
    Width = 1296
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
    Left = 397
    Top = 129
  end
  object PopupMenu1: TPopupMenu
    Left = 693
    Top = 272
    object CopyLatitudeAndLongitude1: TMenuItem
      Caption = 'Copy latitude and longitude'
      OnClick = CopyLatitudeAndLongitude1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object AddToPolygonCustomized1: TMenuItem
      Caption = 'Add to Polygon customized'
      OnClick = AddToPolygonCustomized1Click
    end
  end
end
