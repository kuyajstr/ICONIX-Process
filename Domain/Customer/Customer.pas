unit Customer;

interface

uses
  MVCFramework.ActiveRecord,
  CustomerContextIntf;

type

  TCustomer = class
  private
    FId: Integer;
    FFirstName: string;
    FLastName: string;
    FEmail: string;
  public
    constructor Create(AId: Integer; AFirstName, ALastName,
      AEmail: string); overload;
    constructor Create(ACustomer: ICustomerContext); overload;

    property Id: Integer read FId write FId;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Email: string read FEmail write FEmail;
  end;

implementation

uses
  SysUtils;

{ TCustomer }

constructor TCustomer.Create(ACustomer: ICustomerContext);
begin
  if not Assigned(ACustomer) then
    raise EArgumentNilException.Create('ACustomer');

  inherited Create;

  FId := ACustomer.Id;
  FFirstName := ACustomer.FirstName;
  FLastName := ACustomer.LastName;
  FEmail := ACustomer.Email;
end;

constructor TCustomer.Create(AId: Integer;
  AFirstName, ALastName, AEmail: string);
begin
  inherited Create;

  FId := AId;
  FFirstName := AFirstName;
  FLastName := ALastName;
  FEmail := AEmail;
end;

end.
