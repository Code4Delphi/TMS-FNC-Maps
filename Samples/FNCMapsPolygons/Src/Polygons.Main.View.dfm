object PolygonsMainView: TPolygonsMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Polygons'
  ClientHeight = 663
  ClientWidth = 1017
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
    Width = 1017
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
      ExplicitHeight = 169
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
      Left = 665
      Top = 0
      Width = 352
      Height = 241
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 669
      ExplicitTop = -6
      object btnAddPolygon: TButton
        Left = 6
        Top = 40
        Width = 209
        Height = 25
        Caption = 'Add Polygon (Bermuda triangle)'
        TabOrder = 0
        OnClick = btnAddPolygonClick
      end
      object btnClearAllPolugons: TButton
        Left = 6
        Top = 12
        Width = 209
        Height = 25
        Caption = 'Clear All Polygons'
        TabOrder = 1
        OnClick = btnClearAllPolugonsClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 198
      Top = 0
      Width = 467
      Height = 241
      Align = alLeft
      Caption = ' Polygon Customized '
      TabOrder = 2
      ExplicitTop = -6
      ExplicitHeight = 121
      object Panel2: TPanel
        Left = 2
        Top = 17
        Width = 463
        Height = 44
        Align = alTop
        BevelEdges = [beBottom]
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object Label8: TLabel
          Left = 10
          Top = -1
          Width = 43
          Height = 15
          Caption = 'Latitude'
        end
        object Label9: TLabel
          Left = 145
          Top = -1
          Width = 54
          Height = 15
          Caption = 'Longitude'
        end
        object btnAdd: TButton
          Left = 277
          Top = 12
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Caption = 'Add'
          TabOrder = 0
          OnClick = btnAddClick
        end
        object edtCustomizedLatitude: TEdit
          Left = 9
          Top = 14
          Width = 132
          Height = 23
          TabOrder = 1
          Text = '32.644482'
        end
        object edtCustomizedLongitude: TEdit
          Left = 144
          Top = 14
          Width = 127
          Height = 23
          TabOrder = 2
          Text = '-131.671452'
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 61
        Width = 463
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
        Width = 463
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitLeft = -2
        ExplicitTop = 210
        object btnDelete: TButton
          Left = 388
          Top = 0
          Width = 75
          Height = 28
          Align = alRight
          Caption = 'Delete'
          TabOrder = 0
          OnClick = btnDeleteClick
          ExplicitLeft = 384
          ExplicitTop = -4
        end
        object btnAddPolygonInMap: TButton
          Left = 0
          Top = 0
          Width = 153
          Height = 28
          Align = alLeft
          Caption = 'Add polygon in map'
          TabOrder = 1
          OnClick = btnAddPolygonInMapClick
          ExplicitLeft = 4
          ExplicitTop = -4
        end
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 241
    Width = 1017
    Height = 403
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    PopupMenu = PopupMenu1
    TabOrder = 1
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
    ExplicitTop = 245
    ExplicitHeight = 382
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 644
    Width = 1017
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
    ExplicitLeft = -293
    ExplicitTop = 604
    ExplicitWidth = 1310
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
    Params = <>
    StoreDefs = True
    Left = 313
    Top = 153
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
    Top = 153
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
