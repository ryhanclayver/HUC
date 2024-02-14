unit unitCadConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Menus, Vcl.Buttons;

type
  TFormCadConsultas = class(TForm)
    pnlHeader: TPanel;
    lblConsulta: TLabel;
    imgLogoPequena: TImage;
    lblNomePaciente: TLabel;
    gridPaciente: TDBGrid;
    lblNomeMedico: TLabel;
    gridMedico: TDBGrid;
    edtNomeMedico: TDBEdit;
    edtNomePaciente: TDBEdit;
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
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadConsultas: TFormCadConsultas;

implementation

{$R *.dfm}

uses unitDM;

procedure TFormCadConsultas.btnCancelarClick(Sender: TObject);
begin
  close;
end;

end.
