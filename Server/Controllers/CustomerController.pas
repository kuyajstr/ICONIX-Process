unit CustomerController;

interface

uses
  MVCFramework,
  MVCFramework.Commons,
  MVCFramework.Serializer.Commons,

  Customer,
  CustomerService,
  CustomerServiceIntf,
  CustomerActiveRecord;

type
  TCustomerController = class(TMVCController)
  private
    FService: ICustomerService;
  public
    constructor Create(const AService: ICustomerService);

    [MVCPath]
    [MVCHTTPMethod([httpPOST])]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure CreateCustomer();

    [MVCPath]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetAllCustomer();

    [MVCPath('/($ID)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetCustomerByID(const ID: Integer);

    [MVCPath('/FirstName/($FirstName)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetCustomerByFirstName(const FirstName: string);

    [MVCPath('/($ID)')]
    [MVCHTTPMethod([httpDELETE])]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure DeleteCustomer(const ID: Integer);

    [MVCPath('/($ID)')]
    [MVCHTTPMethod([httpPUT])]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure UpdateCustomer(const ID: Integer);
  end;

implementation

uses
  SysUtils,
  Generics.Collections;

{ TCustomerController }

constructor TCustomerController.Create(const AService: ICustomerService);
begin
  if not assigned(AService) then
    raise EArgumentNilException.Create('Customer Service is nill');

  inherited Create;
  FService := AService;
end;

procedure TCustomerController.CreateCustomer;
begin
  var Customer := Context.Request.BodyAs<TCustomer>;
  try
    FService.CreateCustomer(Customer);
    Render(201, 'Customer Created');
  finally
    Customer.Free;
  end;
end;

procedure TCustomerController.DeleteCustomer(const ID: Integer);
begin
  FService.DeleteCustomer(ID);
  Render204NoContent(Format('Customer: %d deleted.', [ID]));
end;

procedure TCustomerController.GetAllCustomer;
var
  CustomerList: TObjectList<TCustomer>;
begin
  FService.GetAllCustomer(CustomerList);
  Render(ObjectDict().Add('data', CustomerList));
end;

procedure TCustomerController.GetCustomerByFirstName(const FirstName: string);
var
  Customer: TCustomer;
begin
  FService.GetCustomerByName(FirstName, Customer);
  Render(200, Customer);
end;

procedure TCustomerController.GetCustomerByID(const ID: Integer);
var
  Customer: TCustomer;
begin
  FService.GetCustomer(ID, Customer);
  Render(302, Customer);
end;

procedure TCustomerController.UpdateCustomer(const ID: Integer);
begin
  var Customer := Context.Request.BodyAs<TCustomer>;
  try
    Customer.ID := ID;
    FService.UpdateCustomer(Customer);
    Render(200, 'Book Updated');
  finally
    Customer.Free;
  end;
end;

end.
