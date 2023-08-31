unit CustomerServiceIntf;

interface

uses
  Customer, DAOIntf, Generics.Collections;

type
  ICustomerService = interface
    ['{85F24D43-0C52-491B-8314-B6998C7743BB}']
    procedure CreateCustomer(var ACustomer: TCustomer);
    procedure GetCustomer(const AId: Integer; var ACustomer: TCustomer);
    procedure UpdateCustomer(var ACustomer: TCustomer);
    procedure DeleteCustomer(const AId: Integer);
    procedure GetAllCustomer(var AList: TObjectList<TCustomer>);
    procedure GetCustomerByName(const AFirstName: string;
      var ACustomer: TCustomer);
  end;

implementation

end.
