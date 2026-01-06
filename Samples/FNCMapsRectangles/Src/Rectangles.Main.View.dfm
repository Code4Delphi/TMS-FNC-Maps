object RectanglesMainView: TRectanglesMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Rectangles'
  ClientHeight = 663
  ClientWidth = 1464
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
  object Splitter1: TSplitter
    Left = 0
    Top = 250
    Width = 1464
    Height = 10
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitTop = 241
    ExplicitWidth = 1569
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1464
    Height = 250
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 1097
      Top = 0
      Width = 10
      Height = 250
      Beveled = True
      ExplicitLeft = 1075
      ExplicitHeight = 191
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 198
      Height = 250
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
      Left = 198
      Top = 0
      Width = 133
      Height = 250
      Align = alLeft
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 8
      Padding.Right = 5
      TabOrder = 1
      ExplicitLeft = 197
      ExplicitTop = 4
      object btnAddRectangles: TButton
        Left = 5
        Top = 8
        Width = 123
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Add Rectangles'
        TabOrder = 0
        OnClick = btnAddRectanglesClick
      end
      object btnClearAllRectangles: TButton
        Left = 5
        Top = 33
        Width = 123
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Clear All Rectangles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnClearAllRectanglesClick
      end
      object btnAddPolygon: TButton
        Left = 5
        Top = 225
        Width = 123
        Height = 25
        Cursor = crHandPoint
        Align = alBottom
        Caption = 'Add Polygon Test'
        TabOrder = 2
        OnClick = btnAddPolygonClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 617
      Top = 0
      Width = 480
      Height = 250
      Align = alLeft
      Caption = ' Rectangles '
      TabOrder = 2
      object Panel2: TPanel
        Left = 2
        Top = 17
        Width = 476
        Height = 44
        Align = alTop
        BevelEdges = [beBottom]
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        object btnRefresh: TButton
          Left = 4
          Top = 3
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Caption = 'Refresh'
          TabOrder = 0
          OnClick = btnRefreshClick
        end
        object btnDelete: TButton
          Left = 81
          Top = 3
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Caption = 'Delete'
          TabOrder = 1
          OnClick = btnDeleteClick
        end
        object btnVisibleInvisible: TButton
          Left = 159
          Top = 3
          Width = 108
          Height = 25
          Cursor = crHandPoint
          Caption = 'Visible/Invisible'
          TabOrder = 2
          OnClick = btnVisibleInvisibleClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 61
        Width = 476
        Height = 187
        Align = alClient
        BorderStyle = bsNone
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Visible'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NorthEast_Latitude'
            Title.Caption = 'NorthEast Lat'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NorthEast_Longitude'
            Title.Caption = 'NorthEast Long'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SouthWest_Latitude'
            Title.Caption = 'SouthWest Lat'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SouthWest_Longitude'
            Title.Caption = 'SouthWest Long'
            Width = 95
            Visible = True
          end>
      end
    end
    object GroupBox3: TGroupBox
      Left = 331
      Top = 0
      Width = 286
      Height = 250
      Align = alLeft
      Caption = ' Rectangles when clicking on the map '
      TabOrder = 3
      object Label11: TLabel
        Left = 11
        Top = 142
        Width = 44
        Height = 15
        Caption = 'FillColor'
      end
      object Label12: TLabel
        Left = 199
        Top = 141
        Width = 56
        Height = 15
        Caption = 'FillOpacity'
      end
      object Label2: TLabel
        Left = 11
        Top = 190
        Width = 62
        Height = 15
        Caption = 'StrokeColor'
      end
      object lbStrokeWidth: TLabel
        Left = 202
        Top = 189
        Width = 65
        Height = 15
        Caption = 'StrokeWidth'
      end
      object Label3: TLabel
        Left = 11
        Top = 53
        Width = 100
        Height = 15
        Caption = 'Distance (in meter)'
      end
      object Label4: TLabel
        Left = 11
        Top = 98
        Width = 97
        Height = 15
        Caption = 'NorthEast Degrees'
      end
      object Label6: TLabel
        Left = 144
        Top = 98
        Width = 97
        Height = 15
        Caption = 'NorthEast Degrees'
      end
      object ckAddRectanglesClickingMap: TCheckBox
        Left = 11
        Top = 26
        Width = 238
        Height = 17
        Cursor = crHandPoint
        Caption = 'Add a rectangle by clicking on the map'
        TabOrder = 0
      end
      object cBoxFillColor: TComboBox
        Left = 11
        Top = 158
        Width = 185
        Height = 23
        DropDownCount = 15
        TabOrder = 1
        Text = 'clRed'
        Items.Strings = (
          'clBlue'
          'clRed'
          'clBlack'
          'clPink'
          'clGreen'
          'clWhite'
          'clYellow'
          'clLime'
          'clAqua'
          'clFuchsia'
          'clNavy'
          'clTeal'
          'clOlive'
          'clGray'
          'clSilver')
      end
      object edtFillOpacity: TEdit
        Left = 199
        Top = 158
        Width = 74
        Height = 23
        TabOrder = 2
        Text = '0.2'
      end
      object cBoxStrokeColor: TComboBox
        Left = 11
        Top = 206
        Width = 185
        Height = 23
        DropDownCount = 15
        TabOrder = 3
        Text = 'clBlue'
        Items.Strings = (
          'clBlue'
          'clRed'
          'clBlack'
          'clPink'
          'clGreen'
          'clWhite'
          'clYellow'
          'clLime'
          'clAqua'
          'clFuchsia'
          'clNavy'
          'clTeal'
          'clOlive'
          'clGray'
          'clSilver')
      end
      object edtStrokeWidth: TEdit
        Left = 202
        Top = 206
        Width = 71
        Height = 23
        NumbersOnly = True
        TabOrder = 4
        Text = '4'
      end
      object edtDistance: TEdit
        Left = 11
        Top = 70
        Width = 185
        Height = 23
        NumbersOnly = True
        TabOrder = 5
        Text = '500000'
      end
      object edtNorthEastDegrees: TEdit
        Left = 11
        Top = 115
        Width = 131
        Height = 23
        NumbersOnly = True
        TabOrder = 6
        Text = '45'
      end
      object edtSouthWestDegrees: TEdit
        Left = 144
        Top = 115
        Width = 129
        Height = 23
        NumbersOnly = True
        TabOrder = 7
        Text = '225'
      end
    end
    object GroupBox4: TGroupBox
      Left = 1107
      Top = 0
      Width = 334
      Height = 250
      Align = alLeft
      Caption = ' Logs Events Rectangles '
      TabOrder = 4
      object mmLog: TMemo
        Left = 2
        Top = 80
        Width = 330
        Height = 168
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 2
        Top = 17
        Width = 330
        Height = 63
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          330
          63)
        object ckLogClick: TCheckBox
          Left = 4
          Top = 3
          Width = 97
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log click'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object ckLogDblClick: TCheckBox
          Left = 4
          Top = 21
          Width = 97
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log DblClick'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object btnClearLog: TButton
          Left = 265
          Top = 2
          Width = 59
          Height = 26
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          Caption = 'Clear log'
          TabOrder = 2
          OnClick = btnClearLogClick
        end
        object ckLogMouseDown: TCheckBox
          Left = 96
          Top = 3
          Width = 138
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Down'
          TabOrder = 3
        end
        object ckLogMouseLeave: TCheckBox
          Left = 214
          Top = 40
          Width = 122
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Leave'
          TabOrder = 4
        end
        object ckLogMouseUp: TCheckBox
          Left = 97
          Top = 21
          Width = 102
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Up'
          TabOrder = 5
        end
        object ckLogMouseEnter: TCheckBox
          Left = 97
          Top = 40
          Width = 111
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Enter'
          TabOrder = 6
        end
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 260
    Width = 1464
    Height = 384
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnMapClick = TMSFNCMaps1MapClick
    OnMapMouseMove = TMSFNCMaps1MapMouseMove
    OnPolyElementClick = TMSFNCMaps1PolyElementClick
    OnPolyElementDblClick = TMSFNCMaps1PolyElementDblClick
    OnPolyElementMouseUp = TMSFNCMaps1PolyElementMouseUp
    OnPolyElementMouseDown = TMSFNCMaps1PolyElementMouseDown
    OnPolyElementMouseEnter = TMSFNCMaps1PolyElementMouseEnter
    OnPolyElementMouseLeave = TMSFNCMaps1PolyElementMouseLeave
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
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 644
    Width = 1464
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
    end
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      AF0000009619E0BD010000001800000006000000000003000000AF0002496401
      00490000000100055749445448020002003200124E6F727468456173745F4C61
      7469747564650800040000000000134E6F727468456173745F4C6F6E67697475
      6465080004000000000012536F757468576573745F4C61746974756465080004
      000000000013536F757468576573745F4C6F6E67697475646508000400000000
      000756697369626C6502000300000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NorthEast_Latitude'
        DataType = ftFloat
      end
      item
        Name = 'NorthEast_Longitude'
        DataType = ftFloat
      end
      item
        Name = 'SouthWest_Latitude'
        DataType = ftFloat
      end
      item
        Name = 'SouthWest_Longitude'
        DataType = ftFloat
      end
      item
        Name = 'Visible'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 737
    Top = 153
    object ClientDataSet1Id: TStringField
      DisplayWidth = 6
      FieldName = 'Id'
      Size = 50
    end
    object ClientDataSet1NorthEast_Latitude: TFloatField
      FieldName = 'NorthEast_Latitude'
    end
    object ClientDataSet1NorthEast_Longitude: TFloatField
      FieldName = 'NorthEast_Longitude'
    end
    object ClientDataSet1SouthWest_Latitude: TFloatField
      FieldName = 'SouthWest_Latitude'
    end
    object ClientDataSet1SouthWest_Longitude: TFloatField
      FieldName = 'SouthWest_Longitude'
    end
    object ClientDataSet1Visible: TBooleanField
      DisplayWidth = 5
      FieldName = 'Visible'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 821
    Top = 153
  end
end
