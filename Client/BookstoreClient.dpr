program BookstoreClient;

uses
  Vcl.Forms,
  MainView in 'View\MainView.pas' {MainForm},
  PresenterIntf in 'Presenter\PresenterIntf.pas',
  MainPresenter in 'Presenter\MainPresenter.pas',
  ViewIntf in 'View\ViewIntf.pas',
  AuthService in 'AuthService.pas',
  BookDetailsView in 'View\BookDetailsView.pas' {BookDetailsForm},
  BookDetailsPresenter in 'Presenter\BookDetailsPresenter.pas',
  LoginPresenter in 'Presenter\LoginPresenter.pas',
  LoginView in 'View\LoginView.pas' {LoginForm},
  WriteReviewView in 'View\WriteReviewView.pas' {WriteReviewForm},
  WriteReviewPresenter in 'Presenter\WriteReviewPresenter.pas';

{$R *.res}

var
  MainView: TMainForm;
  MainPresenter: TMainPresenter;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainView);
  MainPresenter := TMainPresenter.Create(MainView);
  Application.Run;
end.
