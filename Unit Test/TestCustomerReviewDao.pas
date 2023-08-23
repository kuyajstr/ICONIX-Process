unit TestCustomerReviewDao;

interface

uses
   DAOIntf, CustomerReview, Generics.Collections;

type
  TTestCustomerReviewDao = class(TInterfacedObject, IDAO<TCustomerReview>)
  private
    FMockDatabase: TList<TCustomerReview>;
  public
    constructor Create(AMockDatabase: TList<TCustomerReview>);
    procedure Insert(var Obj: TCustomerReview);
    procedure Select(const AId: Integer; var Obj: TCustomerReview);
    procedure Update(var Obj: TCustomerReview);
    procedure Delete(const AId: Integer);
    procedure SelectAll(var AList: TObjectList<TCustomerReview>);
  end;

implementation

uses
  SysUtils;

{ TTestCustomerReviewDao }

constructor TTestCustomerReviewDao.Create(
  AMockDatabase: TList<TCustomerReview>);
begin
  FMockDatabase := AMockDatabase;
end;

procedure TTestCustomerReviewDao.Delete(const AId: Integer);
begin
  if AId <= 0 then
    raise Exception.Create('Invalid ID');

  if AId > FMockDatabase.Count then
    raise Exception.Create('Index out of bound');

  FMockDatabase.Delete(AId);
end;

procedure TTestCustomerReviewDao.Insert(var Obj: TCustomerReview);
begin
  FMockDatabase.Add(Obj);
end;

procedure TTestCustomerReviewDao.Select(const AId: Integer;
  var Obj: TCustomerReview);
begin
  if AId <= 0 then
    raise Exception.Create('Invalid ID');

  if AId > FMockDatabase.Count then
    raise Exception.Create('Index out of bound');

  Obj := FMockDatabase[AId];
end;

procedure TTestCustomerReviewDao.SelectAll(
  var AList: TObjectList<TCustomerReview>);
begin
  AList := TObjectList<TCustomerReview>.Create;
  AList.AddRange(FMockDatabase.ToArray)
end;

procedure TTestCustomerReviewDao.Update(var Obj: TCustomerReview);
begin
  if (Obj.Id <= 0) or (Obj.Id > FMockDatabase.Count) then
    raise Exception.Create('Review not found');

  FMockDatabase[Obj.Id] := Obj;
end;

end.
