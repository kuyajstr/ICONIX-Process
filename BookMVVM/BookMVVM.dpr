program BookMVVM;

uses
  Vcl.Forms,
  MainForm in 'View\MainForm.pas' {MainFrm},
  ViewIntf in 'View\ViewIntf.pas',
  ViewModelIntf in 'ViewModel\ViewModelIntf.pas',
  MainViewModel in 'ViewModel\MainViewModel.pas',
  AuthService in 'AuthService.pas',
  BookDetailsViewModel in 'ViewModel\BookDetailsViewModel.pas',
  BookDetailsForm in 'View\BookDetailsForm.pas' {BookDetailsFrm};

{$R *.res}

var
  MainForm: TMainFrm;
  MainViewModel: TMainViewModel;
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TMainFrm, MainForm);
  MainViewModel := TMainViewModel.Create;

  MainForm.SetViewModel(MainViewModel);

  Application.Run;
end.
