unit BookDetailsServiceStub;

interface

uses
  BookDetailsRestService,
  Generics.Collections;

type
  TBookDetailsRestServiceStub = class(TInterfacedObject, IBookDetailsRestService)
  private
    FIsAuthorized: Boolean;
  public
    constructor Create(IsAuthorized: Boolean);
    procedure RefreshToken;
    function IsUserNotAuthorize: Boolean;
  end;

implementation

{ TBookDetailsRestServiceStub }

constructor TBookDetailsRestServiceStub.Create(IsAuthorized: Boolean);
begin
  FIsAuthorized := not IsAuthorized;
end;

function TBookDetailsRestServiceStub.IsUserNotAuthorize: Boolean;
begin
  Result := FIsAuthorized;
end;

procedure TBookDetailsRestServiceStub.RefreshToken;
begin

end;

end.
