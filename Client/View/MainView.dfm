object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Home Page'
  ClientHeight = 250
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object HeaderLabel: TLabel
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
  object BookDBGrid: TDBGrid
    Left = 8
    Top = 64
    Width = 257
    Height = 178
    DataSource = dmolBookstore.dsrcBooks
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = BookDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TItle'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsItalic]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Synopsis'
        Title.Alignment = taCenter
        Visible = False
      end>
  end
end
