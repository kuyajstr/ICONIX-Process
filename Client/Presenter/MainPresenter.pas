unit MainPresenter;

interface

uses
  PresenterIntf,
  ViewIntf,
  Generics.Collections,
  Book,
  SysUtils,
  MainRestService,
  ViewFactory;

type
  TMainPresenter = class(TInterfacedObject, IMainPresenter)
  private
    FView: IMainView;
    FBookList: TList<TObject>;
    FRestService: IMainRestService;
    FViewFactory: IViewFactory;
  public
    constructor Create(AView: IMainView; ARestService: IMainRestService;
      AViewFactory: IViewFactory);
    function GetModelClass: TClass;
    function GetBookList: TList<TObject>;
    procedure LoadBooks;
    procedure ShowBookDetails;
  end;

implementation

uses
  BookDetailsView,
  BookDetailsPresenter,
  BookDetailsRestService,
  Vcl.Forms;

{ TMainPresenter }

constructor TMainPresenter.Create(AView: IMainView;
  ARestService: IMainRestService; AViewFactory: IViewFactory);
begin
  inherited Create;
  FBookList := TList<TObject>.Create;
  FRestService := ARestService;
  FViewFactory := AViewFactory;
  FView := AView;
  FView.SetPresenter(Self);
end;

procedure TMainPresenter.LoadBooks;
begin
  FBookList := FRestService.RetrieveBooks;

  if FBookList.Count = 0 then
    FView.ShowMessageBox('No Record Found');
end;

function TMainPresenter.GetBookList: TList<TObject>;
begin
  Result := FBookList;
end;

function TMainPresenter.GetModelClass: TClass;
begin
  Result := TBook;
end;

procedure TMainPresenter.ShowBookDetails;
begin
  var SelectedBook := FView.GetSelectedBook as TBook;
  var BookDetailsView := FViewFactory.CreateBookDetailView(FView);
  var BookDetailsService := TBookDetailsRestService.Create;
  var BookDetailsPresenter := TBookDetailsPresenter.Create(BookDetailsView,
    SelectedBook, BookDetailsService, FViewFactory);
  BookDetailsPresenter.DisplayView;
end;

end.
