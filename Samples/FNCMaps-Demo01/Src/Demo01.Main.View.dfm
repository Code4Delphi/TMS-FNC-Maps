object Demo01MainView: TDemo01MainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - Demo01'
  ClientHeight = 653
  ClientWidth = 1121
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1121
    Height = 193
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 505
      Top = 0
      Width = 301
      Height = 193
      Align = alRight
      Caption = ' Markers '
      TabOrder = 0
      object btnAddMarkerDefault: TButton
        Left = 2
        Top = 17
        Width = 297
        Height = 25
        Align = alTop
        Caption = 'Add marker Default'
        TabOrder = 0
        OnClick = btnAddMarkerDefaultClick
      end
      object btnAddMarkerC4D: TButton
        Left = 2
        Top = 168
        Width = 297
        Height = 23
        Align = alBottom
        Caption = 'Add marker C4D'
        TabOrder = 1
        OnClick = btnAddMarkerC4DClick
      end
      object btnAddMarkerCustomized: TButton
        Left = 2
        Top = 67
        Width = 297
        Height = 25
        Align = alTop
        Caption = 'Add marker Customized'
        TabOrder = 2
        OnClick = btnAddMarkerCustomizedClick
      end
      object Panel3: TPanel
        Left = 2
        Top = 125
        Width = 297
        Height = 43
        Align = alBottom
        TabOrder = 3
        object Label3: TLabel
          Left = 2
          Top = 0
          Width = 43
          Height = 15
          Caption = 'Latitude'
        end
        object Label4: TLabel
          Left = 149
          Top = 0
          Width = 54
          Height = 15
          Caption = 'Longitude'
        end
        object edtMarkerC4DLatitude: TEdit
          Left = 2
          Top = 15
          Width = 143
          Height = 23
          TabOrder = 0
          Text = '-25.562780'
        end
        object edtMarkerC4DLongitude: TEdit
          Left = 149
          Top = 15
          Width = 143
          Height = 23
          TabOrder = 1
          Text = '-52.629749'
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 42
        Width = 297
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object btnAddMarkerOk: TButton
          Left = 0
          Top = 0
          Width = 146
          Height = 25
          Align = alLeft
          Caption = 'Add marker OK'
          TabOrder = 0
          OnClick = btnAddMarkerOkClick
        end
        object btnAddMarkerNo: TButton
          Left = 146
          Top = 0
          Width = 151
          Height = 25
          Align = alClient
          Caption = 'Add marker NO'
          TabOrder = 1
          OnClick = btnAddMarkerNoClick
        end
      end
      object btnClearAllMarker: TButton
        Left = 2
        Top = 92
        Width = 297
        Height = 25
        Align = alTop
        Caption = 'Clear all marker'
        TabOrder = 5
        OnClick = btnClearAllMarkerClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 806
      Top = 0
      Width = 185
      Height = 193
      Align = alRight
      Caption = ' Shapes '
      TabOrder = 1
      object btnAddPolygon: TButton
        Left = 2
        Top = 17
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add Polygon (Bermuda triangle)'
        TabOrder = 0
        OnClick = btnAddPolygonClick
      end
      object btnAddCircle: TButton
        Left = 2
        Top = 42
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add Circle'
        TabOrder = 1
        OnClick = btnAddCircleClick
      end
      object btnAddRectangles: TButton
        Left = 2
        Top = 67
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Add Rectangles'
        TabOrder = 2
        OnClick = btnAddRectanglesClick
      end
      object btnClearAllShapes: TButton
        Left = 2
        Top = 92
        Width = 181
        Height = 25
        Align = alTop
        Caption = 'Clear all Shapes'
        TabOrder = 3
        OnClick = btnClearAllShapesClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 991
      Top = 0
      Width = 130
      Height = 193
      Align = alRight
      Caption = ' Labels '
      TabOrder = 2
      object btnAddLabel01: TButton
        Left = 2
        Top = 17
        Width = 126
        Height = 25
        Align = alTop
        Caption = 'Add Label'
        TabOrder = 0
        OnClick = btnAddLabel01Click
      end
      object btnAddLabel02: TButton
        Left = 2
        Top = 42
        Width = 126
        Height = 25
        Align = alTop
        Caption = 'Add Label'
        TabOrder = 1
        OnClick = btnAddLabel02Click
      end
      object btnClearAllLabels: TButton
        Left = 2
        Top = 67
        Width = 126
        Height = 25
        Align = alTop
        Caption = 'Clear all Labels'
        TabOrder = 2
        OnClick = btnClearAllLabelsClick
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 505
      Height = 193
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 37
        Height = 15
        Caption = 'Service'
      end
      object Label2: TLabel
        Left = 16
        Top = 62
        Width = 39
        Height = 15
        Caption = 'API key'
      end
      object cBoxService: TComboBox
        Left = 16
        Top = 33
        Width = 193
        Height = 23
        Style = csDropDownList
        DropDownCount = 15
        TabOrder = 0
        OnChange = cBoxServiceChange
      end
      object GroupBox5: TGroupBox
        Left = 0
        Top = 144
        Width = 505
        Height = 49
        Align = alBottom
        Caption = ' Zoom '
        TabOrder = 1
        object TrackBarZoom: TTrackBar
          Left = 64
          Top = 17
          Width = 377
          Height = 30
          Align = alClient
          Max = 30
          Min = 2
          Position = 2
          TabOrder = 0
          OnTracking = TrackBarZoomTracking
        end
        object btnZoomMin: TButton
          Left = 2
          Top = 17
          Width = 31
          Height = 30
          Align = alLeft
          Caption = '|<'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btnZoomMinClick
        end
        object btnZoomMenos: TButton
          Left = 33
          Top = 17
          Width = 31
          Height = 30
          Align = alLeft
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnZoomMenosClick
        end
        object btnZoomMax: TButton
          Left = 472
          Top = 17
          Width = 31
          Height = 30
          Align = alRight
          Caption = '>|'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnZoomMaxClick
        end
        object btnZoomMais: TButton
          Left = 441
          Top = 17
          Width = 31
          Height = 30
          Align = alRight
          Caption = '+'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = btnZoomMaisClick
        end
      end
      object cBoxLanguage: TComboBox
        Left = 16
        Top = 81
        Width = 193
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
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 193
    Width = 1121
    Height = 441
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    PopupMenu = PopupMenu1
    TabOrder = 1
    OnZoomChanged = TMSFNCMaps1ZoomChanged
    OnMapMouseMove = TMSFNCMaps1MapMouseMove
    OnGetZoomLevel = TMSFNCMaps1GetZoomLevel
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    ElementContainers = <>
    Labels = <
      item
        Text = ''
        Coordinate.Longitude = -74.044501999999990000
        Coordinate.Latitude = 40.689247000000000000
        Visible = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Roboto'
        Font.Style = []
      end>
    HeadLinks = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.DefaultZoomLevel = 2.000000000000000000
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 634
    Width = 1121
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
    Left = 1016
    Top = 216
    object CopyLatitudeAndLongitude1: TMenuItem
      Caption = 'Copy latitude and longitude'
      OnClick = CopyLatitudeAndLongitude1Click
    end
    object UsertomarkerC4D1: TMenuItem
      Caption = 'User to marker C4D'
      OnClick = UsertomarkerC4D1Click
    end
    object AddC4DMarkerHere1: TMenuItem
      Caption = 'Add C4D marker here'
      OnClick = AddC4DMarkerHere1Click
    end
  end
end
