unit BookDetailsView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, ViewIntf, ControllerIntf;

type
  TBookDetailsForm = class(TForm,IView)
    TitleLabel: TLabel;
    SynopsisLabel: TLabel;
    WriteReviewButton: TButton;
    TitleEdit: TEdit;
    SynopsisMemo: TMemo;
    procedure WriteReviewButtonClick(Sender: TObject);
  private
    FController: IController;
    function GetController: IController;
    procedure SetController(AController: IController);
  public
    constructor Create(AController: IController);
    property Controller: IController read GetController write SetController;
  end;

implementation

{$R *.dfm}

uses
  BookstoreDM,
  WriteReviewView,
  BookDetailsController;

procedure TBookDetailsForm.WriteReviewButtonClick(Sender: TObject);
begin
  (FController as TBookDetailsController).WriteReview;
end;

constructor TBookDetailsForm.Create(AController: IController);
begin
  inherited Create(Application);

  FController := AController;
  FController.View := Self;
end;

function TBookDetailsForm.GetController: IController;
begin
  Result := FController;
end;

procedure TBookDetailsForm.SetController(AController: IController);
begin
  FController := AController;
end;

end.
