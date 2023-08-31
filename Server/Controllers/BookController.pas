unit BookController;

interface

uses
  MVCFramework,
  MVCFramework.Commons,
  MVCFramework.Serializer.Commons,
  Book,
  BookService,
  BookServiceIntf,
  BookActiveRecord;

type
  TBookController = class(TMVCController)
  private
    FService: IBookService;
  public
    constructor Create(const AService: IBookService);

    [MVCPath]
    [MVCHTTPMethod([httpPOST])]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure CreateBook();

    [MVCPath]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetAllBooks();

    [MVCPath('/($ID)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetBookByID(const ID: Integer);

    [MVCPath('/($ID)')]
    [MVCHTTPMethod([httpDELETE])]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure DeleteBook(const ID: Integer);

    [MVCPath('/($ID)')]
    [MVCHTTPMethod([httpPUT])]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure UpdateBook(const ID: Integer);
  end;

implementation

uses
  SysUtils,
  Generics.Collections;

{ TBookController }

constructor TBookController.Create(const AService: IBookService);
begin
  if not assigned(AService) then
    raise EArgumentNilException.Create('Book Service is nill');

  inherited Create;
  FService := AService;
end;

procedure TBookController.CreateBook;
begin
  var Book := Context.Request.BodyAs<TBook>;
  try
    FService.CreateBook(Book);
    Render(201, 'Book Created');
  finally
    Book.Free;
  end;
end;

procedure TBookController.DeleteBook(const ID: Integer);
begin
  FService.DeleteBook(ID);
  Render204NoContent(Format('Book: %d deleted.', [ID]));
end;

procedure TBookController.GetAllBooks;
var
  BookList: TObjectList<TBook>;
begin
  FService.GetAllBooks(BookList);

  Render(ObjectDict().Add('data', BookList));
end;

procedure TBookController.GetBookByID(const ID: Integer);
var
  Book: TBook;
begin
  FService.GetBook(ID, Book);

  Render(ObjectDict().Add('data', Book));
end;

procedure TBookController.UpdateBook(const ID: Integer);
begin
  var Book := Context.Request.BodyAs<TBook>;
  try
    Book.ID := ID;
    FService.UpdateBook(Book);
    Render(200, 'Book Updated');
  finally
    Book.Free;
  end;
end;

end.
