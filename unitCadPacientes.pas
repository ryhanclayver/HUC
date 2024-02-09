unit unitCadPacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TFormCadPacientes = class(TForm)
    lblNomePaciente: TLabel;
    lblCPF: TLabel;
    lblCelular: TLabel;
    lblNascimento: TLabel;
    lblRG: TLabel;
    lblGenero: TLabel;
    pnlHeader: TPanel;
    lblCadastroPacientes: TLabel;
    Image1: TImage;
    dateNascimento: TDateTimePicker;
    checkPlano: TCheckBox;
    gridPaciente: TDBGrid;
    edtBusca: TDBEdit;
    lblEndereco: TLabel;
    edtNomePaciente: TDBEdit;
    edtCPF: TDBEdit;
    edtCelular: TDBEdit;
    edtRG: TDBEdit;
    edtEndereco: TDBEdit;
    comboGenero: TDBComboBox;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtBuscaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadPacientes: TFormCadPacientes;

implementation

{$R *.dfm}

uses unitDM;

procedure TFormCadPacientes.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFormCadPacientes.edtBuscaChange(Sender: TObject);
begin
  DM.tbPaciente.Locate('nome', edtBusca.Text, [loPartialKey])
end;

end.
