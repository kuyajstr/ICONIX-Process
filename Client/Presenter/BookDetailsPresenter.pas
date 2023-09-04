unit BookDetailsPresenter;

interface

uses
  PresenterIntf,
  ViewIntf,
  Book,
  BookDetailsView,
  BookDetailsRestService,
  ViewFactory;

type
  TBookDetailsPresenter = class(TinterfacedObject, IBookDetailsPresenter)
  private
    FBook: TBook;
    FView: IBookDetailsView;
    FViewFactory: IViewFactory;
    FRestService: IBookDetailsRestService;
  public
    constructor Create(AView: IBookDetailsView; ABook: TBook;
      ARestService: IBookDetailsRestService; AViewFactory: IViewFactory);
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
  LoginRestService,
  WriteReviewRestService;

{ TBookDetailsController }

procedure TBookDetailsPresenter.ComposeReview;
begin
  if not IsUserAuthorized then
    Exit;

  var WriteReviewView := FViewFactory.CreateWriteReviewView(FView as TForm);
  var WriteReviewRestService := TWriteReviewRestService.Create;
  var WriteReviewPresenter := TWriteReviewPresenter.Create(WriteReviewView,
    FBook, WriteReviewRestService);
  WriteReviewPresenter.DisplayView;
end;

constructor TBookDetailsPresenter.Create(AView: IBookDetailsView; ABook: TBook;
  ARestService: IBookDetailsRestService; AViewFactory: IViewFactory);
begin
  inherited Create;
  FRestService := ARestService;
  FViewFactory := AViewFactory;
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
  FRestService.RefreshToken;
  Result := True;
  var IsUserAuthorized := FRestService.IsUserAuthorize;
  if IsUserAuthorized then
  begin
    Result := False;
    if FView.ShowConfirmationDialog(
      'Please Login first, would you like to proceed?') = 6 then
    begin
      var LoginView := FViewFactory.CreateLoginView(FView as TForm);
      var LoginService := TLoginRestService.Create;
      var LoginPresenter := TLoginPresenter.Create(LoginView, LoginService);
      LoginView.Show;
    end;
  end;
end;


end.
