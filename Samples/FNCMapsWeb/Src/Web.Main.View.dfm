object MainView: TMainView
  Left = 20
  Width = 1136
  Height = 676
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
    Width = 1136
    Height = 123
    Align = alTop
    TabOrder = 0
    object SetCircle: TWebButton
      Left = 740
      Top = 75
      Width = 153
      Height = 25
      Hint = 'Maior erup'#231#227'o vulc'#226'nica'
      Caption = 'Largest Vulcano Eruption'
      HeightPercent = 100.000000000000000000
      ShowHint = True
      WidthPercent = 100.000000000000000000
      OnClick = SetCircleClick
    end
    object SetPolygon: TWebButton
      Left = 899
      Top = 75
      Width = 153
      Height = 25
      Caption = 'Central Park'
      HeightPercent = 100.000000000000000000
      ShowHint = True
      WidthPercent = 100.000000000000000000
      OnClick = SetPolygonClick
    end
    object SetRect: TWebButton
      Left = 739
      Top = 35
      Width = 153
      Height = 25
      Hint = 'Maior cidade propriamente dita'
      Caption = 'Largest City Proper'
      HeightPercent = 100.000000000000000000
      ShowHint = True
      WidthPercent = 100.000000000000000000
      OnClick = SetRectClick
    end
    object SetPolyLine: TWebButton
      Left = 899
      Top = 35
      Width = 153
      Height = 25
      Hint = 'Estrada reta mais longa'
      Caption = 'Longest Straight Road'
      HeightPercent = 100.000000000000000000
      ShowHint = True
      WidthPercent = 100.000000000000000000
      OnClick = SetPolyLineClick
    end
    object WebGroupBox1: TWebGroupBox
      Left = 0
      Top = 0
      Width = 225
      Height = 123
      Align = alLeft
      BorderColor = clSilver
      Caption = ' Map config '
      ChildOrder = 12
      object Label5: TWebLabel
        Left = 11
        Top = 64
        Width = 65
        Height = 13
        Caption = 'Map API Key:'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object Label6: TWebLabel
        Left = 11
        Top = 16
        Width = 62
        Height = 13
        Caption = 'Map Service:'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object edtAPIKeyMap: TWebEdit
        Left = 11
        Top = 80
        Width = 200
        Height = 21
        ChildOrder = 2
        HeightPercent = 100.000000000000000000
        PasswordChar = '*'
        WidthPercent = 100.000000000000000000
        OnChange = cBoxServiceMapChange
      end
      object cBoxServiceMap: TWebComboBox
        Left = 11
        Top = 34
        Width = 200
        Height = 21
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnChange = cBoxServiceMapChange
        ItemIndex = -1
      end
    end
    object WebGroupBox2: TWebGroupBox
      Left = 225
      Top = 0
      Width = 225
      Height = 123
      Align = alLeft
      BorderColor = clSilver
      Caption = ' Route Calculator config '
      ChildOrder = 9
      object WebLabel1: TWebLabel
        Left = 11
        Top = 64
        Width = 125
        Height = 13
        Caption = 'Route Calculator API Key:'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object WebLabel2: TWebLabel
        Left = 11
        Top = 16
        Width = 122
        Height = 13
        Caption = 'Route Calculator Service:'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object edtAPIKeyRoute: TWebEdit
        Left = 11
        Top = 80
        Width = 200
        Height = 21
        ChildOrder = 10
        HeightPercent = 100.000000000000000000
        PasswordChar = '*'
        WidthPercent = 100.000000000000000000
        OnChange = cBoxServiceMapChange
      end
      object cBoxServiceRoute: TWebComboBox
        Left = 11
        Top = 34
        Width = 200
        Height = 21
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnChange = cBoxServiceMapChange
        ItemIndex = -1
      end
    end
    object WebGroupBox3: TWebGroupBox
      Left = 450
      Top = 0
      Width = 270
      Height = 123
      Align = alLeft
      BorderColor = clSilver
      Caption = ' Route Calculator '
      ChildOrder = 6
      object WebLabel3: TWebLabel
        Left = 11
        Top = 16
        Width = 39
        Height = 13
        Caption = 'Address'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
      end
      object edtAddress: TWebEdit
        Left = 11
        Top = 34
        Width = 245
        Height = 22
        ChildOrder = 1
        HeightPercent = 100.000000000000000000
        Text = 'Cristo Redentor'
        WidthPercent = 100.000000000000000000
      end
      object edtRouteCalculator: TWebButton
        Left = 11
        Top = 75
        Width = 246
        Height = 25
        Caption = 'Go'
        ChildOrder = 2
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = edtRouteCalculatorClick
      end
    end
  end
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 123
    Width = 1136
    Height = 553
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
    ElementContainers = <>
    Labels = <>
    HeadLinks = <>
    Options.DefaultLatitude = 40.689247000000000000
    Options.DefaultLongitude = -74.044501999999990000
    Options.DefaultZoomLevel = 3.000000000000000000
  end
  object TMSFNCRouteCalculator1: TTMSFNCRouteCalculator
    Left = 480
    Top = 272
    Width = 26
    Height = 26
    Visible = True
    OnGetGeocoding = TMSFNCRouteCalculator1GetGeocoding
    Routes = <>
  end
end
