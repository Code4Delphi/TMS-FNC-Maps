object LabelsMainView: TLabelsMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Labels'
  ClientHeight = 623
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
    object GroupBox3: TGroupBox
      Left = 169
      Top = 0
      Width = 192
      Height = 263
      Align = alLeft
      Caption = ' Labels '
      TabOrder = 0
      object btnAddSimpleLabel: TButton
        Left = 2
        Top = 17
        Width = 188
        Height = 25
        Align = alTop
        Caption = 'Add simple label'
        TabOrder = 0
        OnClick = btnAddSimpleLabelClick
      end
      object btnAddLabelBackgroundColor: TButton
        Left = 2
        Top = 42
        Width = 188
        Height = 25
        Align = alTop
        Caption = 'Add label with background color'
        TabOrder = 1
        OnClick = btnAddLabelBackgroundColorClick
      end
      object btnClearAllLabels: TButton
        Left = 2
        Top = 92
        Width = 188
        Height = 25
        Align = alTop
        Caption = 'Clear all Labels'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnClearAllLabelsClick
      end
      object btnAddLabelWithHTMLAndCSS: TButton
        Left = 2
        Top = 67
        Width = 188
        Height = 25
        Align = alTop
        Caption = 'Add label with HTML and CSS'
        TabOrder = 3
        OnClick = btnAddLabelWithHTMLAndCSSClick
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
        Left = 5
        Top = 83
        Width = 150
        Height = 23
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
    end
    object GroupBox2: TGroupBox
      Left = 361
      Top = 0
      Width = 259
      Height = 263
      Align = alLeft
      Caption = ' Labels when clicking on the map '
      TabOrder = 2
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
    object GroupBox4: TGroupBox
      Left = 620
      Top = 0
      Width = 581
      Height = 263
      Align = alLeft
      Caption = 'Labels'
      TabOrder = 3
      object Panel2: TPanel
        Left = 2
        Top = 17
        Width = 577
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
        Width = 577
        Height = 200
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
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Text'
            Width = 249
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Latitude'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Longitude'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Visible'
            Width = 68
            Visible = True
          end>
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 263
    Width = 1228
    Height = 341
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
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
    Options.DefaultZoomLevel = 2.000000000000000000
    ExplicitTop = 260
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 604
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
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      7D0000009619E0BD0100000018000000050000000000030000007D0002496401
      0049000000010005574944544802000200320004546578740100490000000100
      05574944544802000200C800084C617469747564650800040000000000094C6F
      6E67697475646508000400000000000756697369626C65020003000000000000
      00}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Text'
        DataType = ftString
        Size = 200
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
    object ClientDataSet1Text: TStringField
      FieldName = 'Text'
      Size = 200
    end
    object ClientDataSet1Latitude: TFloatField
      FieldName = 'Latitude'
    end
    object ClientDataSet1Longitude: TFloatField
      FieldName = 'Longitude'
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
