object AITipsPlacesMainView: TAITipsPlacesMainView
  Left = 0
  Top = 0
  Caption = 
    'AI TTS and STT demo integrated with LLM function calling and dir' +
    'ections'
  ClientHeight = 742
  ClientWidth = 1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object TMSFNCMaps1: TTMSFNCMaps
    Left = 0
    Top = 337
    Width = 1072
    Height = 405
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
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
    ExplicitTop = 377
    ExplicitHeight = 365
  end
  object pnTop: TPanel
    Left = 0
    Top = 0
    Width = 1072
    Height = 265
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object gBoxTanscription: TGroupBox
      Left = 2
      Top = 140
      Width = 1068
      Height = 61
      Align = alClient
      Caption = ' Audio transcription  '
      Padding.Left = 1
      Padding.Right = 1
      Padding.Bottom = 1
      TabOrder = 0
      ExplicitTop = 137
      ExplicitHeight = 144
      object mmTanscription: TMemo
        Left = 3
        Top = 15
        Width = 1062
        Height = 43
        Align = alClient
        BorderStyle = bsNone
        Lines.Strings = (
          '')
        TabOrder = 0
        ExplicitLeft = 4
        ExplicitTop = 14
        ExplicitHeight = 81
      end
    end
    object gBoxResponse: TGroupBox
      Left = 2
      Top = 201
      Width = 1068
      Height = 62
      Align = alBottom
      Caption = ' Response '
      Padding.Left = 1
      Padding.Right = 1
      Padding.Bottom = 1
      TabOrder = 1
      object mmResponse: TMemo
        Left = 3
        Top = 15
        Width = 1062
        Height = 44
        Align = alClient
        BorderStyle = bsNone
        ScrollBars = ssVertical
        TabOrder = 0
        ExplicitHeight = 70
      end
    end
    object Panel1: TPanel
      Left = 2
      Top = 105
      Width = 1068
      Height = 35
      Align = alTop
      TabOrder = 2
      ExplicitLeft = -17
      ExplicitTop = 243
      object btnExecute: TBitBtn
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 102
        Height = 27
        Align = alLeft
        Caption = 'Execute'
        TabOrder = 0
        OnClick = btnExecuteClick
      end
      object ProgressBar1: TProgressBar
        AlignWithMargins = True
        Left = 113
        Top = 9
        Width = 200
        Height = 17
        Margins.Left = 4
        Margins.Top = 8
        Margins.Right = 4
        Margins.Bottom = 8
        Align = alLeft
        Smooth = True
        Style = pbstMarquee
        SmoothReverse = True
        State = pbsPaused
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 1068
      Height = 103
      Align = alTop
      Caption = ' Configs AI '
      TabOrder = 3
      DesignSize = (
        1068
        103)
      object Label2: TLabel
        Left = 210
        Top = 15
        Width = 52
        Height = 13
        Caption = 'AI API Key'
      end
      object Label4: TLabel
        Left = 8
        Top = 15
        Width = 48
        Height = 13
        Caption = 'AI service'
      end
      object edtAPIKeyAI: TEdit
        Left = 210
        Top = 32
        Width = 839
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        PasswordChar = '*'
        TabOrder = 0
      end
      object cBoxIAService: TComboBox
        Left = 7
        Top = 32
        Width = 201
        Height = 21
        Style = csDropDownList
        TabOrder = 1
      end
      object pnButtonsTop: TPanel
        Left = 2
        Top = 62
        Width = 1064
        Height = 39
        Align = alBottom
        BevelOuter = bvNone
        Padding.Left = 3
        TabOrder = 2
        ExplicitLeft = 1
        ExplicitTop = 59
        DesignSize = (
          1064
          39)
        object btnStartRecording: TButton
          AlignWithMargins = True
          Left = 157
          Top = 3
          Width = 121
          Height = 33
          Align = alLeft
          Caption = 'Start recording'
          TabOrder = 0
          OnClick = btnStartRecordingClick
          ExplicitLeft = 155
          ExplicitTop = 4
          ExplicitHeight = 31
        end
        object btnStopRecording: TButton
          AlignWithMargins = True
          Left = 284
          Top = 3
          Width = 121
          Height = 33
          Align = alLeft
          Caption = 'Stop recording'
          TabOrder = 1
          OnClick = btnStopRecordingClick
          ExplicitLeft = 282
          ExplicitTop = 4
          ExplicitHeight = 31
        end
        object cBoxLanguageAI: TComboBox
          AlignWithMargins = True
          Left = 6
          Top = 8
          Width = 145
          Height = 21
          Margins.Top = 8
          Align = alLeft
          DropDownCount = 15
          TabOrder = 2
          Text = 'Auto  '
          Items.Strings = (
            'Auto  '
            'Ingl'#234's - EN'
            'Portugu'#234's - PT'
            'Espanhol - ES'
            'Franc'#234's - FR'
            'Italiano - IT'
            'Japon'#234's - JA'
            #193'rabe - AR')
          ExplicitLeft = 4
        end
        object ckSpeakAudioRecording: TCheckBox
          Left = 914
          Top = 1
          Width = 150
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Speak audio recording'
          TabOrder = 3
          ExplicitLeft = 917
        end
        object ckSpeakResponse: TCheckBox
          Left = 914
          Top = 18
          Width = 150
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Speak response'
          Checked = True
          State = cbChecked
          TabOrder = 4
          ExplicitLeft = 917
        end
        object btnStopTalking: TButton
          AlignWithMargins = True
          Left = 411
          Top = 3
          Width = 90
          Height = 33
          Cursor = crHandPoint
          Align = alLeft
          Caption = 'Stop talking'
          TabOrder = 5
          OnClick = btnStopTalkingClick
          ExplicitLeft = 409
          ExplicitTop = 4
          ExplicitHeight = 31
        end
        object Button1: TButton
          Left = 662
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 6
          OnClick = Button1Click
        end
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 265
    Width = 1072
    Height = 72
    Align = alTop
    Caption = ' Maps configs '
    TabOrder = 2
    ExplicitTop = 354
    DesignSize = (
      1072
      72)
    object Label17: TLabel
      Left = 217
      Top = 19
      Width = 74
      Height = 13
      Caption = 'API Key Google'
    end
    object Label21: TLabel
      Left = 9
      Top = 20
      Width = 47
      Height = 13
      Caption = 'Language'
    end
    object edtAPIKeyMap: TEdit
      Left = 217
      Top = 36
      Width = 834
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      PasswordChar = '*'
      TabOrder = 0
      OnChange = edtAPIKeyMapChange
    end
    object cBoxLanguageMap: TComboBox
      Left = 9
      Top = 36
      Width = 205
      Height = 21
      ItemIndex = 0
      TabOrder = 1
      Text = 'en-US (English '#8211' United States)'
      OnChange = cBoxLanguageMapChange
      Items.Strings = (
        'en-US (English '#8211' United States)'
        'en-GB (English '#8211' Great Britain)'
        'fr-FR (French '#8211' France)'
        'nl-NL (Dutch '#8211' Netherlands)'
        'it-IT (Italian '#8211' Italy)'
        'pt-BR (Portuguese '#8211' Brazil)')
    end
  end
  object TMSFNCGooglePlaces1: TTMSFNCGooglePlaces
    Left = 655
    Top = 287
    Width = 26
    Height = 26
    Visible = True
    OnSearchByText = TMSFNCGooglePlaces1SearchByText
    PlacesRequests = <>
  end
  object Memo1: TMemo
    Left = 456
    Top = 344
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 5
  end
  object TMSMCPCloudAI1: TTMSMCPCloudAI
    Service = aiOpenAI
    Settings.GeminiModel = 'gemini-1.5-flash-latest'
    Settings.OpenAIModel = 'gpt-4o'
    Settings.OpenAISoundModel = 'gpt-4o-mini-tts'
    Settings.OpenAITranscribeModel = 'whisper-1'
    Settings.GrokModel = 'grok-beta'
    Settings.ClaudeModel = 'claude-3-5-sonnet-20241022'
    Settings.OllamaModel = 'llama3.2:latest'
    Settings.DeepSeekModel = 'deepseek-chat'
    Settings.PerplexityModel = 'llama-3.1-sonar-small-128k-online'
    Settings.OllamaHost = 'localhost'
    Settings.OllamaPath = '/api/chat'
    Settings.MistralModel = 'mistral-large-latest'
    Settings.MistralTranscribeModel = 'voxtral-mini-2507'
    Tools = <>
    OnExecuted = TMSMCPCloudAI1Executed
    OnSpeechAudio = TMSMCPCloudAI1SpeechAudio
    OnTranscribeAudio = TMSMCPCloudAI1TranscribeAudio
    Left = 456
    Top = 112
  end
end
