unit unitAgendaCardiologista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TformAgendaCardi = class(TForm)
    pnlHeader: TPanel;
    lblCardiologista: TLabel;
    lblAgendamento: TLabel;
    imgLogoPequena: TImage;
    gridConsulta: TDBGrid;
    edtPesquisa: TEdit;
    btnVoltar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    Label1: TLabel;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formAgendaCardi: TformAgendaCardi;

implementation

{$R *.dfm}

uses unitDM;

procedure TformAgendaCardi.btnCancelarClick(Sender: TObject);
begin
  DM.tbConsulta.Cancel;

  gridConsulta.ReadOnly := True;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;
end;

procedure TformAgendaCardi.btnDeletarClick(Sender: TObject);
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

        ID_Consulta := DM.QueryCardiologista.FieldByName('id_consulta').AsInteger;

        DM.qraux.SQL.Text := 'delete from consulta where id_consulta = :ID';
        DM.qraux.ParamByName('ID').AsInteger := ID_Consulta;
        DM.qraux.ExecSQL;
        DM.QueryCardiologista.Refresh;

      except
        on e:exception do
          showmessage('Erro ao efetuar operação: ' + e.Message);
      end;
    end;
end;

procedure TformAgendaCardi.btnEditarClick(Sender: TObject);
begin
  gridConsulta.ReadOnly := False;

  DM.tbConsulta.Edit;

  btnSalvar.Enabled := True;
  btnCancelar.Enabled := True;
  btnDeletar.Enabled := False;
  btnEditar.Enabled := False;
end;

procedure TformAgendaCardi.btnSalvarClick(Sender: TObject);
begin
  DM.tbConsulta.Post;

  gridConsulta.ReadOnly := True;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;
end;

procedure TformAgendaCardi.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TformAgendaCardi.edtPesquisaChange(Sender: TObject);
begin
  DM.QueryCardiologista.Locate('nome', edtPesquisa.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TformAgendaCardi.FormShow(Sender: TObject);
begin
  DM.QueryCardiologista.Refresh;
  gridConsulta.Refresh;

  gridConsulta.ReadOnly := True;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;
end;

end.
