unit unitCadMedicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons;

type
  TFormCadMedicos = class(TForm)
    pnlHeader: TPanel;
    lblCadastroMedico: TLabel;
    imgLogoPequena: TImage;
    lblNome: TLabel;
    lblCPF: TLabel;
    lblCelular: TLabel;
    lblNascimento: TLabel;
    lblRG: TLabel;
    lblCRM: TLabel;
    lblEspecialidade: TLabel;
    lblGenero: TLabel;
    lblEndereco: TLabel;
    gridMedico: TDBGrid;
    edtNomeSearch: TDBEdit;
    edtCPF: TDBEdit;
    edtCelular: TDBEdit;
    edtRG: TDBEdit;
    edtCRM: TDBEdit;
    edtEndereco: TDBEdit;
    comboGenero: TDBComboBox;
    comboEspecialidade: TDBComboBox;
    edtNome: TDBEdit;
    btnSalvar: TSpeedButton;
    edtNascimento: TDBEdit;
    btnVoltar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnCadastrar: TSpeedButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadMedicos: TFormCadMedicos;

implementation

{$R *.dfm}

uses unitDM;

procedure TFormCadMedicos.btnCadastrarClick(Sender: TObject);
begin
  btnCadastrar.Enabled := False;
  btnDeletar.Enabled := False;
  btnEditar.Enabled := False;
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;

  edtNome.Enabled := True;
  edtCPF.Enabled := True;
  edtCelular.Enabled := True;
  edtRG.Enabled := True;
  comboGenero.Enabled := True;
  edtNascimento.Enabled := True;
  edtEndereco.Enabled := True;
  comboEspecialidade.Enabled := True;
  edtCRM.Enabled := True;

  edtNome.SetFocus;

  DM.tbMedico.Insert;
end;

procedure TFormCadMedicos.btnCancelarClick(Sender: TObject);
begin
  ActiveControl := nil;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnCadastrar.Enabled := True;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;

  edtNome.Enabled := False;
  edtCPF.Enabled := False;
  edtCelular.Enabled := False;
  edtRG.Enabled := False;
  comboGenero.Enabled := False;
  edtNascimento.Enabled := False;
  edtEndereco.Enabled := False;
  comboEspecialidade.Enabled := False;
  edtCRM.Enabled := False;

  DM.tbMedico.Cancel;
end;

procedure TFormCadMedicos.btnDeletarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja mesmo deletar esse cadastro?','Deletar cadastro', MB_ICONQUESTION+MB_YESNO) = mrYes then
    begin
      btnSalvar.Enabled := False;
      btnCancelar.Enabled := False;
      btnCadastrar.Enabled := True;
      btnDeletar.Enabled := True;
      btnEditar.Enabled := True;

      DM.tbMedico.Delete;

      edtNome.Enabled := False;
      edtCPF.Enabled := False;
      edtCelular.Enabled := False;
      edtRG.Enabled := False;
      comboGenero.Enabled := False;
      edtNascimento.Enabled := False;
      edtEndereco.Enabled := False;
      comboEspecialidade.Enabled := False;
      edtCRM.Enabled := False;
    end;
end;

procedure TFormCadMedicos.btnEditarClick(Sender: TObject);
begin
  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;
  btnCadastrar.Enabled := False;
  btnDeletar.Enabled := False;

  DM.tbMedico.Edit;

  edtNome.Enabled := True;
  edtCPF.Enabled := True;
  edtCelular.Enabled := True;
  edtRG.Enabled := True;
  comboGenero.Enabled := True;
  edtNascimento.Enabled := True;
  edtEndereco.Enabled := True;
  comboEspecialidade.Enabled := True;
  edtCRM.Enabled := True;
end;

procedure TFormCadMedicos.btnSalvarClick(Sender: TObject);
begin
  ActiveControl := nil;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnCadastrar.Enabled := True;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;

  DM.tbMedico.Post;

  DM.tbMedico.Last;

  edtNome.Enabled := False;
  edtCPF.Enabled := False;
  edtCelular.Enabled := False;
  edtRG.Enabled := False;
  comboGenero.Enabled := False;
  edtNascimento.Enabled := False;
  edtEndereco.Enabled := False;
  comboEspecialidade.Enabled := False;
  edtCRM.Enabled := False;
end;

procedure TFormCadMedicos.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadMedicos.FormCreate(Sender: TObject);
begin
  btnCancelar.Enabled := False;
  btnSalvar.Enabled := False;

  edtNome.Enabled := False;
  edtCPF.Enabled := False;
  edtCelular.Enabled := False;
  edtRG.Enabled := False;
  comboGenero.Enabled := False;
  edtNascimento.Enabled := False;
  edtEndereco.Enabled := False;
  comboEspecialidade.Enabled := False;
  edtCRM.Enabled := False;
end;

end.
