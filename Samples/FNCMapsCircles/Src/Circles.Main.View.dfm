object CirclesMainView: TCirclesMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Circles'
  ClientHeight = 663
  ClientWidth = 1569
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
    Width = 1569
    Height = 241
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 1162
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
      Left = 933
      Top = 0
      Width = 212
      Height = 241
      Align = alLeft
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Top = 8
      Padding.Right = 5
      TabOrder = 1
      ExplicitLeft = 805
      object btnAddCircle: TButton
        Left = 5
        Top = 8
        Width = 202
        Height = 25
        Cursor = crHandPoint
        Align = alTop
        Caption = 'Add clircle'
        TabOrder = 0
        OnClick = btnAddCircleClick
        ExplicitTop = 38
        ExplicitWidth = 198
      end
      object btnClearAllCircles: TButton
        Left = 5
        Top = 33
        Width = 202
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
        ExplicitLeft = 6
        ExplicitTop = 69
        ExplicitWidth = 198
      end
    end
    object GroupBox2: TGroupBox
      Left = 198
      Top = 0
      Width = 443
      Height = 241
      Align = alLeft
      Caption = 'Circles '
      TabOrder = 2
      object Panel2: TPanel
        Left = 2
        Top = 17
        Width = 439
        Height = 44
        Align = alTop
        BevelEdges = [beBottom]
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitLeft = -1
        ExplicitTop = 11
        ExplicitWidth = 602
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
        Width = 439
        Height = 178
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
            FieldName = 'Latitude'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Longitude'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Radius'
            Width = 75
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
      Left = 641
      Top = 0
      Width = 292
      Height = 241
      Align = alLeft
      Caption = ' Circles when clicking on the map '
      TabOrder = 3
      ExplicitLeft = 804
      object Label11: TLabel
        Left = 11
        Top = 100
        Width = 44
        Height = 15
        Caption = 'FillColor'
      end
      object Label12: TLabel
        Left = 199
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
        Left = 202
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
        Width = 219
        Height = 17
        Cursor = crHandPoint
        Caption = 'Add a circle by clicking on the map'
        TabOrder = 0
      end
      object cBoxFillColor: TComboBox
        Left = 11
        Top = 116
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
        Top = 116
        Width = 74
        Height = 23
        TabOrder = 2
        Text = '0.2'
      end
      object cBoxStrokeColor: TComboBox
        Left = 11
        Top = 164
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
        Top = 164
        Width = 74
        Height = 23
        NumbersOnly = True
        TabOrder = 4
        Text = '4'
      end
      object edtRadius: TEdit
        Left = 11
        Top = 70
        Width = 185
        Height = 23
        NumbersOnly = True
        TabOrder = 5
        Text = '400000'
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 241
    Width = 1569
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
    ExplicitWidth = 1162
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 644
    Width = 1569
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
    ExplicitWidth = 1162
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
    Left = 297
    Top = 129
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
    Left = 381
    Top = 129
  end
end
