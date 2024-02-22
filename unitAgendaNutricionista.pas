unit unitAgendaNutricionista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TformAgendaNutri = class(TForm)
    pnlHeader: TPanel;
    lblNutricionista: TLabel;
    lblAgendamento: TLabel;
    imgLogoPequena: TImage;
    btnVoltar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    edtPesquisa: TEdit;
    Label1: TLabel;
    gridConsulta: TDBGrid;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formAgendaNutri: TformAgendaNutri;

implementation

{$R *.dfm}

uses unitDM;

procedure TformAgendaNutri.btnCancelarClick(Sender: TObject);
begin
  DM.tbConsulta.Cancel;

  gridConsulta.ReadOnly := True;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;
end;

procedure TformAgendaNutri.btnDeletarClick(Sender: TObject);
var
  ID_Consulta : Integer;
begin
    if Application.MessageBox('Deseja mesmo deletar essa consulta?','Deletar consulta', MB_ICONQUESTION+MB_YESNO) = mrYes then
    begin
      try
        btnSalvar.Enabled := False;
        btnCancelar.Enabled := False;
        btnDeletar.Enabled := True;
        btnEditar.Enabled := True;

        gridConsulta.ReadOnly := True;

        ID_Consulta := DM.QueryNutricionista.FieldByName('id_consulta').AsInteger;

        DM.qraux.SQL.Text := 'delete from consulta where id_consulta = :ID';
        DM.qraux.ParamByName('ID').AsInteger := ID_Consulta;
        DM.qraux.ExecSQL;
        DM.QueryNutricionista.Refresh;

      except
        on e:exception do
          showmessage('Erro ao efetuar operação: ' + e.Message);
      end;
    end;
end;
procedure TformAgendaNutri.btnEditarClick(Sender: TObject);
begin
  gridConsulta.ReadOnly := False;

  DM.tbConsulta.Edit;

  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;
  btnDeletar.Enabled := False;
  btnEditar.Enabled := False;
end;

procedure TformAgendaNutri.btnSalvarClick(Sender: TObject);
begin
  DM.tbConsulta.Post;

  gridConsulta.ReadOnly := True;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;
end;

procedure TformAgendaNutri.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TformAgendaNutri.edtPesquisaChange(Sender: TObject);
begin
  DM.QueryNutricionista.Locate('nome', edtPesquisa.Text, [loPartialKey, loCaseInsensitive]);
end;


procedure TformAgendaNutri.FormShow(Sender: TObject);
begin
  DM.QueryNutricionista.Refresh;
  gridConsulta.Refresh;

  gridConsulta.ReadOnly := True;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;
end;

end.
