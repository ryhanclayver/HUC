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
    gridConsulta: TDBGrid;
    btnVoltar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnEditar: TSpeedButton;
    edtPesquisa: TEdit;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
begin
  if Application.MessageBox('Deseja mesmo deletar esse cadastro?','Deletar cadastro', MB_ICONQUESTION+MB_YESNO) = mrYes then
    begin
      btnSalvar.Enabled := False;
      btnCancelar.Enabled := False;
      btnDeletar.Enabled := True;
      btnEditar.Enabled := True;

      DM.tbConsulta.Delete;

      DM.tbConsulta.Refresh;
      gridConsulta.Refresh;
      gridConsulta.ReadOnly := True;
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

procedure TformAgendaNutri.FormCreate(Sender: TObject);
begin
  gridConsulta.ReadOnly := True;

  btnSalvar.Enabled := False;
  btnCancelar.Enabled := False;
  btnDeletar.Enabled := True;
  btnEditar.Enabled := True;
end;

procedure TformAgendaNutri.FormShow(Sender: TObject);
begin
  DM.QueryNutricionista.Refresh;
  gridConsulta.Refresh;
end;

end.
