unit ViewFactory;

interface

uses
  Vcl.Forms,
  ViewIntf,
  System.Classes;

type
  IViewFactory = interface
    ['{BB550F9D-6885-46BB-A22C-2B3D23DE1D46}']
    function CreateMainView(AOwner: IInterface): IMainView;
    function CreateBookDetailView(AOwner: IInterface): IBookDetailsView;
    function CreateLoginView(AOwner: IInterface): ILoginView;
    function CreateWriteReviewView(AOwner: IInterface): IWriteReviewView;
  end;

  TViewFactory = class(TInterfacedObject, IViewFactory)
  public
    function CreateMainView(AOwner: IInterface): IMainView;
    function CreateBookDetailView(AOwner: IInterface): IBookDetailsView;
    function CreateLoginView(AOwner: IInterface): ILoginView;
    function CreateWriteReviewView(AOwner: IInterface): IWriteReviewView;
  end;

implementation

uses
  MainView,
  BookDetailsView,
  LoginView,
  WriteReviewView;
{ TViewFactory }

function TViewFactory.CreateBookDetailView(
  AOwner: IInterface): IBookDetailsView;
begin
  Result := TBookDetailsForm.Create(AOwner as TForm);
end;

function TViewFactory.CreateLoginView(AOwner: IInterface): ILoginView;
begin
  Result := TLoginForm.Create(AOwner as TForm);
end;

function TViewFactory.CreateMainView(AOwner: IInterface): IMainView;
begin
  Result := TMainForm.Create(AOwner as TForm);
end;


function TViewFactory.CreateWriteReviewView(
  AOwner: IInterface): IWriteReviewView;
begin
  Result := TWriteReviewForm.Create(AOwner as TForm);
end;

end.