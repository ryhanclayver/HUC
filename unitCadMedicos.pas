unit unitCadMedicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids;

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
    btnBuscar: TButton;
    edtCPF: TDBEdit;
    edtCelular: TDBEdit;
    edtRG: TDBEdit;
    edtCRM: TDBEdit;
    edtEndereco: TDBEdit;
    comboGenero: TDBComboBox;
    comboEspecialidade: TDBComboBox;
    btnGravar: TButton;
    btnCancelar: TButton;
    Label9: TLabel;
    edtNome: TDBEdit;
    procedure btnCancelarClick(Sender: TObject);
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

procedure TFormCadMedicos.btnCancelarClick(Sender: TObject);
begin
  close;
end;

end.
