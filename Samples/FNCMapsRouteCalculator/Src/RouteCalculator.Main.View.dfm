object RouteCalculatorMainView: TRouteCalculatorMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - RouteCalculator'
  ClientHeight = 619
  ClientWidth = 1291
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
    Width = 1291
    Height = 263
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 803
      Top = 0
      Width = 8
      Height = 263
      Beveled = True
      ExplicitLeft = 826
      ExplicitTop = 16
    end
    object GroupBox3: TGroupBox
      Left = 179
      Top = 0
      Width = 624
      Height = 263
      Align = alLeft
      Caption = ' Config '
      TabOrder = 0
      ExplicitLeft = 181
      ExplicitTop = -6
      DesignSize = (
        624
        263)
      object Label3: TLabel
        Left = 6
        Top = 21
        Width = 42
        Height = 15
        Caption = 'Address'
      end
      object Label6: TLabel
        Left = 8
        Top = 128
        Width = 40
        Height = 15
        Caption = 'Actions'
      end
      object edtAddress: TEdit
        Left = 6
        Top = 38
        Width = 612
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'P'#227'o de a'#231'ucar Rio de Janeiro'
      end
      object btClear: TButton
        Left = 8
        Top = 147
        Width = 75
        Height = 25
        Caption = 'Clear'
        TabOrder = 1
        OnClick = btClearClick
      end
      object btDelete: TButton
        Left = 89
        Top = 147
        Width = 75
        Height = 25
        Caption = 'Delete'
        TabOrder = 2
        OnClick = btDeleteClick
      end
      object btUndo: TButton
        Left = 170
        Top = 147
        Width = 75
        Height = 25
        Caption = 'Undo'
        TabOrder = 3
        OnClick = btUndoClick
      end
      object btRedo: TButton
        Left = 251
        Top = 147
        Width = 75
        Height = 25
        Caption = 'Redo'
        TabOrder = 4
        OnClick = btRedoClick
      end
      object btExport: TButton
        Left = 332
        Top = 147
        Width = 75
        Height = 25
        Caption = 'Export'
        TabOrder = 5
        OnClick = btExportClick
      end
      object btImport: TButton
        Left = 413
        Top = 147
        Width = 75
        Height = 25
        Caption = 'Import'
        TabOrder = 6
        OnClick = btImportClick
      end
      object ckHistoryEnabled: TCheckBox
        Left = 16
        Top = 80
        Width = 112
        Height = 17
        Caption = 'History Enabled'
        Checked = True
        State = cbChecked
        TabOrder = 7
        OnClick = ckHistoryEnabledClick
      end
      object ckIncludeAlternativeRoutes: TCheckBox
        Left = 136
        Top = 80
        Width = 165
        Height = 17
        Caption = 'Include Alternative Routes'
        TabOrder = 8
        OnClick = ckHistoryEnabledClick
      end
      object ckAvoidTolls: TCheckBox
        Left = 311
        Top = 80
        Width = 85
        Height = 17
        Caption = 'Avoid Tolls'
        TabOrder = 9
        OnClick = ckHistoryEnabledClick
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 179
      Height = 263
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 1
      ExplicitTop = -5
      object Label5: TLabel
        Left = 9
        Top = 60
        Width = 70
        Height = 15
        Caption = 'Map API Key:'
      end
      object Label2: TLabel
        Left = 9
        Top = 19
        Width = 64
        Height = 15
        Caption = 'Map Service'
      end
      object Shape1: TShape
        Left = 7
        Top = 114
        Width = 169
        Height = 1
        Pen.Color = clGray
      end
      object Label1: TLabel
        Left = 9
        Top = 167
        Width = 131
        Height = 15
        Caption = 'Route Calculator API Key'
      end
      object Label4: TLabel
        Left = 9
        Top = 125
        Width = 128
        Height = 15
        Caption = 'Route Calculator Service'
      end
      object Label7: TLabel
        Left = 9
        Top = 215
        Width = 65
        Height = 15
        Caption = 'Travel Mode'
      end
      object edtAPIKeyMap: TEdit
        Left = 9
        Top = 79
        Width = 150
        Height = 23
        PasswordChar = '*'
        TabOrder = 0
        Text = 'AIzaSyB4M57N8jb8e_UL02psdP9_szUXCxmp1_w'
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceMap: TComboBox
        Left = 8
        Top = 35
        Width = 152
        Height = 23
        Style = csDropDownList
        DropDownCount = 15
        TabOrder = 1
        OnChange = cBoxServiceMapChange
      end
      object edtAPIKeyRoute: TEdit
        Left = 9
        Top = 186
        Width = 150
        Height = 23
        PasswordChar = '*'
        TabOrder = 2
        Text = 'AIzaSyB4M57N8jb8e_UL02psdP9_szUXCxmp1_w'
        OnExit = edtAPIKeyMapExit
      end
      object cBoxServiceRoute: TComboBox
        Left = 9
        Top = 140
        Width = 152
        Height = 23
        Style = csDropDownList
        DropDownCount = 15
        TabOrder = 3
        OnChange = cBoxServiceMapChange
      end
      object cBoxTravelMode: TComboBox
        Left = 9
        Top = 232
        Width = 152
        Height = 23
        Style = csDropDownList
        DropDownCount = 15
        TabOrder = 4
        OnChange = cBoxServiceMapChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 811
      Top = 0
      Width = 480
      Height = 263
      Align = alClient
      Caption = ' Logs '
      TabOrder = 2
      ExplicitLeft = 801
      ExplicitWidth = 490
      object Panel1: TPanel
        Left = 2
        Top = 17
        Width = 476
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 486
        object ckGetReverseGeocodingByClickingMap: TCheckBox
          Left = 4
          Top = 4
          Width = 277
          Height = 17
          Caption = 'GetReverseGeocoding by clicking on the map'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
      end
      object mmLog: TMemo
        Left = 2
        Top = 48
        Width = 476
        Height = 213
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 486
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 600
    Width = 1291
    Height = 19
    Panels = <
      item
        Text = 
          'TMSFNCGeocoding: Geocodifica'#231#227'o de um endere'#231'o ou a geocodifica'#231 +
          #227'o reversa de uma coordenada utilizando um servi'#231'o de API REST'
        Width = 1000
      end>
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 263
    Width = 1291
    Height = 337
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
    OnRouteCalculatorBeforeDeletePolyline = TMSFNCMaps1RouteCalculatorBeforeDeletePolyline
    OnRouteCalculatorBeforeDeleteMarker = TMSFNCMaps1RouteCalculatorBeforeDeleteMarker
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
    Options.DefaultZoomLevel = 12.000000000000000000
  end
  object TMSFNCRouteCalculator1: TTMSFNCRouteCalculator
    Left = 704
    Top = 99
    Width = 26
    Height = 26
    Visible = True
    OnGetGeocoding = TMSFNCRouteCalculator1GetGeocoding
    Routes = <>
  end
  object OpenDialog1: TOpenDialog
    Left = 592
    Top = 203
  end
  object SaveDialog1: TSaveDialog
    Left = 672
    Top = 203
  end
end
