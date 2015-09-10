object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1058#1077#1089#1090#1080#1083#1082#1072' '#1089#1077#1090#1080
  ClientHeight = 264
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object actmmb1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 643
    Height = 23
    UseSystemFont = False
    ActionManager = actmgr1
    Caption = 'actmmb1'
    ColorMap.HighlightColor = 15660791
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 15660791
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Spacing = 0
  end
  object dbgrdh1: TDBGridEh
    Left = 0
    Top = 23
    Width = 643
    Height = 241
    Align = alClient
    DataGrouping.GroupLevels = <>
    DataSource = ds2
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = dbgrdh1TitleClick
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object actmgr1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = act1OpenFile
              end
              item
                Action = actGreate
              end
              item
                Action = actSaveAs
              end>
            Caption = '&'#1060#1072#1081#1083
          end
          item
            Action = act1
          end>
        ActionBar = actmmb1
      end>
    Left = 208
    StyleName = 'Platform Default'
    object act1OpenFile: TAction
      Category = '&'#1060#1072#1081#1083
      Caption = '&'#1054#1090#1082#1088#1099#1090#1100
      OnExecute = act1OpenFileExecute
    end
    object actGreate: TAction
      Category = '&'#1060#1072#1081#1083
      Caption = '&'#1057#1086#1079#1076#1072#1090#1100
      OnExecute = actGreateExecute
    end
    object actSaveAs: TAction
      Category = '&'#1060#1072#1081#1083
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082
      OnExecute = actSaveAsExecute
    end
    object act1: TAction
      Caption = #1053#1072#1095#1072#1090#1100
      OnExecute = act1Execute
    end
  end
  object ds1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
  end
  object ds2: TDataSource
    DataSet = ds1
    Left = 312
    Top = 56
  end
  object dlgOpen1: TOpenDialog
    Left = 600
    Top = 9
  end
  object dlgSave1: TSaveDialog
    Left = 600
    Top = 64
  end
  object idcmpclnt1: TIdIcmpClient
    Protocol = 1
    ProtocolIPv6 = 0
    IPVersion = Id_IPv4
    PacketSize = 32
    OnReply = idcmpclnt1Reply
    Left = 512
    Top = 40
  end
end
