program BookstoreClient;

uses
  Vcl.Forms,
  MainView in 'View\MainView.pas' {MainForm},
  PresenterIntf in 'Presenter\PresenterIntf.pas',
  MainPresenter in 'Presenter\MainPresenter.pas',
  ViewIntf in 'View\ViewIntf.pas',
  AuthService in 'Utility\AuthService.pas',
  BookDetailsView in 'View\BookDetailsView.pas' {BookDetailsForm},
  BookDetailsPresenter in 'Presenter\BookDetailsPresenter.pas',
  LoginPresenter in 'Presenter\LoginPresenter.pas',
  LoginView in 'View\LoginView.pas' {LoginForm},
  WriteReviewView in 'View\WriteReviewView.pas' {WriteReviewForm},
  WriteReviewPresenter in 'Presenter\WriteReviewPresenter.pas',
  MainRestService in 'Utility\MainRestService.pas',
  BookDetailsRestService in 'Utility\BookDetailsRestService.pas',
  LoginRestService in 'Utility\LoginRestService.pas',
  WriteReviewRestService in 'Utility\WriteReviewRestService.pas',
  ViewFactory in 'Utility\ViewFactory.pas';

{$R *.res}

var
  MainView: TMainForm;
  MainPresenter: TMainPresenter;
  MainRestService: IMainRestService;
  ViewFactory: IViewFactory;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainView);
  MainRestService := TMainRestService.Create;
  ViewFactory := TViewFactory.Create;
  MainPresenter := TMainPresenter.Create(MainView, MainRestService, ViewFactory);
  Application.Run;
end.
