unit WriteReviewRestServiceStub;

interface

uses
  WriteReviewRestService,
  Json;

type
  TWriteReviewRestServiceStub = class(TInterfacedObject, IWriteReviewRestService)
  private
    FIsBasicCourse: Boolean;
  public
    constructor Create(IsBasicCourse: Boolean);
    function ValidationResponse(const JSONBody: TJSONObject): string;
    function IsSubmissionSuccess(const JSONBody: TJSONObject): Boolean;
  end;

implementation

{ TWriteReviewRestServiceStub }

constructor TWriteReviewRestServiceStub.Create(IsBasicCourse: Boolean);
begin
  FIsBasicCourse := IsBasicCourse;
end;

function TWriteReviewRestServiceStub.IsSubmissionSuccess(
  const JSONBody: TJSONObject): Boolean;
begin
  Result := FIsBasicCourse;
end;

function TWriteReviewRestServiceStub.ValidationResponse(
  const JSONBody: TJSONObject): string;
begin
  if FIsBasicCourse then
    Result := 'Customer Review is Valid'
  else
    Result := 'Customer Review is Invalid';
end;

end.
