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
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
begin
if Application.MessageBox('Deseja mesmo deletar esse cadastro?','Deletar cadastro', MB_ICONQUESTION+MB_YESNO) = mrYes then
    begin
      btnSalvar.Enabled := False;
      btnCancelar.Enabled := False;
      btnDeletar.Enabled := True;
      btnEditar.Enabled := True;

      DM.tbConsulta.Delete;

      gridConsulta.ReadOnly := True;
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

procedure TformAgendaCardi.FormShow(Sender: TObject);
begin
  DM.QueryCardiologista.Refresh;
  gridConsulta.Refresh;
end;

end.
