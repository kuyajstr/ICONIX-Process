unit BookDetailsPresenter;

interface

uses
  PresenterIntf,
  ViewIntf,
  Book,
  MVCFramework.RESTClient,
  BookDetailsView;

type
  TBookDetailsPresenter = class(TinterfacedObject, IBookDetailsPresenter)
  private
    FBook: TBook;
    FView: IBookDetailsView;
    FRestClient: IMVCRestClient;
  public
    constructor Create(AView: IBookDetailsView; ABook: TBook);
    procedure ComposeReview;
    procedure DisplayView;
    function IsUserAuthorized: Boolean;
  end;

implementation

uses
  WriteReviewPresenter,
  WriteReviewView,
  AuthService,
  SysUtils,
  LoginPresenter,
  LoginView,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Controls;

{ TBookDetailsController }

procedure TBookDetailsPresenter.ComposeReview;
begin
  if not IsUserAuthorized then
    Exit;

  var WriteReviewView := TWriteReviewForm.Create(Application);
  var WriteReviewPresenter := TWriteReviewPresenter.Create(WriteReviewView, FBook);
  WriteReviewPresenter.DisplayView;
end;

constructor TBookDetailsPresenter.Create(AView: IBookDetailsView; ABook: TBook);
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FRestClient.SetBearerAuthorization(TAuthService.GetInstance.GetToken);
  FBook := ABook;
  FView := AView;
  FView.SetPresenter(Self);
end;

procedure TBookDetailsPresenter.DisplayView;
begin
  FView.SetTitle(FBook.Title);
  FView.SetSynopsis(FBook.Synopsis);
  FView.Show;
end;

function TBookDetailsPresenter.IsUserAuthorized: Boolean;
begin
  FRestClient.SetBearerAuthorization(TAuthService.GetInstance.GetToken);

  Result := True;

  var CheckUserRequest := FRestClient.Post('/api/customer_reviews', '{}');
  // Check if ReasonString is Unauthorized
  if CheckUserRequest.StatusCode = 403 then
  begin
    Result := False;
    if MessageDlg('Please Login first, would you like to proceed?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      var LoginView := TLoginForm.Create(Application);
      var LoginPresenter := TLoginPresenter.Create(LoginView);
      LoginView.Show;
    end;
  end;
end;

end.