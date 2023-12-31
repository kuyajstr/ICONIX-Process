unit AuthService;

interface

uses
  Classes;

type
  TAuthService = class
  private 
    FToken: string;
    class var FInstance: TAuthService;
    class var FLock : TObject;
    class function NewInstance: TObject; override;
  public
    class function GetInstance: TAuthService;
    class procedure ReleaseInstance;
    procedure SetToken(const AToken: string);
    function GetToken: string;
  end;

implementation

{ TAuthService }

class function TAuthService.GetInstance: TAuthService;
begin
  if FInstance = nil then
  begin
    FLock := TObject.Create;
    TMonitor.Enter(FLock);
    try
      if FInstance = nil then
        FInstance := TAuthService.Create;
    finally
      TMonitor.Exit(FLock);
    end;
  end;

  Result := FInstance;
end;

function TAuthService.GetToken: string;
begin
  Result := FToken;
end;

class function TAuthService.NewInstance: TObject;
begin
  if FInstance = nil then
    FInstance := inherited NewInstance as TAuthService;

  Result := FInstance;
end;

class procedure TAuthService.ReleaseInstance;
begin
  if FInstance <> nil then
  begin
    TMonitor.Enter(FLock);
    try
      if FInstance <> nil then
      begin
        FInstance.Free;
        FInstance := nil;
      end;
    finally
      TMonitor.Exit(FLock);
    end;
  end;
end;

procedure TAuthService.SetToken(const AToken: string);
begin
  FToken := AToken;
end;

end.
