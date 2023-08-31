unit BookServiceIntf;

interface

uses
  Book, DAOIntf, Generics.Collections;

type
  IBookService = interface
    ['{2182D307-B4E5-4CA5-8D46-28B03D49D38E}']

    procedure CreateBook(var ABook: TBook);
    procedure GetBook(const AId: Integer; var ABook: TBook);
    procedure UpdateBook(var ABook: TBook);
    procedure DeleteBook(const AId: Integer);
    procedure GetAllBooks(var AList: TObjectList<TBook>);
  end;

implementation

end.
