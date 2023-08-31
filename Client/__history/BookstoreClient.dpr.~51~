program BookstoreClient;

uses
  Vcl.Forms,
  MainView in 'View\MainView.pas' {MainForm},
  BookstoreDM in 'BookstoreDM.pas' {dmolBookstore: TDataModule},
  PresenterIntf in 'Controller\PresenterIntf.pas',
  MainPresenter in 'Controller\MainPresenter.pas',
  ViewIntf in 'View\ViewIntf.pas',
  AuthService in 'AuthService.pas',
  BookDetailsView in 'View\BookDetailsView.pas' {BookDetailsForm},
  BookDetailsPresenter in 'Controller\BookDetailsPresenter.pas',
  LoginPresenter in 'Controller\LoginPresenter.pas',
  LoginView in 'View\LoginView.pas' {LoginForm},
  WriteReviewView in 'View\WriteReviewView.pas' {WriteReviewForm},
  WriteReviewPresenter in 'Controller\WriteReviewPresenter.pas';

{$R *.res}

var
  MainView: TMainForm;
  MainPresenter: TMainPresenter;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmolBookstore, dmolBookstore);
  Application.CreateForm(TMainForm, MainView);
  MainPresenter := TMainPresenter.Create(MainView);
  Application.Run;
end.
