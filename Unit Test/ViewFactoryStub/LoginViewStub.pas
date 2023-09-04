unit LoginViewStub;

interface

uses
  ViewIntf,
  PresenterIntf;

type
  TLoginViewStub = class(TInterfacedObject, ILoginView)
  private
    FUsername, FPassword: string;
    FPresenter: ILoginPresenter;
  public
    procedure Show;
    procedure Close;
    function GetUsername: string;
    function GetPassword: string;
    procedure SetPresenter(APresenter: ILoginPresenter);
  end;

implementation

uses
  SysUtils;

{ TBasicCourseLoginView }

procedure TLoginViewStub.Close;
begin
  raise EInvalidOpException.Create('Close');
end;

function TLoginViewStub.GetPassword: string;
begin
  Result := FPassword;
end;

function TLoginViewStub.GetUsername: string;
begin
  Result := FUsername;
end;

procedure TLoginViewStub.SetPresenter(APresenter: ILoginPresenter);
begin
  FPresenter := APresenter;
end;

procedure TLoginViewStub.Show;
begin
  raise EInvalidOpException.Create('Show');
end;

end.
