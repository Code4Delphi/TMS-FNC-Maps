object ElementContainersMainView: TElementContainersMainView
  Left = 0
  Top = 0
  Caption = 'TMS FNC Maps - ElementContainers'
  ClientHeight = 663
  ClientWidth = 1332
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
    Top = 121
    Width = 1332
    Height = 10
    Cursor = crVSplit
    Align = alTop
    Beveled = True
    ExplicitLeft = -407
    ExplicitTop = 241
    ExplicitWidth = 1569
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1332
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 553
      Height = 121
      Margins.Bottom = 2
      Align = alLeft
      Caption = ' Config basic '
      TabOrder = 0
      DesignSize = (
        553
        121)
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
        Width = 540
        Height = 23
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
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
        Width = 540
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 1
        OnExit = edtAPIKeyMapExit
      end
    end
    object GroupBox3: TGroupBox
      Left = 553
      Top = 0
      Width = 142
      Height = 121
      Align = alLeft
      Caption = ' Markers '
      TabOrder = 1
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
        TabOrder = 0
        OnClick = Button2Click
      end
    end
    object ckElementContainerVisibility: TCheckBox
      Left = 701
      Top = 21
      Width = 188
      Height = 17
      Cursor = crHandPoint
      Caption = 'ElementContainer Visibility'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = ckElementContainerVisibilityClick
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 131
    Width = 1332
    Height = 513
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    OnZoomChanged = TMSFNCMaps1ZoomChanged
    OnGetZoomLevel = TMSFNCMaps1GetZoomLevel
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    ElementContainers = <
      item
        HTML.Strings = (
          
            '<button id="btnMyButton1"class="btn btn-primary">My button 1</bu' +
            'tton> <br>'
          
            '<button id="btnMyButton2" class="btn btn-info">My button 2</butt' +
            'on><br>'
          ''
          
            'Zoom Level <span id="customZoom1" class="text-primary">12</span>' +
            '<br>  '
          
            '<input type="range" min="0" value="12" max="18" id="customRange1' +
            '" class="form-control-range">')
        Actions = <
          item
            EventReturnValue = rvInnerHTML
            HTMLElementID = 'btnMyButton1'
            Name = 'Action0'
            OnExecute = TMSFNCMaps1ElementContainers0Actions0Execute
          end
          item
            EventReturnValue = rvInnerHTML
            HTMLElementID = 'btnMyButton2'
            Name = 'Action1'
            OnExecute = TMSFNCMaps1ElementContainers0Actions1Execute
          end
          item
            Event = heCustom
            EventReturnValue = rvValue
            HTMLElementID = 'customRange1'
            Name = 'Action2'
            OnExecute = TMSFNCMaps1ElementContainers0Actions2Execute
          end>
        Coordinate.Longitude = -74.044501999999990000
        Coordinate.Latitude = 40.689247000000000000
        Position = poTopRight
        HTMLElementID = 'ElementContainer0'
        HTMLElementClassName = 'card'
        UseDefaultStyle = False
        Margins.Left = 10.000000000000000000
        Margins.Top = 10.000000000000000000
        Margins.Right = 10.000000000000000000
        Margins.Bottom = 10.000000000000000000
      end>
    Labels = <>
    HeadLinks = <
      item
        URL = 
          'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.mi' +
          'n.css'
        Rel = 'stylesheet'
        Defer = False
        Async = False
        Kind = mlkLink
      end>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.DefaultZoomLevel = 1.000000000000000000
    Service = msOpenLayers
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 644
    Width = 1332
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
end
