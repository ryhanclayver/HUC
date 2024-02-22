unit unitHistoricoSemPlano;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TformHistoricoSemPlano = class(TForm)
    pnlHeader: TPanel;
    lblCardiologista: TLabel;
    lblAgendamento: TLabel;
    imgLogoPequena: TImage;
    btnDeletar: TSpeedButton;
    btnVoltar: TSpeedButton;
    gridConsulta: TDBGrid;
    edtPesquisa: TEdit;
    Label1: TLabel;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formHistoricoSemPlano: TformHistoricoSemPlano;

implementation

{$R *.dfm}

uses unitDM;

procedure TformHistoricoSemPlano.btnDeletarClick(Sender: TObject);
var
  ID_Consulta : Integer;
begin
  if Application.MessageBox('Deseja mesmo deletar essa consulta?','Deletar consulta', MB_ICONQUESTION+MB_YESNO) = mrYes then
    begin
      try
        ID_Consulta := DM.QuerySPlano.FieldByName('id_consulta').AsInteger;

        DM.qraux.SQL.Text := 'delete from consulta where id_consulta = :ID';
        DM.qraux.ParamByName('ID').AsInteger := ID_Consulta;
        DM.qraux.ExecSQL;
        DM.QuerySPlano.Refresh;

      except
        on e:exception do
          showmessage('Erro ao efetuar operação: ' + e.Message);
      end;
    end;
end;

procedure TformHistoricoSemPlano.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TformHistoricoSemPlano.edtPesquisaChange(Sender: TObject);
begin
  DM.QuerySPlano.Locate('nome', edtPesquisa.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TformHistoricoSemPlano.FormShow(Sender: TObject);
begin
  DM.QuerySPlano.Refresh;
  gridConsulta.ReadOnly := True;
end;

end.
