unit ViewIntf;

interface

uses
  PresenterIntf;

type
  IView = interface
    ['{24CA421D-C6BA-4DFD-AE63-127ABFF1EC8D}']
    procedure SetPresenter(AController: IPresenter);
  end;

implementation

end.
