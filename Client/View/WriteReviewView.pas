unit WriteReviewView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Samples.Spin, ViewIntf, PresenterIntf, WriteReviewPresenter;

type
  TWriteReviewForm = class(TForm, IWriteReviewView)
    BookTitleLabel: TLabel;
    ReviewLabel: TLabel;
    RatingLabel: TLabel;
    SubmitButton: TButton;
    BookTitleEdit: TEdit;
    ReviewMemo: TMemo;
    RatingSpinEdit: TSpinEdit;
    procedure SubmitButtonClick(Sender: TObject);
  private
    FPresenter: IWriteReviewPresenter;
    procedure SetPresenter(APresenter: IWriteReviewPresenter);
  public
    procedure SetTitle(const Value: string);
    function GetReview: string;
    function GetRating: Integer;
    procedure ShowMessageBox(const MessageStr: string);
    function ShowConfirmationDialog(const MessageStr: string): Integer;
  end;

implementation

{$R *.dfm}

uses
  UITypes;

{ TWriteReviewFrm }

procedure TWriteReviewForm.SetTitle(const Value: string);
begin
  BookTitleEdit.Text := Value;
end;

function TWriteReviewForm.ShowConfirmationDialog(const MessageStr: string): Integer;
begin
  Result := MessageDlg(MessageStr, mtConfirmation, [mbYes, mbNo], 0);
end;

procedure TWriteReviewForm.ShowMessageBox(const MessageStr: string);
begin
  ShowMessage(MessageStr);
end;

procedure TWriteReviewForm.SubmitButtonClick(Sender: TObject);
begin
  FPresenter.ValidateReview;
end;

function TWriteReviewForm.GetRating: Integer;
begin
  Result := RatingSpinEdit.Value;
end;

function TWriteReviewForm.GetReview: string;
begin
  Result := ReviewMemo.Text;
end;

procedure TWriteReviewForm.SetPresenter(APresenter: IWriteReviewPresenter);
begin
  FPresenter := APresenter;
end;

end.
