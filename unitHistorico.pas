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
    procedure btnVoltarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
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
begin
  DM.tbConsulta.Delete;
end;

procedure TformHistorico.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TformHistorico.FormShow(Sender: TObject);
begin
  DM.tbConsulta.Refresh;
  gridConsulta.Refresh;
end;

end.
