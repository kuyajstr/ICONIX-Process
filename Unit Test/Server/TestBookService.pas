unit TestBookService;

interface

uses
  BookService, System.Generics.Collections, Book;

type
  TTestNoOutputBookService = class(TBookService)
  public

    procedure GetAllBooks(var AList: TList<TBook>); override;
  end;

implementation

{ TTestNoOutputBookService }

procedure TTestNoOutputBookService.GetAllBooks(var AList: TList<TBook>);
begin
  AList := TList<TBook>.Create;
end;

end.
