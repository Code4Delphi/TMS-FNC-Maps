object GeoTIFFMainView: TGeoTIFFMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - GeoTIFF'
  ClientHeight = 661
  ClientWidth = 1281
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
  object Splitter1: TSplitter
    Left = 0
    Top = 205
    Width = 1281
    Height = 10
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitTop = 235
    ExplicitWidth = 1313
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1281
    Height = 205
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 225
      Height = 205
      Align = alLeft
      Caption = ' Configs '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 61
        Width = 41
        Height = 15
        Caption = 'Opacity'
      end
      object ckShowBaseLayer: TCheckBox
        Left = 16
        Top = 30
        Width = 185
        Height = 17
        Caption = 'ShowBaseLayer (default layer)'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = ckShowBaseLayerClick
      end
      object TrackBar1: TTrackBar
        Left = 16
        Top = 78
        Width = 201
        Height = 45
        PageSize = 1
        Position = 9
        TabOrder = 1
        OnTracking = TrackBar1Tracking
      end
    end
    object Panel2: TPanel
      Left = 225
      Top = 0
      Width = 1056
      Height = 205
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 1056
        Height = 98
        Align = alTop
        Caption = ' GeoTIFF '
        TabOrder = 0
        object Label2: TLabel
          Left = 10
          Top = 45
          Width = 60
          Height = 15
          Caption = 'URL Geotiff'
        end
        object btnGeoTiff01: TButton
          Left = 195
          Top = 17
          Width = 179
          Height = 25
          Caption = 'Add GeoTiff 01'
          TabOrder = 0
          OnClick = btnGeoTiff01Click
        end
        object btnClearTileLayers: TButton
          Left = 10
          Top = 14
          Width = 179
          Height = 25
          Caption = 'Clear Tile Layers'
          TabOrder = 1
          OnClick = btnClearTileLayersClick
        end
        object btnAddUrl: TButton
          Left = 895
          Top = 61
          Width = 146
          Height = 25
          Caption = 'Add layer to map'
          TabOrder = 2
          OnClick = btnAddUrlClick
        end
        object btnGeoTiff02: TButton
          Left = 380
          Top = 17
          Width = 179
          Height = 25
          Caption = 'Add GeoTiff 02'
          TabOrder = 3
          OnClick = btnGeoTiff02Click
        end
        object edtUrl: TEdit
          Left = 10
          Top = 61
          Width = 879
          Height = 23
          TabOrder = 4
          Text = 
            'https://sentinel-cogs.s3.us-west-2.amazonaws.com/sentinel-s2-l2a' +
            '-cogs/23/K/LP/2026/1/S2B_23KLP_20260110_0_L2A/TCI.tif'
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 98
        Width = 1056
        Height = 107
        Align = alClient
        Caption = ' Get image links (sentinel-2) '
        TabOrder = 1
        object mmLog: TMemo
          Left = 2
          Top = 49
          Width = 887
          Height = 56
          Align = alClient
          TabOrder = 0
        end
        object Panel1: TPanel
          Left = 2
          Top = 17
          Width = 1052
          Height = 32
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label3: TLabel
            Left = 286
            Top = 6
            Width = 30
            Height = 15
            Alignment = taRightJustify
            Caption = 'Limit:'
          end
          object Label4: TLabel
            Left = 446
            Top = 6
            Width = 69
            Height = 15
            Hint = 'Cobertura de nuvem'
            Alignment = taRightJustify
            Caption = 'Cloud Cover:'
            ParentShowHint = False
            ShowHint = True
          end
          object Label5: TLabel
            Left = 665
            Top = 6
            Width = 56
            Height = 15
            Hint = 'Cobertura de nuvem'
            Alignment = taRightJustify
            Caption = 'RadiusKM:'
            ParentShowHint = False
            ShowHint = True
          end
          object ckGetLinksClickMap: TCheckBox
            Left = 7
            Top = 4
            Width = 271
            Height = 17
            Caption = 'Search for links by double-clicking on the map'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object edtLimit: TEdit
            Left = 319
            Top = 3
            Width = 121
            Height = 23
            NumbersOnly = True
            TabOrder = 1
            Text = '1'
          end
          object edtCloudCover: TEdit
            Left = 522
            Top = 3
            Width = 121
            Height = 23
            NumbersOnly = True
            TabOrder = 2
            Text = '10'
          end
          object edtRadiusKM: TEdit
            Left = 727
            Top = 3
            Width = 121
            Height = 23
            TabOrder = 3
            Text = '1'
          end
        end
        object Panel3: TPanel
          Left = 889
          Top = 49
          Width = 165
          Height = 56
          Align = alRight
          TabOrder = 2
          object addFisrtItemToMap: TButton
            Left = 5
            Top = 8
            Width = 154
            Height = 25
            Caption = 'Add first item to map'
            TabOrder = 0
            OnClick = addFisrtItemToMapClick
          end
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 642
    Width = 1281
    Height = 19
    Panels = <
      item
        Text = 
          'GeoTIFF '#233' um formato de imagem raster que armazena dados geogr'#225'f' +
          'icos (como proje'#231#227'o e coordenadas) no pr'#243'prio arquivo, sendo amp' +
          'lamente usado em GIS'
        Width = 1000
      end>
    ExplicitTop = 892
  end
  object TMSFNCOpenLayers1: TTMSFNCOpenLayers
    Left = 0
    Top = 215
    Width = 1281
    Height = 427
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
    OnMapDblClick = TMSFNCOpenLayers1MapDblClick
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.DefaultZoomLevel = 2.000000000000000000
    Options.ZoomOnDblClick = False
    Options.Version = 'v10.7.0'
    LocalFileAccess = True
    TileLayers = <>
    ElementContainers = <>
    HeadLinks = <>
    Clusters = <>
    HeatMaps = <>
    ExplicitHeight = 677
  end
end
