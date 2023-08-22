object MainPage: TMainPage
  Left = 0
  Top = 0
  Caption = 'MainPage'
  ClientHeight = 250
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lblHeader: TLabel
    Left = 8
    Top = 8
    Width = 183
    Height = 30
    Caption = 'Internet Bookstore'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object dbgBooks: TDBGrid
    Left = 8
    Top = 64
    Width = 513
    Height = 120
    DataSource = dmolBookstore.dsrcBooks
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TItle'
        Title.Alignment = taCenter
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Synopsis'
        Title.Alignment = taCenter
        Width = 280
        Visible = True
      end>
  end
  object btnLoadBooks: TButton
    Left = 424
    Top = 208
    Width = 97
    Height = 25
    Caption = 'Load Books'
    TabOrder = 1
    OnClick = btnLoadBooksClick
  end
  object btnClearBooks: TButton
    Left = 321
    Top = 208
    Width = 97
    Height = 25
    Caption = 'Clear Books'
    TabOrder = 2
    OnClick = btnClearBooksClick
  end
end
