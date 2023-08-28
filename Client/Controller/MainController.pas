unit MainController;

interface

uses
  ControllerIntf,
  Vcl.Forms,
  Generics.Collections,
  Book,
  MVCFramework.RESTClient;

type
  TMainController = class(TInterfacedObject, IController)
  private
    FView: TForm;
    FBookList: TObjectList<TBook>;
    FRestClient: IMVCRESTClient;
    function GetView: TForm;
    procedure SetView(AView: TForm);
  public
    constructor Create;
    procedure LoadBooks;
    procedure ClearBooks;
    procedure ShowBookDetails;
    procedure PromptLogin;
    property View: TForm read GetView write SetView;
  end;

implementation

uses
  BookstoreDM,
  MVCFramework.DataSet.Utils,
  MVCFramework.Serializer.Commons,
  BookDetailsView,
  BookDetailsController,
  AuthService,
  LoginController,
  MVCFramework.Serializer.JsonDataObjects,
  JsonDataObjects;

{ TMainCOntroller }

procedure TMainController.ClearBooks;
begin
  var MemTable := dmolBookstore.dsBooks;
  MemTable.Close;
  MemTable.Open;
end;

constructor TMainController.Create;
begin
  inherited Create;
  FBookList := TObjectList<TBook>.Create;
  FRestClient := TMVCRESTClient.New.BaseURL('localhost', 8080);
  FRestClient.SetBasicAuthorization('Guest', 'guest');

  var Response := FRestClient.Get('/api/login') as TMVCRESTResponse;
  if Response.Success then
  begin
    var Token: string := Response.ToJSONObject.Values['token'];
    var AuthService := TAuthService.GetInstance;
    AuthService.SetToken(Token);
    FRestClient.SetBearerAuthorization(AuthService.GetToken);
  end;
end;

function TMainController.GetView: TForm;
begin
  Result := FView;
end;

procedure TMainController.LoadBooks;
begin
  var MemTable := dmolBookstore.dsBooks;

  FRestClient.Async(
    procedure(Resp: IMVCRESTResponse)
    begin
      MemTable.Close;
      MemTable.Open;
      MemTable.LoadJSONArrayFromJSONObjectProperty('data', Resp.Content,
        TMVCNameCase.ncPascalCase);
      MemTable.First;
    end, nil, True).Get('/api/books');
end;

procedure TMainController.PromptLogin;
begin
  TLoginController.Create.View.Show;
end;

procedure TMainController.SetView(AView: TForm);
begin
  FView := AView;
end;

procedure TMainController.ShowBookDetails;
begin
  var BookDetail := TBook.Create();
  BookDetail.Id := dmolBookstore.dsBooksId.Value;
  BookDetail.Title := dmolBookstore.dsBooksTItle.Value;
  BookDetail.Synopsis := dmolBookstore.dsBooksSynopsis.Value;

  var BookDetailsController := TBookDetailsController.Create(BookDetail);
  BookDetailsController.Display;
end;

end.
