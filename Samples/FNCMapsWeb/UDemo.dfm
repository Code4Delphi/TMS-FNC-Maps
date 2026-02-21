object Form1: TForm1
  Width = 986
  Height = 866
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormContainer = 'appcontent'
  ParentFont = False
  OnCreate = WebFormCreate
  object WebPanel1: TWebPanel
    Left = 0
    Top = 0
    Width = 986
    Height = 145
    Align = alTop
    BorderColor = clSilver
    BorderStyle = bsSingle
    ExplicitTop = -6
    DesignSize = (
      986
      145)
    object Label5: TWebLabel
      Left = 352
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Map API Key:'
    end
    object Label6: TWebLabel
      Left = 19
      Top = 16
      Width = 62
      Height = 13
      Caption = 'Map Service:'
    end
    object Label11: TWebLabel
      Left = 736
      Top = 62
      Width = 226
      Height = 67
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 
        'Create Polygons, Polylines, Rectangles or Circles by clicking on' +
        ' one of the buttons. This will set a shape and a marker on the m' +
        'ap. When you click on the shape or the marker different popups w' +
        'ill show.'
      WordWrap = True
    end
    object MapAPIEdit: TWebEdit
      Left = 437
      Top = 13
      Width = 285
      Height = 21
    end
    object MapServiceCombo: TWebComboBox
      Left = 179
      Top = 13
      Width = 153
      Height = 21
      Text = 'OpenLayers'
      OnChange = MapServiceComboChange
      ItemIndex = 6
      Items.Strings = (
        'Google Maps'
        'Here Maps'
        'Bing Maps '
        'Azure Maps'
        'MapBox'
        'TomTom'
        'OpenLayers'
        'MapKit')
    end
    object SetCircle: TWebButton
      Left = 20
      Top = 104
      Width = 153
      Height = 25
      Caption = 'Largest Vulcano Eruption'
      OnClick = SetCircleClick
    end
    object SetPolygon: TWebButton
      Left = 179
      Top = 104
      Width = 153
      Height = 25
      Caption = 'Central Park'
      OnClick = SetPolygonClick
    end
    object SetRect: TWebButton
      Left = 19
      Top = 64
      Width = 153
      Height = 25
      Caption = 'Largest City Proper'
      OnClick = SetRectClick
    end
    object SetPolyLine: TWebButton
      Left = 179
      Top = 64
      Width = 153
      Height = 25
      Caption = 'Longest Straight Road'
      OnClick = SetPolyLineClick
    end
    object WebButton1: TWebButton
      Left = 569
      Top = 64
      Width = 153
      Height = 25
      Caption = 'Set API Key'
      ChildOrder = 9
      OnClick = WebButton1Click
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 145
    Width = 986
    Height = 721
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    OnMarkerClick = TMSFNCMaps1MarkerClick
    OnPolyElementClick = TMSFNCMaps1PolyElementClick
    OnMapInitialized = TMSFNCMaps1MapInitialized
    Polylines = <>
    Polygons = <>
    Circles = <>
    Rectangles = <>
    Markers = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.DefaultZoomLevel = 3
    Service = msOpenLayers
  end
end
