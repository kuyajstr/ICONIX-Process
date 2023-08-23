unit TestBookDao;

interface

uses
  DAOIntf, Book, Generics.Collections;

type
  TTestBookDao = class(TInterfacedObject, IDAO<TBook>)
  private
    FMockDatabase: TDictionary<Integer, TBook>;
  public
    constructor Create(AMockDatabase: TDictionary<Integer, TBook>);
    procedure Insert(var Obj: TBook);
    procedure Select(const AId: Integer; var Obj: TBook);
    procedure Update(var Obj: TBook);
    procedure Delete(const AId: Integer);
    procedure SelectAll(var AList: TObjectList<TBook>);
  end;

implementation

uses
  SysUtils;

{ TTestBookDao }

constructor TTestBookDao.Create(AMockDatabase: TDictionary<Integer, TBook>);
begin
  FMockDatabase := AMockDatabase;
end;

procedure TTestBookDao.Delete(const AId: Integer);
begin
  if AId <= 0 then
    raise Exception.Create('Invalid ID');

  FMockDatabase.Remove(AId);
end;

procedure TTestBookDao.Insert(var Obj: TBook);
begin
  if Obj.Title = '' then
    raise Exception.Create('Title is empty');

  if Obj.Synopsis = '' then
    raise Exception.Create('Synopsis is empty');

  FMockDatabase.Add(Obj.Id, Obj);
end;

procedure TTestBookDao.Select(const AId: Integer; var Obj: TBook);
begin
  if AId <= 0 then
    raise Exception.Create('Invalid ID');

  if AId > FMockDatabase.Count then
    raise Exception.Create('ID Out of bound');

  Obj := FMockDatabase.Items[AId];
end;

procedure TTestBookDao.SelectAll(var AList: TObjectList<TBook>);
begin
  AList.AddRange(FMockDatabase.Values);
end;

procedure TTestBookDao.Update(var Obj: TBook);
begin

end;

end.
