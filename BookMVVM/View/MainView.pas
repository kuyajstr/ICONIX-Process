unit MainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.ExtCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  MainViewModel, Vcl.ComCtrls, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors;

type
  TMainForm = class(TForm)
    HeaderLabel: TLabel;
    IdEdit: TLabeledEdit;
    TitleEdit: TLabeledEdit;
    BooklistLabel: TLabel;
    BindlingList: TBindingsList;
    ViewModelBindScope: TBindScope;
    BookIdBinding: TBindExpression;
    BookTitleBinding: TBindExpression;
    ViewBookButton: TButton;
    BooklistListBox: TListBox;
    BooklistBinding: TBindExpression;
    SelectionChangeBinding: TBindExpression;
    LoadBookButton: TButton;
    procedure ViewBookButtonClick(Sender: TObject);
    procedure OnPropertyChanged(Sender: TObject);
    procedure LoadBookButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BooklistListBoxDblClick(Sender: TObject);
  private
    FViewModel: TMainViewModel;
  public
    procedure SetViewModel(const AViewModel: TMainViewModel);
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}


{ TMainFrm }


procedure TMainForm.ViewBookButtonClick(Sender: TObject);
begin
  FViewModel.ShowBookDetail;
end;

procedure TMainForm.BooklistListBoxDblClick(Sender: TObject);
begin
  FViewModel.ShowBookDetail;;
end;

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  var MainViewModel := TMainViewModel.Create;
  SetViewModel(MainViewModel);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  FViewModel.LoadBooks;
end;

procedure TMainForm.LoadBookButtonClick(Sender: TObject);
begin
  FViewModel.LoadBooks;
end;

procedure TMainForm.OnPropertyChanged(Sender: TObject);
begin
  if Self.Visible then
    BindlingList.Notify(Sender, '');
end;

procedure TMainForm.SetViewModel(const AViewModel: TMainViewModel);
begin
  FViewModel := AViewModel;

  ViewModelBindScope.DataObject := FViewModel;
  ViewModelBindScope.Active := True;
end;

end.
