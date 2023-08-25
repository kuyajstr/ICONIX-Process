unit BookDetailsView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, BookDetailsViewModel, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors;

type
  TBookDetailsForm = class(TForm)
    TitleLabel: TLabel;
    SynopsisLabel: TLabel;
    TitleEdit: TEdit;
    SynopsisMemo: TMemo;
    ViewModelBindingScope: TBindScope;
    BindingList: TBindingsList;
    BookDetailTitleBinding: TBindExpression;
    BookDetailSynopsisBinding: TBindExpression;
  private
    FViewModel: TBookDetailsViewModel;
    procedure SetViewModel(AViewModel: TBookDetailsViewModel);
  public
    constructor Create(AViewModel: TBookDetailsViewModel);
  end;

implementation

{$R *.dfm}


{ TBookDetailsFrm }



constructor TBookDetailsForm.Create(AViewModel: TBookDetailsViewModel);
begin
  inherited Create(Application);

  SetViewModel(AViewModel);
end;

procedure TBookDetailsForm.SetViewModel(AViewModel: TBookDetailsViewModel);
begin
  FViewModel := AViewModel;

  ViewModelBindingScope.DataObject := FViewModel;
  ViewModelBindingScope.Active := True;
end;

end.
