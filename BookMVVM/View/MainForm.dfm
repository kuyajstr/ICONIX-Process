object MainFrm: TMainFrm
  Left = 0
  Top = 0
  Caption = 'MainPage'
  ClientHeight = 431
  ClientWidth = 328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblHeader: TLabel
    Left = 8
    Top = 16
    Width = 183
    Height = 30
    Alignment = taCenter
    Caption = 'Internet Bookstore'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lblBookList: TLabel
    Left = 8
    Top = 128
    Width = 48
    Height = 15
    Caption = 'Book List'
  end
  object edtId: TLabeledEdit
    Left = 8
    Top = 80
    Width = 33
    Height = 23
    EditLabel.Width = 11
    EditLabel.Height = 15
    EditLabel.Caption = 'ID'
    TabOrder = 0
    Text = ''
  end
  object edtTItle: TLabeledEdit
    Left = 57
    Top = 80
    Width = 256
    Height = 23
    EditLabel.Width = 22
    EditLabel.Height = 15
    EditLabel.Caption = 'Title'
    TabOrder = 1
    Text = ''
  end
  object ListView1: TListView
    Left = 8
    Top = 149
    Width = 305
    Height = 212
    Columns = <>
    TabOrder = 2
  end
  object btnViewBook: TButton
    Left = 238
    Top = 387
    Width = 75
    Height = 25
    Caption = 'View'
    TabOrder = 3
    OnClick = btnViewBookClick
  end
  object BindlingList: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 160
    Top = 8
    object BookIdBinding: TBindExpression
      Category = 'Binding Expressions'
      ControlComponent = edtId
      SourceComponent = ViewModelBindScope
      SourceExpression = 'SelectedBook.Id'
      ControlExpression = 'Text'
      NotifyOutputs = True
      Direction = dirBidirectional
    end
    object BookTitleBinding: TBindExpression
      Category = 'Binding Expressions'
      ControlComponent = edtTItle
      SourceComponent = ViewModelBindScope
      SourceExpression = 'SelectedBook.Title'
      ControlExpression = 'Text'
      NotifyOutputs = True
      Direction = dirBidirectional
    end
  end
  object ViewModelBindScope: TBindScope
    ScopeMappings = <>
    Left = 56
    Top = 8
  end
end
