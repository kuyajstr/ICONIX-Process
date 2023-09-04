unit BookDetailsView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, ViewIntf, PresenterIntf;

type
  TBookDetailsForm = class(TForm, IBookDetailsView)
    TitleLabel: TLabel;
    SynopsisLabel: TLabel;
    WriteReviewButton: TButton;
    TitleEdit: TEdit;
    SynopsisMemo: TMemo;
    procedure WriteReviewButtonClick(Sender: TObject);
  private
    FPresenter: IBookDetailsPresenter;
    procedure SetPresenter(APresenter: IBookDetailsPresenter);
  public
    procedure SetTitle(const Value: string);
    procedure SetSynopsis(const Value: string);
    function ShowConfirmationDialog(const MessageStr: string): Integer;
  end;

implementation

{$R *.dfm}

uses
  BookDetailsPresenter,
  UITypes;

procedure TBookDetailsForm.SetSynopsis(const Value: string);
begin
  SynopsisMemo.Text := Value;
end;

procedure TBookDetailsForm.SetTitle(const Value: string);
begin
  TitleEdit.Text := Value;
end;

function TBookDetailsForm.ShowConfirmationDialog(
  const MessageStr: string): Integer;
begin
  Result := MessageDlg(MessageStr, mtConfirmation, [mbYes, mbNo], 0);
end;

procedure TBookDetailsForm.WriteReviewButtonClick(Sender: TObject);
begin
  FPresenter.ComposeReview;
end;

procedure TBookDetailsForm.SetPresenter(APresenter: IBookDetailsPresenter);
begin
  FPresenter := APresenter;
end;

end.
