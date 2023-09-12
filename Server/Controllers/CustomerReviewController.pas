unit CustomerReviewController;

interface

uses
  MVCFramework,
  MVCFramework.Commons,
  MVCFramework.Serializer.Commons,

  CustomerReview,
  CustomerReviewService,
  CustomerReviewServiceIntf,
  CustomerReviewActiveRecord;

type
  TCustomerReviewController = class(TMVCController)
  private
    FService: ICustomerReviewService;
  public
    constructor Create(const AService: ICustomerReviewService);

    [MVCPath]
    [MVCHTTPMethod([httpPOST])]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure CreateCustomerReview();

    [MVCPath('/validate')]
    [MVCHTTPMethod([httpPOST])]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure ValidateReview();

    [MVCPath]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetAllCustomerReview();

    [MVCPath('/($ID)')]
    [MVCHTTPMethod([httpGET])]
    [MVCProduces(TMVCMediaType.APPLICATION_JSON)]
    procedure GetCustomerReviewByID(const ID: Integer);

    [MVCPath('/($ID)')]
    [MVCHTTPMethod([httpDELETE])]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure DeleteCustomerReview(const ID: Integer);

    [MVCPath('/($ID)')]
    [MVCHTTPMethod([httpPUT])]
    [MVCConsumes(TMVCMediaType.APPLICATION_JSON)]
    procedure UpdateCustomerReview(const ID: Integer);
  end;

implementation

uses
  StrUtils,
  SysUtils,
  Generics.Collections;

{ TCustomerReviewController }

constructor TCustomerReviewController.Create(const AService: ICustomerReviewService);
begin
  if not assigned(AService) then
    raise EArgumentNilException.Create('Customer Review Service is nil');

  inherited Create;
  FService := AService;
end;

procedure TCustomerReviewController.CreateCustomerReview;
begin
  var CustomerReview := Context.Request.BodyAs<TCustomerReview>;
  try
    CustomerReview.IsPending := True;
    FService.CreateCustomerReview(CustomerReview);
    Render201Created('Review submitted');
  finally
    CustomerReview.Free;
  end;
end;

procedure TCustomerReviewController.DeleteCustomerReview(const ID: Integer);
begin
  FService.DeleteCustomerReview(ID);
  Render204NoContent(Format('Review: %d Deleted', [ID]));
end;

procedure TCustomerReviewController.GetAllCustomerReview;
var
  ReviewList: TObjectList<TCustomerReview>;
begin
  FService.GetAllCustomerReview(ReviewList);
  Render(ObjectDict().Add('data', ReviewList));
end;

procedure TCustomerReviewController.GetCustomerReviewByID(const ID: Integer);
var
  CustomerReview: TCustomerReview;
begin
  FService.GetCustomerReview(ID, CustomerReview);
  Render(302, CustomerReview);
end;

procedure TCustomerReviewController.UpdateCustomerReview(const ID: Integer);
begin
  var CustomerReview := Context.Request.BodyAs<TCustomerReview>;
  try
    CustomerReview.ID := ID;
    FService.UpdateCustomerReview(CustomerReview);
  finally
    CustomerReview.Free;
  end;
end;

procedure TCustomerReviewController.ValidateReview;
begin
  var CustomerReview := Context.Request.BodyAs<TCustomerReview>;
  try
    try
      FService.ValidateCustomerReview(CustomerReview);
      Render(200, 'Customer Review is Valid');
    except
      on E: Exception do
        Render(400, E.Message);
    end;
  finally
    CustomerReview.Free;
  end;
end;

end.
