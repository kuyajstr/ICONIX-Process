program BookMVVM;

uses
  Vcl.Forms,
  MainView in 'View\MainView.pas' {MainForm},
  MainViewModel in 'ViewModel\MainViewModel.pas',
  AuthService in 'AuthService.pas',
  BookDetailsViewModel in 'ViewModel\BookDetailsViewModel.pas',
  BookDetailsView in 'View\BookDetailsView.pas' {BookDetailsForm};

{$R *.res}

var
  MainForm: TMainForm;
//  MainViewModel: TMainViewModel;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
