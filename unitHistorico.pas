unit unitHistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TformHistorico = class(TForm)
    pnlHeader: TPanel;
    lblCardiologista: TLabel;
    lblAgendamento: TLabel;
    imgLogoPequena: TImage;
    gridConsulta: TDBGrid;
    edtPesquisa: TEdit;
    btnDeletar: TSpeedButton;
    btnVoltar: TSpeedButton;
    lblPesquisa: TLabel;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formHistorico: TformHistorico;

implementation

{$R *.dfm}

uses unitDM;

procedure TformHistorico.btnDeletarClick(Sender: TObject);
var
  ID_Consulta : Integer;
begin
    if Application.MessageBox('Deseja mesmo deletar essa consulta?','Deletar consulta', MB_ICONQUESTION+MB_YESNO) = mrYes then
    begin
      try
        ID_Consulta := DM.QueryHistorico.FieldByName('id_consulta').AsInteger;

        DM.qraux.SQL.Text := 'delete from consulta where id_consulta = :ID';
        DM.qraux.ParamByName('ID').AsInteger := ID_Consulta;
        DM.qraux.ExecSQL;
        DM.QueryHistorico.Refresh;

      except
        on e:exception do
          showmessage('Erro ao efetuar operação: ' + e.Message);
      end;
    end;
end;

procedure TformHistorico.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TformHistorico.edtPesquisaChange(Sender: TObject);
begin
  DM.QueryHistorico.Locate('nome', edtPesquisa.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TformHistorico.FormShow(Sender: TObject);
begin
  DM.QueryHistorico.Refresh;

  gridConsulta.ReadOnly := True;
end;

end.
