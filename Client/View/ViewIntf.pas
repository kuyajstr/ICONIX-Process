unit ViewIntf;

interface

uses
  PresenterIntf, FireDAC.Comp.Client, Vcl.Controls;

type
  IView = interface
    ['{24CA421D-C6BA-4DFD-AE63-127ABFF1EC8D}']
    procedure SetPresenter(AController: IPresenter);
  end;

  IMainView = interface
    ['{E01B055C-B339-4195-B452-D1B4A1F05204}']
    function GetDataSourceBooks: TFDMemTable;
    function GetBookId: Integer;
    function GetBookTitle: string;
    function GetBookSynopsis: string;
    procedure SetPresenter(APresenter: IMainPresenter);
    procedure ShowMessageBox(const MessageStr: string);
  end;

  IBookDetailsView = interface
    ['{677DEE09-E41E-4439-82A0-194908E7C252}']
    procedure Show;
    procedure SetTitle(const Value: string);
    procedure SetSynopsis(const Value: string);
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
  end;

  ILoginView = interface
    ['{5255356B-2474-450E-9D37-DF6304473C7D}']
    procedure Show;
    procedure Close;
    function GetUsername: string;
    function GetPassword: string;
    procedure SetPresenter(APresenter: ILoginPresenter);
  end;

  IWriteReviewView = interface
    ['{A302F5AA-60F4-4320-BEB5-781737688AA5}']
    procedure Show;
    procedure Close;
    procedure SetTitle(const Value: string);
    function GetReview: string;
    function GetRating: Integer;
    procedure SetPresenter(APresenter: IWriteReviewPresenter);
    procedure ShowMessageBox(const MessageStr: string);
    function ShowConfirmationDialog(const MessageStr: string): Integer;
  end;

implementation

end.
