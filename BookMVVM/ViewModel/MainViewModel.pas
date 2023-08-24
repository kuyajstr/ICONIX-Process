unit MainViewModel;

interface

uses
  Generics.Collections, Book, Vcl.ComCtrls, Classes, Bindings.Helper;
// MVCFramework.RESTClient;

type
  TMainViewModel = class
  private
    FBookList: TList<TBook>;
    FSelectedBook: TBook;
    FItemList: TStringList ;
    // FRestClient: IMVCRESTClient;
    procedure OnPropertyChanged(const PropertyName: string);
    function GetSelectedIndex: Integer;
    procedure SetSelectedIndex(const Value: Integer);

  public
    constructor Create;

    property SelectedBook: TBook read FSelectedBook write FSelectedBook;
    property ItemList: TStringList read FItemList write FItemList;

    property SelectedIndex: Integer read GetSelectedIndex write SetSelectedIndex;

    procedure LoadBooks;
    procedure ShowBookDetail;
  end;

implementation

uses
  // AuthService,
  Vcl.Dialogs,
  Vcl.Forms,
  BookDetailsForm,
  BookDetailsViewModel,
  SysUtils;

{ TMainViewModel }

constructor TMainViewModel.Create;
begin
  FBookList := TList<TBook>.Create;
  FItemList := TStringList.Create;
  FBookList.Add(TBook.Create('Book A', 'Synopsis for Book A', 1));
  FBookList.Add(TBook.Create('Book B', 'Synopsis for Book B', 2));
  FBookList.Add(TBook.Create('Book C', 'Synopsis for Book C', 3));

  FSelectedBook := FBookList.First;
  SelectedIndex := 0;

  inherited Create;
  // FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  // FRestClient.SetBasicAuthorization('Admin', 'admin');
  //
  // FRestClient.Async(
  // procedure(Resp: IMVCRESTResponse)
  // begin
  // if Resp.Success then
  // begin
  // var Token: string := Resp.ToJSONObject.Values['token'];
  // TAuthService.GetInstance.SetToken(Token);
  // FRestClient.SetBearerAuthorization(TAuthService.GetInstance.GetToken)
  // end
  // else
  // ShowMessage('Login Failed');
  // end, nil, True).Get('/api/login');
end;

function TMainViewModel.GetSelectedIndex: Integer;
begin
  Result := FItemList.IndexOfObject(SelectedBook);
end;

procedure TMainViewModel.LoadBooks;
begin
  FItemList := TStringList.Create;
  for var BookDetails in FBookList do
    FItemList.AddObject(BookDetails.Title, BookDetails);

  OnPropertyChanged('ItemList');

  // FRestClient.Async(
  // procedure(Resp: IMVCRESTResponse)
  // begin
  //
  // end, nil, True).Get('/api/books');
end;

procedure TMainViewModel.OnPropertyChanged(const PropertyName: string);
begin
  TBindings.Notify(Self, PropertyName);
end;

procedure TMainViewModel.SetSelectedIndex(const Value: Integer);
begin
  if FItemList.Count <> 0 then
  begin
    SelectedBook := FItemList.Objects[Value] as TBook;
    OnPropertyChanged('SelectedBook');
  end;
end;

procedure TMainViewModel.ShowBookDetail;
begin
  var
  BookDetailsVM := TBookDetailsViewModel.Create(FSelectedBook);
  var
  BookDetailFrm := TBookDetailsFrm.Create(BookDetailsVM);

  BookDetailFrm.Show;
end;

end.
