unit ViewFactoryStub;

interface

uses
  ViewFactory,
  ViewIntf,
  Vcl.Forms,
  Classes;

type
  TViewFactoryStub = class(TInterfacedObject, IViewFactory)
  private
    FIsBasicCourse: Boolean;
  public
    constructor Create(IsBasicCourse: Boolean);
    function CreateMainView(AOwner: IInterface): IMainView;
    function CreateBookDetailView(AOwner: IInterface): IBookDetailsView;
    function CreateLoginView(AOwner: IInterface): ILoginView;
    function CreateWriteReviewView(AOwner: IInterface): IWriteReviewView;
  end;

implementation

uses
  MainViewStub,
  BookDetailsViewStub,
  LoginViewStub,
  WriteReviewViewStub;

{ TViewFactoryStub }

constructor TViewFactoryStub.Create(IsBasicCourse: Boolean);
begin
  FIsBasicCourse := IsBasicCourse;
end;

function TViewFactoryStub.CreateBookDetailView(
  AOwner: IInterface): IBookDetailsView;
begin
  Result := TBookDetailsViewStub.Create(FIsBasicCourse);
end;

function TViewFactoryStub.CreateLoginView(AOwner: IInterface): ILoginView;
begin
  Result := TLoginViewStub.Create;
end;

function TViewFactoryStub.CreateMainView(AOwner: IInterface): IMainView;
begin
  Result := TMainViewStub.Create(FIsBasicCourse);
end;

function TViewFactoryStub.CreateWriteReviewView(
  AOwner: IInterface): IWriteReviewView;
begin
  Result := TWriteReViewViewStub.Create(FIsBasicCourse);
end;

end.
