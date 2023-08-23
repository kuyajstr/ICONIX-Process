unit MainViewModel;

interface

uses
  Generics.Collections, Book, Vcl.ComCtrls;
//  MVCFramework.RESTClient;

type
  TMainViewModel = class
  private
    FBookList: TList<TBook>;
    FSelectedBook: TBook;
    FItemList: TListItem;
//    FRestClient: IMVCRESTClient;
  public
    constructor Create;

    property BookList: TList<TBook> read FBookList write FBookList;
    property SelectedBook: TBook read FSelectedBook write FSelectedBook;
    property ItemList: TListItem read FItemList write FItemList;

    procedure LoadBooks;
  end;

implementation

uses
  AuthService,
  Vcl.Dialogs,
  Vcl.Forms;

{ TMainViewModel }

constructor TMainViewModel.Create;
begin
  inherited Create;

//  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
//  FRestClient.SetBasicAuthorization('Admin', 'admin');
//
//  FRestClient.Async(
//    procedure(Resp: IMVCRESTResponse)
//    begin
//      if Resp.Success then
//      begin
//        var Token: string := Resp.ToJSONObject.Values['token'];
//        TAuthService.GetInstance.SetToken(Token);
//        FRestClient.SetBearerAuthorization(TAuthService.GetInstance.GetToken)
//      end
//      else
//        ShowMessage('Login Failed');
//    end, nil, True).Get('/api/login');
end;

procedure TMainViewModel.LoadBooks;
begin
  FBookList := TList<TBook>.Create;
  FBookList.Add(TBook.Create('Book A', 'Synopsis for Book A', 1));
  FBookList.Add(TBook.Create('Book B', 'Synopsis for Book B', 2));
  FBookList.Add(TBook.Create('Book C', 'Synopsis for Book C', 3));

  SelectedBook := FBookList.First;



//  FRestClient.Async(
//    procedure(Resp: IMVCRESTResponse)
//    begin
//
//    end, nil, True).Get('/api/books');
end;

end.
