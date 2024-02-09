unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFormPrincipal = class(TForm)
    lblHUC: TLabel;
    imgUser: TImage;
    imgLogoPequena: TImage;
    pnlHeader: TPanel;
    lblVersao: TLabel;
    pnlFooter: TPanel;
    pnlButtons: TPanel;
    pnlCentral: TPanel;
    imgLogoGrande: TImage;
    btnPacientes: TSpeedButton;
    btnSair: TSpeedButton;
    btnMedicos: TSpeedButton;
    btnConsultas: TSpeedButton;
    pnlHUC: TPanel;
    pnlImgUser: TPanel;
    pnlVersao: TPanel;
    lblNomeHeader: TLabel;
    imgUserWhite: TImage;
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
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses unitDM, unitCadPacientes, unitCadMedicos, unitCadConsultas;

procedure TFormPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormPrincipal.btnSairMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  btnSair.Font.Color := clBlack;
end;

procedure TFormPrincipal.btnSairMouseEnter(Sender: TObject);
begin
  btnSair.Font.Color := clRed;
end;

procedure TFormPrincipal.btnSairMouseLeave(Sender: TObject);
begin
  btnSair.Font.Color := clBlack;
end;

procedure TFormPrincipal.imgUserMouseEnter(Sender: TObject);
begin
  imgUser.Visible := false;
  imgUserWhite.Visible := true;
end;

procedure TFormPrincipal.imgUserMouseLeave(Sender: TObject);
begin
  imgUser.Visible := true;
  imgUserWhite.Visible := false;

end;

procedure TFormPrincipal.lblHUCMouseEnter(Sender: TObject);
begin
  lblHUC.Font.Color := clWhite;
end;

procedure TFormPrincipal.lblHUCMouseLeave(Sender: TObject);
begin
  lblHUC.Font.Color := clBlack;
end;

procedure TFormPrincipal.lblNomeHeaderMouseEnter(Sender: TObject);
begin
  lblNomeHeader.Font.Color := clWhite;
end;

procedure TFormPrincipal.lblNomeHeaderMouseLeave(Sender: TObject);
begin
  lblNomeHeader.Font.Color := clBlack;
end;

procedure TFormPrincipal.btnConsultasClick(Sender: TObject);
begin
  formCadConsultas.ShowModal;
end;

procedure TFormPrincipal.btnConsultasMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  btnConsultas.Font.Color := clBlack;
end;

procedure TFormPrincipal.btnConsultasMouseEnter(Sender: TObject);
begin
  btnConsultas.Font.Color := clWhite;
end;

procedure TFormPrincipal.btnConsultasMouseLeave(Sender: TObject);
begin
  btnConsultas.Font.Color := clBlack;
end;

procedure TFormPrincipal.btnMedicosClick(Sender: TObject);
begin
  formCadMedicos.ShowModal;
end;

procedure TFormPrincipal.btnMedicosMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  btnMedicos.Font.Color := clBlack;
end;

procedure TFormPrincipal.btnMedicosMouseEnter(Sender: TObject);
begin
  btnMedicos.Font.Color := clWhite;
end;

procedure TFormPrincipal.btnMedicosMouseLeave(Sender: TObject);
begin
  btnMedicos.Font.Color := clBlack;
end;

procedure TFormPrincipal.btnPacientesClick(Sender: TObject);
begin
  formCadPacientes.ShowModal;
end;

procedure TFormPrincipal.btnPacientesMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  btnPacientes.Font.Color := clBlack;
end;

procedure TFormPrincipal.btnPacientesMouseEnter(Sender: TObject);
begin
  btnPacientes.Font.Color := clWhite;
end;

procedure TFormPrincipal.btnPacientesMouseLeave(Sender: TObject);
begin
  btnPacientes.Font.Color := clBlack;
end;

procedure TFormPrincipal.SpeedButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
