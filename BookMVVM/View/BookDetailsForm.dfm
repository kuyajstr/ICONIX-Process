object BookDetailsFrm: TBookDetailsFrm
  Left = 0
  Top = 0
  Caption = 'Book Details'
  ClientHeight = 386
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblTitle: TLabel
    Left = 8
    Top = 16
    Width = 22
    Height = 15
    Caption = 'Title'
  end
  object lblSynopsis: TLabel
    Left = 8
    Top = 80
    Width = 46
    Height = 15
    Caption = 'Synopsis'
  end
  object btnWriteReview: TButton
    Left = 280
    Top = 344
    Width = 105
    Height = 25
    Caption = 'Write Review'
    TabOrder = 0
  end
  object edtTitle: TEdit
    Left = 18
    Top = 37
    Width = 369
    Height = 23
    TabOrder = 1
  end
  object memSynopsis: TMemo
    Left = 16
    Top = 101
    Width = 369
    Height = 220
    Lines.Strings = (
      'memSynopsis')
    ReadOnly = True
    TabOrder = 2
  end
  object ViewModelBindingScope: TBindScope
    ScopeMappings = <>
    Left = 208
    Top = 16
  end
  object BindingList: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 328
    Top = 16
    object BookDetailTitleBinding: TBindExpression
      Category = 'Binding Expressions'
      ControlComponent = edtTitle
      SourceComponent = ViewModelBindingScope
      SourceExpression = 'Book.Title'
      ControlExpression = 'Text'
      NotifyOutputs = True
      Direction = dirSourceToControl
    end
    object BookDetailSynopsisBinding: TBindExpression
      Category = 'Binding Expressions'
      ControlComponent = memSynopsis
      SourceComponent = ViewModelBindingScope
      SourceExpression = 'Book.Synopsis'
      ControlExpression = 'Text'
      NotifyOutputs = True
      Direction = dirBidirectional
    end
  end
end
