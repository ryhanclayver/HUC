unit unitCadConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Menus, Vcl.Buttons;

type
  TformCadConsultas = class(TForm)
    pnlHeader: TPanel;
    lblConsulta: TLabel;
    imgLogoPequena: TImage;
    lblNomePaciente: TLabel;
    gridPaciente: TDBGrid;
    lblNomeMedico: TLabel;
    gridMedico: TDBGrid;
    edtData: TDBEdit;
    lblData: TLabel;
    lblValor: TLabel;
    edtValor: TDBEdit;
    menu: TMainMenu;
    MarcarConsulta1: TMenuItem;
    HistricodeConsultas1: TMenuItem;
    ComPlano1: TMenuItem;
    SemPlano1: TMenuItem;
    odas1: TMenuItem;
    Agendamentos1: TMenuItem;
    Nutricionista1: TMenuItem;
    Cardiologista1: TMenuItem;
    Pediatra1: TMenuItem;
    btnCancelar: TSpeedButton;
    btnMarcar: TSpeedButton;
    btnCadastrar: TSpeedButton;
    edtNomeMedico: TEdit;
    edtNomePaciente: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Nutricionista1Click(Sender: TObject);
    procedure Cardiologista1Click(Sender: TObject);
    procedure Pediatra1Click(Sender: TObject);
    procedure odas1Click(Sender: TObject);
    procedure ComPlano1Click(Sender: TObject);
    procedure SemPlano1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNomeMedicoChange(Sender: TObject);
    procedure edtNomePacienteChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCadConsultas: TformCadConsultas;

implementation

{$R *.dfm}

uses unitDM, unitAgendaNutricionista, unitAgendaCardiologista,
  unitAgendaPediatra, unitHistorico, unitHistoricoComPlano,
  unitHistoricoSemPlano;

procedure TformCadConsultas.btnCadastrarClick(Sender: TObject);
begin
  gridPaciente.ReadOnly := False;
  gridMedico.ReadOnly := False;

  edtNomePaciente.Enabled := True;
  edtNomeMedico.Enabled := True;
  edtData.Enabled := True;
  edtValor.Enabled := True;

  DM.tbConsulta.Insert;
end;

procedure TformCadConsultas.btnCancelarClick(Sender: TObject);
begin
  DM.tbConsulta.Cancel;
  close;
end;

procedure TformCadConsultas.btnMarcarClick(Sender: TObject);
begin
  DM.tbConsulta.FieldByName('ID_PACIENTE').AsInteger := DM.dsPaciente.DataSet.FieldByName('ID_PACIENTE').AsInteger;
  DM.tbConsulta.FieldByName('ID_MEDICO').AsInteger := DM.dsMedico.DataSet.FieldByName('ID_MEDICO').AsInteger;

  DM.tbConsulta.Post;

  Application.MessageBox('Consulta realizada com sucesso!','Cadastro de consulta', MB_ICONINFORMATION+MB_OK);

  gridPaciente.ReadOnly := True;
  gridMedico.ReadOnly := True;

  edtData.Enabled := False;
  edtValor.Enabled := False;
  edtNomePaciente.Enabled := False;
  edtNomeMedico.Enabled := False;

  DM.QueryHistorico.Refresh;
  DM.QueryCPlano.Refresh;
  DM.QuerySPlano.Refresh;
end;

procedure TformCadConsultas.Cardiologista1Click(Sender: TObject);
begin
  formAgendaCardi.ShowModal;
end;

procedure TformCadConsultas.ComPlano1Click(Sender: TObject);
begin
  formHistoricoComPlano.ShowModal;
end;

procedure TformCadConsultas.edtNomeMedicoChange(Sender: TObject);
begin
  DM.tbMedico.Locate('nome', edtNomeMedico.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TformCadConsultas.edtNomePacienteChange(Sender: TObject);
begin
  DM.tbPaciente.Locate('nome', edtNomePaciente.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TformCadConsultas.FormCreate(Sender: TObject);
begin
  gridPaciente.ReadOnly := True;
  gridMedico.ReadOnly := True;

  edtNomePaciente.Enabled := False;
  edtNomeMedico.Enabled := False;
  edtData.Enabled := False;
  edtValor.Enabled := False;
end;

procedure TformCadConsultas.FormShow(Sender: TObject);
begin
  edtValor.Clear;
  edtData.Clear;
end;

procedure TformCadConsultas.Nutricionista1Click(Sender: TObject);
begin
  formAgendaNutri.ShowModal;
end;

procedure TformCadConsultas.odas1Click(Sender: TObject);
begin
  formHistorico.ShowModal;
end;

procedure TformCadConsultas.Pediatra1Click(Sender: TObject);
begin
  formAgendaPed.ShowModal;
end;

procedure TformCadConsultas.SemPlano1Click(Sender: TObject);
begin
  formHistoricoSemPlano.ShowModal;
end;

end.
