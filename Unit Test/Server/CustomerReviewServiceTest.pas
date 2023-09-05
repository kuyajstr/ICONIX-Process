unit CustomerReviewServiceTest;

interface

uses
  DUnitX.TestFramework,
  Generics.Collections,
  CustomerReview;

type

  [TestFixture]
  TCustomerReviewServiceTest = class
  private
    FMockDB: TList<TCustomerReview>;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure Teardown;

    [Test]
    procedure Validate_SucessfullyValidateReview_WillNotRaiseException;

    [TestCase('Review is less than 10 char', 'Test,4,The review is too short')]
    [TestCase('Rating is equal to 0', 'Review Test,0,Rating outside allowed range')]
    [TestCase('Rating is less than 0', 'Review Test,-1,Rating outside allowed range')]
    [TestCase('Rating is more than 5', 'Review Test,6,Rating outside allowed range')]
    [TestCase('Rating is floating point', 'Review Test,4.5,Rating outside allowed range')]
    procedure Validate_InputInvalidCustomerReview_MatchingErrorMessage(
      const ReviewStr : string; const Rating: Integer; const ExpectedErrorMsg: string);

    [Test]
    procedure SubmitReview_SuccessfullySubmitReview_WillNotRaiseException;

    [Test]
    procedure SubmitReview_SuccessfullySubmitReview_ListCountShouldNotBeZero;
  end;

implementation

uses
  TestCustomerReviewDao,
  CustomerReviewService,
  SysUtils;

{ TCustomerReviewService }

procedure TCustomerReviewServiceTest.Setup;
begin
  FMockDB := TList<TCustomerReview>.Create;
end;

procedure TCustomerReviewServiceTest.SubmitReview_SuccessfullySubmitReview_ListCountShouldNotBeZero;
begin
  //Arrange
  var ReviewDao := TTestCustomerReviewDao.Create(FMockDB);
  var Service := TCustomerReviewService.Create(ReviewDao);
  var Review := TCustomerReview.Create(1, 1, 1, 'Valid Customer Review', 5, True);

  //Act
  Service.CreateCustomerReview(Review);

  //Assert
  Assert.AreNotEqual(0, FMockDB.Count);
end;

procedure TCustomerReviewServiceTest.SubmitReview_SuccessfullySubmitReview_WillNotRaiseException;
begin
  //Arrange
  var ReviewDao := TTestCustomerReviewDao.Create(FMockDB);
  var Service := TCustomerReviewService.Create(ReviewDao);
  var Review := TCustomerReview.Create(1, 1, 1, 'Valid Customer Review', 5, True);

  //Act & Assert
  Assert.WillNotRaise(
  procedure
  begin
    Service.CreateCustomerReview(Review);
  end);
end;

procedure TCustomerReviewServiceTest.Teardown;
begin
  FMockDB.Free;
end;

procedure TCustomerReviewServiceTest.Validate_InputInvalidCustomerReview_MatchingErrorMessage(
  const ReviewStr: string; const Rating: Integer; const ExpectedErrorMsg: string);
begin
  // Arrange
  var ReviewDao := TTestCustomerReviewDao.Create(FMockDB);
  var Service := TCustomerReviewService.Create(ReviewDao);
  var Review := TCustomerReview.Create(0, 0, 0, ReviewStr, Rating, True);
  var ErrorMsg := '';

  // Act
  try
    Service.ValidateCustomerReview(Review)
  except
    on E: Exception do
      ErrorMsg  := E.Message;
  end;

  //Assert
  Assert.AreEqual(ExpectedErrorMsg,ErrorMsg)
end;

procedure TCustomerReviewServiceTest.Validate_SucessfullyValidateReview_WillNotRaiseException;
begin
  //Arrange
  var ReviewDao := TTestCustomerReviewDao.Create(FMockDB);
  var Service := TCustomerReviewService.Create(ReviewDao);
  var Review := TCustomerReview.Create(0, 0, 0, 'Valid Review Test', 4, True);

  // Act and Assert
  Assert.WillNotRaiseAny(
    procedure
    begin
      Service.ValidateCustomerReview(Review);
    end);
end;

initialization
 TDUnitX.RegisterTestFixture(TCustomerReviewServiceTest);

end.
