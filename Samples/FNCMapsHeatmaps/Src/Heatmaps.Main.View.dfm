object HeatmapsMainView: THeatmapsMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Heatmaps (mapa de calor)'
  ClientHeight = 614
  ClientWidth = 1228
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
    Width = 1228
    Height = 263
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -6
    object Splitter1: TSplitter
      Left = 1172
      Top = 0
      Width = 8
      Height = 263
      Beveled = True
      ExplicitLeft = 620
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
        ExplicitTop = 92
        ExplicitWidth = 188
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
        ExplicitLeft = 6
        ExplicitTop = 0
      end
      object Button1: TButton
        Left = 2
        Top = 236
        Width = 140
        Height = 25
        Align = alBottom
        Caption = 'Test'
        TabOrder = 2
        OnClick = Button1Click
        ExplicitLeft = 0
        ExplicitTop = 235
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
      object Label1: TLabel
        Left = 9
        Top = 22
        Width = 37
        Height = 15
        Caption = 'Service'
      end
      object Label5: TLabel
        Left = 9
        Top = 66
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object cBoxService: TComboBox
        Left = 9
        Top = 38
        Width = 150
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
        Left = 9
        Top = 85
        Width = 150
        Height = 23
        PasswordChar = '*'
        TabOrder = 1
        Text = 'AIzaSyB4M57N8jb8e_UL02psdP9_szUXCxmp1_w'
        OnExit = edtAPIKeyMapExit
      end
    end
    object GroupBox2: TGroupBox
      Left = 913
      Top = 0
      Width = 259
      Height = 263
      Align = alLeft
      Caption = ' Labels when clicking on the map '
      TabOrder = 2
      ExplicitLeft = 361
      DesignSize = (
        259
        263)
      object Label11: TLabel
        Left = 11
        Top = 85
        Width = 56
        Height = 15
        Caption = 'Font Color'
      end
      object Label2: TLabel
        Left = 11
        Top = 128
        Width = 96
        Height = 15
        Caption = 'Background Color'
      end
      object lbFontSize: TLabel
        Left = 145
        Top = 84
        Width = 47
        Height = 15
        Caption = 'Font Size'
      end
      object Label3: TLabel
        Left = 11
        Top = 41
        Width = 21
        Height = 15
        Caption = 'Text'
      end
      object Label4: TLabel
        Left = 11
        Top = 172
        Width = 67
        Height = 15
        Caption = 'Border Color'
      end
      object Label6: TLabel
        Left = 145
        Top = 171
        Width = 70
        Height = 15
        Caption = 'Border Width'
      end
      object ckAddLabelClickingMap: TCheckBox
        Left = 11
        Top = 20
        Width = 238
        Height = 17
        Cursor = crHandPoint
        Caption = 'Add a label by clicking on the map'
        TabOrder = 0
      end
      object cBoxFontColor: TComboBox
        Left = 11
        Top = 101
        Width = 131
        Height = 23
        DropDownCount = 20
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
      object cBoxBackgroundColor: TComboBox
        Left = 11
        Top = 144
        Width = 131
        Height = 23
        DropDownCount = 20
        ItemIndex = 0
        TabOrder = 3
        Text = 'None'
        Items.Strings = (
          'None'
          'clNavy'
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
          'clTeal'
          'clOlive'
          'clGray'
          'clSilver')
      end
      object edtFontSize: TEdit
        Left = 145
        Top = 101
        Width = 105
        Height = 23
        NumbersOnly = True
        TabOrder = 2
        Text = '14'
      end
      object ckBold: TCheckBox
        Left = 11
        Top = 220
        Width = 97
        Height = 17
        Caption = 'Bold'
        TabOrder = 4
      end
      object ckItalic: TCheckBox
        Left = 11
        Top = 237
        Width = 97
        Height = 17
        Caption = 'Italic'
        TabOrder = 5
      end
      object ckUnderline: TCheckBox
        Left = 91
        Top = 220
        Width = 97
        Height = 17
        Caption = 'Underline'
        TabOrder = 6
      end
      object ckStrikeOut: TCheckBox
        Left = 91
        Top = 237
        Width = 97
        Height = 17
        Caption = 'StrikeOut'
        TabOrder = 7
      end
      object edtText: TEdit
        Left = 11
        Top = 58
        Width = 239
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        Text = 'Code4Delphi'
      end
      object cBoxBorderColor: TComboBox
        Left = 11
        Top = 188
        Width = 131
        Height = 23
        DropDownCount = 20
        ItemIndex = 0
        TabOrder = 9
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
      object edtBorderWidth: TEdit
        Left = 145
        Top = 188
        Width = 105
        Height = 23
        NumbersOnly = True
        TabOrder = 10
        Text = '0'
      end
    end
    object GroupBox5: TGroupBox
      Left = 313
      Top = 0
      Width = 600
      Height = 263
      Align = alLeft
      Caption = ' Heatmaps Coordinates '
      TabOrder = 3
      object Panel1: TPanel
        Left = 2
        Top = 17
        Width = 596
        Height = 44
        Align = alTop
        BevelEdges = [beBottom]
        BevelKind = bkTile
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 602
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
      object Panel3: TPanel
        Left = 2
        Top = 233
        Width = 596
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 602
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
          Left = 273
          Top = 0
          Width = 153
          Height = 28
          Cursor = crHandPoint
          Align = alRight
          Caption = 'Add heatmaps'
          TabOrder = 1
          OnClick = btnAddHeatmapsClick
          ExplicitLeft = 279
        end
        object ckZoomInCreated: TCheckBox
          AlignWithMargins = True
          Left = 431
          Top = 3
          Width = 162
          Height = 22
          Cursor = crHandPoint
          Margins.Left = 5
          Align = alRight
          Caption = 'Zoom in created'
          TabOrder = 2
          ExplicitLeft = 437
        end
      end
      object DBGrid1: TDBGrid
        Left = 2
        Top = 61
        Width = 596
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
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 595
    Width = 1228
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
    Top = 263
    Width = 1228
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
    ExplicitLeft = 368
    ExplicitTop = 400
    ExplicitWidth = 500
    ExplicitHeight = 350
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
