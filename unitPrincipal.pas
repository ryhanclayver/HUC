unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TformPrincipal = class(TForm)
    lblHUC: TLabel;
    imgUser: TImage;
    imgLogoPequena: TImage;
    pnlHeader: TPanel;
    lblVersao: TLabel;
    pnlFooter: TPanel;
    pnlButtons: TPanel;
    pnlCentral: TPanel;
    btnPacientes: TSpeedButton;
    btnSair: TSpeedButton;
    btnMedicos: TSpeedButton;
    btnConsultas: TSpeedButton;
    pnlHUC: TPanel;
    pnlImgUser: TPanel;
    pnlVersao: TPanel;
    lblNomeHeader: TLabel;
    imgUserWhite: TImage;
    imgLogoGrande: TImage;
    procedure btnSairClick(Sender: TObject);
    procedure btnPacientesClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnMedicosClick(Sender: TObject);
    procedure btnConsultasClick(Sender: TObject);
    procedure btnPacientesMouseEnter(Sender: TObject);
    procedure btnPacientesMouseLeave(Sender: TObject);
    procedure btnMedicosMouseEnter(Sender: TObject);
    procedure btnMedicosMouseLeave(Sender: TObject);
    procedure btnConsultasMouseLeave(Sender: TObject);
    procedure btnConsultasMouseEnter(Sender: TObject);
    procedure btnSairMouseEnter(Sender: TObject);
    procedure btnSairMouseLeave(Sender: TObject);
    procedure lblHUCMouseEnter(Sender: TObject);
    procedure lblHUCMouseLeave(Sender: TObject);
    procedure lblNomeHeaderMouseEnter(Sender: TObject);
    procedure lblNomeHeaderMouseLeave(Sender: TObject);
    procedure imgUserMouseEnter(Sender: TObject);
    procedure imgUserMouseLeave(Sender: TObject);
    procedure btnPacientesMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure btnMedicosMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure btnConsultasMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure btnSairMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses unitDM, unitCadPacientes, unitCadMedicos, unitCadConsultas;

procedure TformPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TformPrincipal.btnSairMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  btnSair.Font.Color := clBlack;
end;

procedure TformPrincipal.btnSairMouseEnter(Sender: TObject);
begin
  btnSair.Font.Color := clRed;
end;

procedure TformPrincipal.btnSairMouseLeave(Sender: TObject);
begin
  btnSair.Font.Color := clBlack;
end;

procedure TformPrincipal.imgUserMouseEnter(Sender: TObject);
begin
  imgUser.Visible := false;
  imgUserWhite.Visible := true;
end;

procedure TformPrincipal.imgUserMouseLeave(Sender: TObject);
begin
  imgUser.Visible := true;
  imgUserWhite.Visible := false;

end;

procedure TformPrincipal.lblHUCMouseEnter(Sender: TObject);
begin
  lblHUC.Font.Color := clWhite;
end;

procedure TformPrincipal.lblHUCMouseLeave(Sender: TObject);
begin
  lblHUC.Font.Color := clBlack;
end;

procedure TformPrincipal.lblNomeHeaderMouseEnter(Sender: TObject);
begin
  lblNomeHeader.Font.Color := clWhite;
end;

procedure TformPrincipal.lblNomeHeaderMouseLeave(Sender: TObject);
begin
  lblNomeHeader.Font.Color := clBlack;
end;

procedure TformPrincipal.btnConsultasClick(Sender: TObject);
begin
  formCadConsultas.ShowModal;
end;

procedure TformPrincipal.btnConsultasMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  btnConsultas.Font.Color := clBlack;
end;

procedure TformPrincipal.btnConsultasMouseEnter(Sender: TObject);
begin
  btnConsultas.Font.Color := clWhite;
end;

procedure TformPrincipal.btnConsultasMouseLeave(Sender: TObject);
begin
  btnConsultas.Font.Color := clBlack;
end;

procedure TformPrincipal.btnMedicosClick(Sender: TObject);
begin
  formCadMedicos.ShowModal;
end;

procedure TformPrincipal.btnMedicosMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  btnMedicos.Font.Color := clBlack;
end;

procedure TformPrincipal.btnMedicosMouseEnter(Sender: TObject);
begin
  btnMedicos.Font.Color := clWhite;
end;

procedure TformPrincipal.btnMedicosMouseLeave(Sender: TObject);
begin
  btnMedicos.Font.Color := clBlack;
end;

procedure TformPrincipal.btnPacientesClick(Sender: TObject);
begin
  formCadPacientes.ShowModal;
end;

procedure TformPrincipal.btnPacientesMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  btnPacientes.Font.Color := clBlack;
end;

procedure TformPrincipal.btnPacientesMouseEnter(Sender: TObject);
begin
  btnPacientes.Font.Color := clWhite;
end;

procedure TformPrincipal.btnPacientesMouseLeave(Sender: TObject);
begin
  btnPacientes.Font.Color := clBlack;
end;

procedure TformPrincipal.SpeedButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
