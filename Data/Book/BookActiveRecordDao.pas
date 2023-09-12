unit BookActiveRecordDao;

interface

uses
  DAOIntf,
  Book,
  BookActiveRecord,
  MVCFramework.ActiveRecord,
  Generics.Collections,
  BookContextIntf;

type
  TBookActiveRecordDao = class(TinterfacedObject, IDAO<TBook>)
  private
    function ARtoBook(List: TObjectList<TMVCActiveRecord>): TObjectList<TBook>;
  public
    procedure Insert(var Obj: TBook);
    procedure Select(const AId: Integer; var Obj: TBook);
    procedure Update(var Obj: TBook);
    procedure Delete(const AId: Integer);
    procedure SelectAll(var AList: TObjectList<TBook>);
  end;

implementation

uses
  MapperUtility;

{ TBookActiveRecordDao }

function TBookActiveRecordDao.ARtoBook(List: TObjectList<TMVCActiveRecord>)
  : TObjectList<TBook>;
var
  BookList: TObjectList<TBook>;
  AR: TMVCActiveRecord;
  BookAR: TBookActiveRecord;
begin
  BookList := TObjectList<TBook>.Create;

  for AR in List do
  begin
    BookAR := AR as TBookActiveRecord;
    BookList.Add(TBook.Create(BookAR));
  end;

  Result := BookList;
end;

procedure TBookActiveRecordDao.Delete(const AId: Integer);
begin
  var BookAR := TBookActiveRecord.Create;
  try
    BookAR.Id := AId;
    BookAR.Delete(True);
  finally
    BookAR.Free;
  end;
end;

procedure TBookActiveRecordDao.Insert(var Obj: TBook);
begin
  var BookAR := TBookActiveRecord.Create(Obj);
  try
    BookAR.Insert;
    Obj := TBook.Create(BookAR);
  finally
    BookAR.Free;
  end;
end;

procedure TBookActiveRecordDao.Select(const AId: Integer; var Obj: TBook);
begin
  var BookAR := TBookActiveRecord.Create;
  try
    BookAR.LoadByPk(AId);
    Obj := TBook.Create(BookAR);
  finally
    BookAR.Free;
  end;
end;

procedure TBookActiveRecordDao.SelectAll(var AList: TObjectList<TBook>);
begin
  var BooksAR := TMVCActiveRecord.All(TBookActiveRecord);
  try
    AList := TMapper.CopyList<TBook, TMVCActiveRecord>(BooksAR);
  finally
    BooksAR.Free;
  end;
end;

procedure TBookActiveRecordDao.Update(var Obj: TBook);
begin
  var BookAR := TBookActiveRecord.Create(Obj);
  try
    BookAR.Update;
    Obj := TBook.Create(BookAR);
  finally
    BookAR.Free;
  end;
end;

end.
