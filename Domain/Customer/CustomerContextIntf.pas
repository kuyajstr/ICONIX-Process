unit CustomerContextIntf;

interface

type

  ICustomerContext = interface
    ['{674925F0-515E-46C9-85C7-28AE730BD18B}']
    function GetId: Integer;
    procedure SetId(const AId: Integer);
    function GetFirstName: string;
    procedure SetFirstName(const AFirstName: string);
    function GetLastName: string;
    procedure SetLastName(const ALastName: string);
    function GetEmail: string;
    procedure SetEmail(const AEmail: string);

    property Id: Integer read GetId write SetId;
    property FirstName: string read GetFirstName write SetFirstName;
    property LastName: string read GetLastName write SetLastName;
    property Email: string read GetEmail write SetEmail;
  end;

implementation

end.
