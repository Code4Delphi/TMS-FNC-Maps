object CirclesMainView: TCirclesMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Circles'
  ClientHeight = 615
  ClientWidth = 1261
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
    Top = 201
    Width = 1261
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
    Width = 1261
    Height = 201
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 889
      Top = 0
      Width = 10
      Height = 201
      Beveled = True
      ExplicitLeft = 1075
      ExplicitHeight = 191
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 164
      Height = 201
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
        Width = 152
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
        Width = 152
        Height = 23
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
    end
    object Panel1: TPanel
      Left = 164
      Top = 0
      Width = 115
      Height = 201
      Align = alLeft
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 8
      Padding.Right = 5
      TabOrder = 1
      object btnAddCircle: TButton
        Left = 5
        Top = 8
        Width = 105
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Add clircle'
        TabOrder = 0
        OnClick = btnAddCircleClick
      end
      object btnClearAllCircles: TButton
        Left = 5
        Top = 33
        Width = 105
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Clear All Circles'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnClearAllCirclesClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 513
      Top = 0
      Width = 376
      Height = 201
      Align = alLeft
      Caption = 'Circles '
      TabOrder = 2
      object Panel2: TPanel
        Left = 2
        Top = 17
        Width = 372
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
        object btnFocarInCircle: TButton
          Left = 269
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Focar'
          TabOrder = 3
          OnClick = btnFocarInCircleClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 61
        Width = 372
        Height = 138
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
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Latitude'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Longitude'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Radius'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Visible'
            Width = 40
            Visible = True
          end>
      end
    end
    object GroupBox3: TGroupBox
      Left = 279
      Top = 0
      Width = 234
      Height = 201
      Align = alLeft
      Caption = ' Circles when clicking on the map '
      TabOrder = 3
      object Label11: TLabel
        Left = 11
        Top = 100
        Width = 44
        Height = 15
        Caption = 'FillColor'
      end
      object Label12: TLabel
        Left = 143
        Top = 99
        Width = 56
        Height = 15
        Caption = 'FillOpacity'
      end
      object Label2: TLabel
        Left = 11
        Top = 148
        Width = 62
        Height = 15
        Caption = 'StrokeColor'
      end
      object lbStrokeWidth: TLabel
        Left = 143
        Top = 147
        Width = 65
        Height = 15
        Caption = 'StrokeWidth'
      end
      object Label3: TLabel
        Left = 11
        Top = 53
        Width = 90
        Height = 15
        Caption = 'Radius (in meter)'
      end
      object ckAddCircleClickingMap: TCheckBox
        Left = 11
        Top = 26
        Width = 206
        Height = 17
        Cursor = crHandPoint
        Caption = 'Add a circle by clicking on the map'
        TabOrder = 0
      end
      object cBoxFillColor: TComboBox
        Left = 11
        Top = 116
        Width = 130
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
        Left = 143
        Top = 116
        Width = 82
        Height = 23
        TabOrder = 2
        Text = '0.2'
      end
      object cBoxStrokeColor: TComboBox
        Left = 11
        Top = 164
        Width = 130
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
        Left = 143
        Top = 164
        Width = 82
        Height = 23
        NumbersOnly = True
        TabOrder = 4
        Text = '2'
      end
      object edtRadius: TEdit
        Left = 7
        Top = 70
        Width = 130
        Height = 23
        NumbersOnly = True
        TabOrder = 5
        Text = '200000'
      end
    end
    object GroupBox4: TGroupBox
      Left = 899
      Top = 0
      Width = 358
      Height = 201
      Align = alLeft
      Caption = ' Logs Events Circles '
      TabOrder = 4
      object mmLog: TMemo
        Left = 2
        Top = 80
        Width = 354
        Height = 119
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 2
        Top = 17
        Width = 354
        Height = 63
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          354
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
          Left = 292
          Top = 1
          Width = 59
          Height = 26
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          Caption = 'Clear log'
          TabOrder = 2
          OnClick = btnClearLogClick
        end
        object ckLogMouseDown: TCheckBox
          Left = 107
          Top = 3
          Width = 138
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Down'
          TabOrder = 3
        end
        object ckLogMouseLeave: TCheckBox
          Left = 225
          Top = 40
          Width = 122
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Leave'
          TabOrder = 4
        end
        object ckLogMouseUp: TCheckBox
          Left = 108
          Top = 21
          Width = 102
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Up'
          TabOrder = 5
        end
        object ckLogMouseEnter: TCheckBox
          Left = 108
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
    Top = 211
    Width = 1261
    Height = 385
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
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
    ExplicitTop = 207
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 596
    Width = 1261
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
    ExplicitTop = 604
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      730000009619E0BD010000001800000005000000000003000000730002496401
      00490000000100055749445448020002003200084C6174697475646508000400
      00000000094C6F6E676974756465080004000000000006526164697573080004
      00000000000756697369626C6502000300000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Latitude'
        DataType = ftFloat
      end
      item
        Name = 'Longitude'
        DataType = ftFloat
      end
      item
        Name = 'Radius'
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
    object ClientDataSet1Latitude: TFloatField
      DisplayWidth = 10
      FieldName = 'Latitude'
    end
    object ClientDataSet1Longitude: TFloatField
      DisplayWidth = 10
      FieldName = 'Longitude'
    end
    object ClientDataSet1Radius: TFloatField
      FieldName = 'Radius'
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
