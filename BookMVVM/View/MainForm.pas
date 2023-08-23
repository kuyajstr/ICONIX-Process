unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, ViewModelIntf, Vcl.Mask,
  Vcl.ExtCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  ViewIntf, MainViewModel, Vcl.ComCtrls, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors;

type
  TMainFrm = class(TForm)
    lblHeader: TLabel;
    edtId: TLabeledEdit;
    edtTItle: TLabeledEdit;
    lblBookList: TLabel;
    BindlingList: TBindingsList;
    ViewModelBindScope: TBindScope;
    ListView1: TListView;
    BookIdBinding: TBindExpression;
    BookTitleBinding: TBindExpression;
    btnViewBook: TButton;
    procedure btnViewBookClick(Sender: TObject);
  private
    FViewModel: TMainViewModel;

  public
    procedure SetViewModel(const AViewModel: TMainViewModel);
  end;

implementation

{$R *.dfm}


{ TMainFrm }


procedure TMainFrm.btnViewBookClick(Sender: TObject);
begin
   FViewModel.ShowBookDetail;
end;

procedure TMainFrm.SetViewModel(const AViewModel: TMainViewModel);
begin
  FViewModel := AViewModel;

  ViewModelBindScope.DataObject := FViewModel;
  ViewModelBindScope.Active := True;
end;

end.
