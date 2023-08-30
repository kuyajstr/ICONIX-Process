unit BookDetailsView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, ViewIntf, PresenterIntf;

type
  TBookDetailsForm = class(TForm,IView)
    TitleLabel: TLabel;
    SynopsisLabel: TLabel;
    WriteReviewButton: TButton;
    TitleEdit: TEdit;
    SynopsisMemo: TMemo;
    procedure WriteReviewButtonClick(Sender: TObject);
  private
    FPresenter: IPresenter;
    procedure SetPresenter(APresenter: IPresenter);
  end;

implementation

{$R *.dfm}

uses
  BookDetailsPresenter;

procedure TBookDetailsForm.WriteReviewButtonClick(Sender: TObject);
begin
  (FPresenter as TBookDetailsPresenter).ValidateWriteReview;
end;

procedure TBookDetailsForm.SetPresenter(APresenter: IPresenter);
begin
  FPresenter := APresenter;
end;

end.
