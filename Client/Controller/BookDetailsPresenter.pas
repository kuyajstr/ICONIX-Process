unit BookDetailsPresenter;

interface

uses
  PresenterIntf,
  ViewIntf,
  Book,
  MVCFramework.RESTClient,
  BookDetailsView;

type
  TBookDetailsPresenter = class(TinterfacedObject, IPresenter)
  private
    FBook: TBook;
    FView: IView;
    FRestClient: IMVCRestClient;
  public
    constructor Create(AView: IView; ABook: TBook);
    procedure Display;
    procedure ValidateWriteReview;
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

constructor TBookDetailsPresenter.Create(AView: IView; ABook: TBook);
begin
  inherited Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FRestClient.SetBearerAuthorization(TAuthService.GetInstance.GetToken);
  FBook := ABook;
  FView := AView;
  FView.SetPresenter(Self);
end;

procedure TBookDetailsPresenter.Display;
begin
  var BookDetailsView := FView as TBookDetailsForm;

  BookDetailsView.TitleEdit.Text := FBook.Title;
  BookDetailsView.SynopsisMemo.Text := FBook.Synopsis;
  BookDetailsView.Show;
end;

procedure TBookDetailsPresenter.ValidateWriteReview;
begin
  FRestClient.SetBearerAuthorization(TAuthService.GetInstance.GetToken);

  var CheckUserRequest := FRestClient.Post('/api/customer_reviews', '{}');
  // Check if ReasonString is Unauthorized
  if CheckUserRequest.StatusCode <> 403 then
  begin
    var WriteReviewView := TWriteReviewForm.Create(Application);
    var WriteReviewPresenter := TWriteReviewPresenter.Create(WriteReviewView, FBook);
    WriteReviewPresenter.DisplayView;
  end
  else
  begin
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