unit BookDetailsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, ViewIntf, ControllerIntf;

type
  TBookDetailsFrm = class(TForm,IView)
    lblTitle: TLabel;
    lblSynopsis: TLabel;
    btnWriteReview: TButton;
    edtTitle: TEdit;
    memSynopsis: TMemo;
    procedure btnWriteReviewClick(Sender: TObject);
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
  WriteReviewForm,
  BookDetailsController;

procedure TBookDetailsFrm.btnWriteReviewClick(Sender: TObject);
begin
  (FController as TBookDetailsController).WriteReview;
end;

constructor TBookDetailsFrm.Create(AController: IController);
begin
  inherited Create(Application);

  FController := AController;
  FController.View := Self;
end;

function TBookDetailsFrm.GetController: IController;
begin
  Result := FController;
end;

procedure TBookDetailsFrm.SetController(AController: IController);
begin
  FController := AController;
end;

end.
