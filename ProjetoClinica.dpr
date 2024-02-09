program ProjetoClinica;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {FormPrincipal},
  unitDM in 'unitDM.pas' {DM: TDataModule},
  unitCadPacientes in 'unitCadPacientes.pas' {FormCadPacientes},
  unitCadMedicos in 'unitCadMedicos.pas' {FormCadMedicos},
  unitCadConsultas in 'unitCadConsultas.pas' {FormCadConsultas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormCadPacientes, FormCadPacientes);
  Application.CreateForm(TFormCadMedicos, FormCadMedicos);
  Application.CreateForm(TFormCadConsultas, FormCadConsultas);
  Application.Run;
end.
