program ProjetoClinica;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {FormPrincipal},
  unitDM in 'unitDM.pas' {DM: TDataModule},
  unitCadMedicos in 'unitCadMedicos.pas' {FormCadMedicos},
  unitCadConsultas in 'unitCadConsultas.pas' {FormCadConsultas},
  unitCadPacientes in 'unitCadPacientes.pas' {formCadPacientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormCadMedicos, FormCadMedicos);
  Application.CreateForm(TFormCadConsultas, FormCadConsultas);
  Application.CreateForm(TformCadPacientes, formCadPacientes);
  Application.Run;
end.
