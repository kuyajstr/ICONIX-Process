unit LoginPresenter;

interface

uses
  PresenterIntf,
  ViewIntf,
  LoginRestService;

type
  TLoginPresenter = class(TInterfacedObject, ILoginPresenter)
  private
    FView: ILoginView;
    FRestService: ILoginRestService;
  public
    constructor Create(AView: ILoginView; ARestService: ILoginRestService);
    procedure Login;
  end;

implementation

uses
  AuthService,
  Vcl.Dialogs;

{ TLoginController }

constructor TLoginPresenter.Create(AView: ILoginView;
  ARestService: ILoginRestService);
begin
  inherited Create;
  FRestService := ARestService;
  FView := AView;
  FView.SetPresenter(Self);
end;

procedure TLoginPresenter.Login;
begin
  var Result := FRestService.Login(FView.GetUsername, FView.GetPassword);
  if Result then
    FView.Close;
end;

end.
