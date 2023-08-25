unit CustomerReviewService;

interface

uses
  CustomerReview, DAOIntf, Generics.Collections;

type
  TCustomerReviewService = class
  private
    FCustomerReviewDao: IDAO<TCustomerReview>;
  public
    constructor Create(const ACustomerReviewDao: IDAO<TCustomerReview>);

    procedure CreateCustomerReview(var ACustomerReview: TCustomerReview);
    procedure GetCustomerReview(const AId: Integer;
      var ACustomer: TCustomerReview);
    procedure UpdateCustomerReview(var ACustomerReview: TCustomerReview);
    procedure DeleteCustomerReview(const AId: Integer);
    procedure GetAllCustomerReview(var AList: TObjectList<TCustomerReview>);

    procedure ValidateCustomerReview(const ACustomerReview: TCustomerReview);

  end;

implementation

uses
  SysUtils;

{ TCustomerReviewService }

constructor TCustomerReviewService.Create(const ACustomerReviewDao
  : IDAO<TCustomerReview>);
begin
  if not Assigned(ACustomerReviewDao) then
    raise EArgumentNilException.Create('Customer Review Data access is nil');

  inherited Create;
  FCustomerReviewDao := ACustomerReviewDao;
end;

procedure TCustomerReviewService.CreateCustomerReview(var ACustomerReview
  : TCustomerReview);
begin
  FCustomerReviewDao.Insert(ACustomerReview);
end;

procedure TCustomerReviewService.DeleteCustomerReview(const AId: Integer);
begin
  FCustomerReviewDao.Delete(AId);
end;

procedure TCustomerReviewService.GetAllCustomerReview
  (var AList: TObjectList<TCustomerReview>);
begin
  FCustomerReviewDao.SelectAll(AList);
end;

procedure TCustomerReviewService.GetCustomerReview(const AId: Integer;
  var ACustomer: TCustomerReview);
begin
  FCustomerReviewDao.Select(AId, ACustomer);
end;

procedure TCustomerReviewService.UpdateCustomerReview(var ACustomerReview
  : TCustomerReview);
begin
  FCustomerReviewDao.Update(ACustomerReview);
end;

procedure TCustomerReviewService.ValidateCustomerReview(const ACustomerReview
  : TCustomerReview);
begin
  ACustomerReview.CheckRating;
  ACustomerReview.CheckReview;
end;

end.
