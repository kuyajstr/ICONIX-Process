unit WriteReviewView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Samples.Spin, ViewIntf, ControllerIntf, WriteReviewController;

type
  TWriteReviewForm = class(TForm, IView)
    BookTitleLabel: TLabel;
    ReviewLabel: TLabel;
    RatingLabel: TLabel;
    SubmitButton: TButton;
    BookTitleEdit: TEdit;
    ReviewMemo: TMemo;
    RatingSpinEdit: TSpinEdit;
    procedure SubmitButtonClick(Sender: TObject);
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
  BookstoreDM;

{ TWriteReviewFrm }

procedure TWriteReviewForm.SubmitButtonClick(Sender: TObject);
begin
  (FController as TWriteReviewController).ValidateReview(
    ReviewMemo.Text, RatingSpinEdit.Value);
end;

constructor TWriteReviewForm.Create(AController: IController);
begin
  inherited Create(Application);
  Controller := AController;
  Controller.View := Self;
end;

function TWriteReviewForm.GetController: IController;
begin
  Result := FController;
end;

procedure TWriteReviewForm.SetController(AController: IController);
begin
  FController := AController;
end;

end.