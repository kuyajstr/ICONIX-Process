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
    edtEdit: TLabeledEdit;
    edtTItle: TLabeledEdit;
    lblBookList: TLabel;
    BindlingList: TBindingsList;
    ViewModelBindScope: TBindScope;
    BookIdBinding: TBindExpression;
    BookTitleBinding: TBindExpression;
    btnViewBook: TButton;
    btnLoadBooks: TButton;
    lsbBooklist: TListBox;
    BooklistBinding: TBindExpression;
    SelectionChangeBinding: TBindExpression;
    procedure btnViewBookClick(Sender: TObject);
    procedure btnLoadBooksClick(Sender: TObject);
    procedure OnPropertyChanged(Sender: TObject);
  private
    FViewModel: TMainViewModel;


  public
    procedure SetViewModel(const AViewModel: TMainViewModel);
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}


{ TMainFrm }


procedure TMainFrm.btnViewBookClick(Sender: TObject);
begin
   FViewModel.ShowBookDetail;
end;

constructor TMainFrm.Create(AOwner: TComponent);
begin
  var MainViewModel := TMainViewModel.Create;
  SetViewModel(MainViewModel);

  inherited Create(AOwner);
end;

procedure TMainFrm.OnPropertyChanged(Sender: TObject);
begin
  if Self.Visible then
    BindlingList.Notify(Sender, '');
end;

procedure TMainFrm.btnLoadBooksClick(Sender: TObject);
begin
  FViewModel.LoadBooks;
end;

procedure TMainFrm.SetViewModel(const AViewModel: TMainViewModel);
begin
  FViewModel := AViewModel;

  ViewModelBindScope.DataObject := FViewModel;
  ViewModelBindScope.Active := True;
end;

end.
