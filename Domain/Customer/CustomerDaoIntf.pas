unit CustomerDaoIntf;

interface
uses
  Customer,
  DAOIntf,
  Generics.Collections;

type
  ICustomerDao = interface(IDAO<TCustomer>)
    procedure Insert(var Obj: TCustomer);
    procedure Select(const AId: Integer; var Obj: TCustomer);
    procedure Update(var Obj: TCustomer);
    procedure Delete(const AId: Integer);
    procedure SelectAll(var AList: TObjectList<TCustomer>);
    procedure SelectByFirstName(const AFirstName: string;
      var ACustomer: TCustomer);
  end;

implementation

end.
