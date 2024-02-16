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
    procedure btnVoltarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
begin
    if Application.MessageBox('Deseja mesmo deletar esse cadastro?','Deletar cadastro', MB_ICONQUESTION+MB_YESNO) = mrYes then
    begin
      DM.tbConsulta.Delete;

      DM.tbConsulta.Refresh;
      gridConsulta.Refresh;
    end;
end;

procedure TformHistoricoSemPlano.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TformHistoricoSemPlano.FormShow(Sender: TObject);
begin
  DM.tbConsulta.Refresh;
  gridConsulta.Refresh;
end;

end.
