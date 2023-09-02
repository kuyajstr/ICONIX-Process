unit CustomerService;

interface

uses
  Customer, DAOIntf, CustomerServiceIntf, Generics.Collections;

type
  TCustomerService = class(TInterfacedObject, ICustomerService)
  private
    FCustomerDao: IDAO<TCustomer>;
  public
    constructor Create(const ACustomerDao: IDAO<TCustomer>);

    procedure CreateCustomer(var ACustomer: TCustomer);
    procedure GetCustomer(const AId: Integer; var ACustomer: TCustomer);
    procedure UpdateCustomer(var ACustomer: TCustomer);
    procedure DeleteCustomer(const AId: Integer);
    procedure GetAllCustomer(var AList: TObjectList<TCustomer>);
    procedure GetCustomerByName(const AFirstName: string;
      var ACustomer: TCustomer);
  end;

implementation

uses
  SysUtils,
  CustomerActiveRecordDao;

{ TCustomerService }

constructor TCustomerService.Create(const ACustomerDao: IDAO<TCustomer>);
begin
  if not Assigned(ACustomerDao) then
    raise EArgumentNilException.Create('Customer Data Access is nil');

  inherited Create;
  FCustomerDao := ACustomerDao;
end;

procedure TCustomerService.CreateCustomer(var ACustomer: TCustomer);
begin
  FCustomerDao.Insert(ACustomer);
end;

procedure TCustomerService.DeleteCustomer(const AId: Integer);
begin
  FCustomerDao.Delete(AId);
end;

procedure TCustomerService.GetAllCustomer(var AList: TObjectList<TCustomer>);
begin
  FCustomerDao.SelectAll(AList);
end;

procedure TCustomerService.GetCustomer(const AId: Integer;
  var ACustomer: TCustomer);
begin
  FCustomerDao.Select(AId, ACustomer);
end;

procedure TCustomerService.GetCustomerByName(const AFirstName: string;
  var ACustomer: TCustomer);
begin
  (FCustomerDao as TCustomerActiveRecordDao).SelectByFirstName(AFirstName,
    ACustomer)
end;

procedure TCustomerService.UpdateCustomer(var ACustomer: TCustomer);
begin
  FCustomerDao.Update(ACustomer);
end;

end.
