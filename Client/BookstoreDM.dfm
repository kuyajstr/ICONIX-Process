object dmolBookstore: TdmolBookstore
  Height = 480
  Width = 640
  object dsBooks: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftInteger
      end
      item
        Name = 'TItle'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Synopsis'
        DataType = ftString
        Size = 1000
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 16
    Top = 16
    object dsBooksId: TIntegerField
      FieldName = 'Id'
    end
    object dsBooksTItle: TStringField
      FieldName = 'TItle'
      Size = 100
    end
    object dsBooksSynopsis: TStringField
      DisplayWidth = 100
      FieldName = 'Synopsis'
      Size = 1000
    end
  end
  object dsrcBooks: TDataSource
    DataSet = dsBooks
    Left = 16
    Top = 80
  end
  object dsCustomer: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 112
    Top = 16
    object dsCustomerId: TIntegerField
      FieldName = 'Id'
    end
    object dsCustomerFirstName: TStringField
      FieldName = 'FirstName'
    end
    object dsCustomerLastName: TStringField
      FieldName = 'LastName'
    end
    object dsCustomerEmail: TStringField
      FieldName = 'Email'
    end
  end
  object dsrcCustomers: TDataSource
    DataSet = dsCustomer
    Left = 112
    Top = 80
  end
  object dsCustomerReview: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 224
    Top = 16
    object dsCustomerReviewId: TIntegerField
      FieldName = 'Id'
    end
    object dsCustomerReviewBookId: TIntegerField
      FieldName = 'BookId'
    end
    object dsCustomerReviewCustomerId: TIntegerField
      FieldName = 'CustomerId'
    end
    object dsCustomerReviewRating: TIntegerField
      FieldName = 'Rating'
    end
    object dsCustomerReviewReview: TStringField
      FieldName = 'Review'
    end
    object dsCustomerReviewIsPending: TBooleanField
      FieldName = 'IsPending'
    end
  end
  object dsrcCustomerReview: TDataSource
    DataSet = dsCustomerReview
    Left = 224
    Top = 80
  end
end
