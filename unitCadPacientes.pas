unit unitCadPacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.ComCtrls;

type
  TformCadPacientes = class(TForm)
    lblNomePaciente: TLabel;
    lblCPF: TLabel;
    lblCelular: TLabel;
    lblNascimento: TLabel;
    lblRG: TLabel;
    lblGenero: TLabel;
    lblEndereco: TLabel;
    btnVoltar: TSpeedButton;
    btnSalvar: TSpeedButton;
    pnlHeader: TPanel;
    lblCadastroPacientes: TLabel;
    Image1: TImage;
    gridPaciente: TDBGrid;
    edtBusca: TDBEdit;
    edtNomePaciente: TDBEdit;
    edtCPF: TDBEdit;
    edtCelular: TDBEdit;
    edtRG: TDBEdit;
    edtEndereco: TDBEdit;
    comboGenero: TDBComboBox;
    radioPlano: TDBRadioGroup;
    btnCadastrar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    dateNascimento: TDBEdit;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadPacientes: TformCadPacientes;

implementation

{$R *.dfm}

uses unitDM;

procedure TformCadPacientes.btnCadastrarClick(Sender: TObject);
begin
  edtNomePaciente.SetFocus;

  btnCadastrar.Enabled := False;
  btnDeletar.Enabled := False;
  btnEditar.Enabled := False;
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;

  edtNomePaciente.Enabled := True;
  edtCPF.Enabled := True;
  edtCelular.Enabled := True;
  edtRG.Enabled := True;
  radioPlano.Enabled := True;
  comboGenero.Enabled := True;
  dateNascimento.Enabled := True;
  edtEndereco.Enabled := True;

  DM.tbPaciente.Insert;
end;

procedure TformCadPacientes.btnVoltarClick(Sender: TObject);
  begin
    close;
  end;

procedure TformCadPacientes.FormCreate(Sender: TObject);
begin
  btnCancelar.Enabled := False;
  btnSalvar.Enabled := False;

  edtNomePaciente.Enabled := False;
  edtCPF.Enabled := False;
  edtCelular.Enabled := False;
  edtRG.Enabled := False;
  radioPlano.Enabled := False;
  comboGenero.Enabled := False;
  dateNascimento.Enabled := False;
  edtEndereco.Enabled := False;
end;

procedure TformCadPacientes.btnCancelarClick(Sender: TObject);
begin
  ActiveControl := nil;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnCadastrar.Enabled := True;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;

  edtNomePaciente.Enabled := False;
  edtCPF.Enabled := False;
  edtCelular.Enabled := False;
  edtRG.Enabled := False;
  radioPlano.Enabled := False;
  comboGenero.Enabled := False;
  dateNascimento.Enabled := False;
  edtEndereco.Enabled := False;

  DM.tbPaciente.Cancel;
end;

procedure TformCadPacientes.btnDeletarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja mesmo deletar esse cadastro?','Deletar cadastro', MB_ICONQUESTION+MB_YESNO) = mrYes then
    begin
      btnSalvar.Enabled := False;
      btnCancelar.Enabled := False;
      btnCadastrar.Enabled := True;
      btnDeletar.Enabled := True;
      btnEditar.Enabled := True;

      edtNomePaciente.Enabled := False;
      edtCPF.Enabled := False;
      edtCelular.Enabled := False;
      edtRG.Enabled := False;
      radioPlano.Enabled := False;
      comboGenero.Enabled := False;
      dateNascimento.Enabled := False;
      edtEndereco.Enabled := False;

      DM.tbPaciente.Delete;
    end;

end;

procedure TformCadPacientes.btnEditarClick(Sender: TObject);
begin
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;
  btnCadastrar.Enabled := False;
  btnDeletar.Enabled := False;

  edtNomePaciente.Enabled := True;
  edtCPF.Enabled := True;
  edtCelular.Enabled := True;
  edtRG.Enabled := True;
  radioPlano.Enabled := True;
  comboGenero.Enabled := True;
  dateNascimento.Enabled := True;
  edtEndereco.Enabled := True;

  DM.tbPaciente.Edit;
end;

procedure TformCadPacientes.btnSalvarClick(Sender: TObject);
begin
  ActiveControl := nil;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnCadastrar.Enabled := True;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;

  DM.tbPaciente.FieldByName('DataCad').Value := Now;

  ActiveControl := nil;

  DM.tbPaciente.Post;

  DM.tbPaciente.Last;

  edtNomePaciente.Enabled := False;
  edtCPF.Enabled := False;
  edtCelular.Enabled := False;
  edtRG.Enabled := False;
  radioPlano.Enabled := False;
  comboGenero.Enabled := False;
  dateNascimento.Enabled := False;
  edtEndereco.Enabled := False;

end;

end.
