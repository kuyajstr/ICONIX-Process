unit MainPresenterTest;

interface

uses
  DUnitX.TestFramework,
  ViewIntf,
  MainRestService;

type
  [TestFixture]
  TMainPresenterTest = class
  private
    FView: IMainView;
    FRestService: IMainRestService;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
  end;

implementation

uses
  MainPresenter;

procedure TMainPresenterTest.Setup;
begin


end;

procedure TMainPresenterTest.TearDown;
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TMainPresenterTest);

end.
