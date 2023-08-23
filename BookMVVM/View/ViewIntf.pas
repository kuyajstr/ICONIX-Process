unit ViewIntf;

interface

uses
  ViewModelIntf;

type
  IView= interface
    ['{24CA421D-C6BA-4DFD-AE63-127ABFF1EC8D}']
    function GetController: IViewModel;
    procedure SetController(AController: IViewModel);

    property Controller: IViewModel read GetController write SetController;
  end;

implementation

end.
