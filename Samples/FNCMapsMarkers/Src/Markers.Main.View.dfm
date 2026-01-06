object MarkersMainView: TMarkersMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Markers'
  ClientHeight = 646
  ClientWidth = 1310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 189
    Width = 1310
    Height = 6
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitTop = 193
    ExplicitWidth = 1193
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1310
    Height = 189
    Align = alTop
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 966
      Top = 1
      Width = 10
      Height = 187
      Align = alRight
      Beveled = True
      ExplicitLeft = 1075
      ExplicitHeight = 191
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 198
      Height = 187
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
        Top = 69
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object Label2: TLabel
        Left = 5
        Top = 115
        Width = 52
        Height = 15
        Caption = 'Language'
      end
      object cBoxService: TComboBox
        Left = 5
        Top = 39
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
        Top = 86
        Width = 186
        Height = 23
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
      object cBoxLanguage: TComboBox
        Left = 5
        Top = 132
        Width = 186
        Height = 23
        ItemIndex = 0
        TabOrder = 2
        Text = 'en-US (English '#8211' United States)'
        OnChange = cBoxLanguageChange
        Items.Strings = (
          'en-US (English '#8211' United States)'
          'en-GB (English '#8211' Great Britain)'
          'fr-FR (French '#8211' France)'
          'nl-NL (Dutch '#8211' Netherlands)'
          'it-IT (Italian '#8211' Italy)'
          'pt-BR (Portuguese '#8211' Brazil)')
      end
    end
    object GroupBox2: TGroupBox
      Left = 199
      Top = 1
      Width = 142
      Height = 187
      Align = alLeft
      Caption = ' Markers '
      TabOrder = 1
      object Button1: TButton
        AlignWithMargins = True
        Left = 5
        Top = 44
        Width = 132
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Marker default'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        AlignWithMargins = True
        Left = 5
        Top = 17
        Width = 132
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Clear Markers'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button4: TButton
        AlignWithMargins = True
        Left = 5
        Top = 71
        Width = 132
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Marker Ok'
        TabOrder = 2
        OnClick = Button4Click
      end
      object Button5: TButton
        AlignWithMargins = True
        Left = 5
        Top = 98
        Width = 132
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add Marker No'
        TabOrder = 3
        OnClick = Button5Click
      end
      object Button6: TButton
        AlignWithMargins = True
        Left = 5
        Top = 125
        Width = 132
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Marker Customized'
        TabOrder = 4
        OnClick = Button6Click
      end
      object ckAddMarkerOnClick: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 152
        Width = 132
        Height = 17
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Bottom = 2
        Align = alTop
        Caption = 'Add marker on click'
        TabOrder = 5
      end
    end
    object GroupBox3: TGroupBox
      Left = 625
      Top = 1
      Width = 341
      Height = 187
      Align = alClient
      Caption = ' Markers '
      TabOrder = 2
      object Panel2: TPanel
        Left = 2
        Top = 17
        Width = 337
        Height = 34
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
          Left = 162
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
        Top = 51
        Width = 337
        Height = 134
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
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Longitude'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Title'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IconURL'
            Width = 220
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
    object GroupBox4: TGroupBox
      Left = 976
      Top = 1
      Width = 333
      Height = 187
      Align = alRight
      Caption = ' Logs Events Markers '
      TabOrder = 3
      object mmLog: TMemo
        Left = 2
        Top = 80
        Width = 329
        Height = 105
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 2
        Top = 17
        Width = 329
        Height = 63
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          329
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
        object ckLogRightClick: TCheckBox
          Left = 4
          Top = 38
          Width = 98
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log RightClick'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object btnClearLog: TButton
          Left = 267
          Top = 1
          Width = 59
          Height = 26
          Cursor = crHandPoint
          Anchors = [akTop, akRight]
          Caption = 'Clear log'
          TabOrder = 3
          OnClick = btnClearLogClick
        end
        object ckLogMouseDown: TCheckBox
          Left = 107
          Top = 3
          Width = 138
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Down'
          TabOrder = 4
        end
        object ckLogMouseLeave: TCheckBox
          Left = 107
          Top = 21
          Width = 122
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Leave'
          TabOrder = 5
        end
        object ckLogMouseUp: TCheckBox
          Left = 107
          Top = 38
          Width = 102
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Up'
          TabOrder = 6
        end
        object ckLogMouseEnter: TCheckBox
          Left = 214
          Top = 38
          Width = 111
          Height = 17
          Cursor = crHandPoint
          Caption = 'Log Mouse Enter'
          TabOrder = 7
        end
      end
    end
    object PageControl1: TPageControl
      Left = 341
      Top = 1
      Width = 284
      Height = 187
      ActivePage = TabSheet2
      Align = alLeft
      TabOrder = 4
      object TabSheet2: TTabSheet
        Caption = 'Marker customized'
        ImageIndex = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 276
          Height = 157
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label8: TLabel
            Left = 6
            Top = 0
            Width = 43
            Height = 15
            Caption = 'Latitude'
          end
          object Label9: TLabel
            Left = 141
            Top = 0
            Width = 54
            Height = 15
            Caption = 'Longitude'
          end
          object Label10: TLabel
            Left = 6
            Top = 42
            Width = 23
            Height = 15
            Caption = 'Title'
          end
          object Label11: TLabel
            Left = 6
            Top = 85
            Width = 29
            Height = 15
            Caption = 'Color'
          end
          object Label12: TLabel
            Left = 194
            Top = 83
            Width = 20
            Height = 15
            Caption = 'Size'
          end
          object edtCustomizedLatitude: TEdit
            Left = 5
            Top = 15
            Width = 132
            Height = 23
            TabOrder = 0
            Text = '32.644482'
          end
          object edtCustomizedLongitude: TEdit
            Left = 140
            Top = 15
            Width = 127
            Height = 23
            TabOrder = 1
            Text = '-131.671452'
          end
          object btnAddMarkerCustomized: TButton
            Left = 6
            Top = 128
            Width = 262
            Height = 25
            Cursor = crHandPoint
            Caption = 'Add Marker Customized'
            TabOrder = 2
            OnClick = btnAddMarkerCustomizedClick
          end
          object edtCustomizedTitle: TEdit
            Left = 6
            Top = 59
            Width = 262
            Height = 23
            TabOrder = 3
            Text = 'Marker C4D Customized'
          end
          object cBoxCustomizedColor: TComboBox
            Left = 6
            Top = 101
            Width = 185
            Height = 23
            ItemIndex = 1
            TabOrder = 4
            Text = 'clRed'
            Items.Strings = (
              'clBlue'
              'clRed'
              'clBlack'
              'clPink'
              'clGreen')
          end
          object edtCustomizedSize: TEdit
            Left = 194
            Top = 100
            Width = 74
            Height = 23
            NumbersOnly = True
            TabOrder = 5
            Text = '40'
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Customized Icon '
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 276
          Height = 157
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 6
            Top = 0
            Width = 43
            Height = 15
            Caption = 'Latitude'
          end
          object Label4: TLabel
            Left = 141
            Top = 0
            Width = 54
            Height = 15
            Caption = 'Longitude'
          end
          object Label6: TLabel
            Left = 6
            Top = 42
            Width = 23
            Height = 15
            Caption = 'Title'
          end
          object Label7: TLabel
            Left = 6
            Top = 82
            Width = 47
            Height = 15
            Caption = 'Icon URL'
          end
          object edtCustomizedIconLatitude: TEdit
            Left = 6
            Top = 17
            Width = 132
            Height = 23
            TabOrder = 0
            Text = '56.819249'
          end
          object edtCustomizedIconLongitude: TEdit
            Left = 141
            Top = 17
            Width = 127
            Height = 23
            TabOrder = 1
            Text = '-32.198792'
          end
          object btnAddMarkerCustomizedIcon: TButton
            Left = 6
            Top = 128
            Width = 262
            Height = 25
            Cursor = crHandPoint
            Caption = 'Add Marker Icon C4D'
            TabOrder = 2
            OnClick = btnAddMarkerCustomizedIconClick
          end
          object edtCustomizedIconTitle: TEdit
            Left = 6
            Top = 58
            Width = 262
            Height = 23
            TabOrder = 3
            Text = 'Marker C4D Icon'
          end
          object edtCustomizedIconURL: TEdit
            Left = 6
            Top = 99
            Width = 262
            Height = 23
            TabOrder = 4
            Text = 'https://code4delphi.com.br/img/c4d-24x24.png'
          end
        end
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 195
    Width = 1310
    Height = 432
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnMapClick = TMSFNCMaps1MapClick
    OnMapMouseMove = TMSFNCMaps1MapMouseMove
    OnMarkerClick = TMSFNCMaps1MarkerClick
    OnMarkerRightClick = TMSFNCMaps1MarkerRightClick
    OnMarkerDblClick = TMSFNCMaps1MarkerDblClick
    OnMarkerMouseUp = TMSFNCMaps1MarkerMouseUp
    OnMarkerMouseDown = TMSFNCMaps1MarkerMouseDown
    OnMarkerMouseEnter = TMSFNCMaps1MarkerMouseEnter
    OnMarkerMouseLeave = TMSFNCMaps1MarkerMouseLeave
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
    Top = 627
    Width = 1310
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
      9A0000009619E0BD0100000018000000060000000000030000009A0002496401
      00490000000100055749445448020002003200084C6174697475646508000400
      00000000094C6F6E6769747564650800040000000000055469746C6501004900
      0000010005574944544802000200C8000749636F6E55524C0100490000000100
      05574944544802000200FA000756697369626C6502000300000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 745
    Top = 105
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
    object ClientDataSet1Title: TStringField
      DisplayWidth = 32
      FieldName = 'Title'
      Size = 200
    end
    object ClientDataSet1IconURL: TStringField
      DisplayWidth = 250
      FieldName = 'IconURL'
      Size = 250
    end
    object ClientDataSet1Visible: TBooleanField
      DisplayWidth = 5
      FieldName = 'Visible'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 829
    Top = 105
  end
  object PopupMenu1: TPopupMenu
    Left = 1016
    Top = 216
    object CopyLatitudeAndLongitude1: TMenuItem
      Caption = 'Copy latitude and longitude'
      OnClick = CopyLatitudeAndLongitude1Click
    end
    object UsertomarkerC4D1: TMenuItem
      Caption = 'User to marker customized'
      OnClick = UsertomarkerC4D1Click
    end
    object UsertomarkercustomizedIcon1: TMenuItem
      Caption = 'User to marker customized Icon'
      OnClick = UsertomarkercustomizedIcon1Click
    end
    object AddC4DMarkerHere1: TMenuItem
      Caption = 'Add C4D marker here'
      OnClick = AddC4DMarkerHere1Click
    end
  end
end
