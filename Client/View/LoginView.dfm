object LoginForm: TLoginForm
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Login'
  ClientHeight = 141
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object PasswordLabel: TLabel
    Left = 41
    Top = 60
    Width = 53
    Height = 15
    Alignment = taRightJustify
    Caption = 'Password:'
  end
  object UsernameLabel: TLabel
    Left = 38
    Top = 25
    Width = 56
    Height = 15
    Alignment = taRightJustify
    Caption = 'Username:'
  end
  object UsernameEdit: TEdit
    Left = 100
    Top = 22
    Width = 150
    Height = 23
    TabOrder = 0
  end
  object PasswordEdit: TEdit
    Left = 100
    Top = 57
    Width = 150
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
  end
  object LoginButton: TButton
    Left = 106
    Top = 99
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 2
    OnClick = LoginButtonClick
  end
end
