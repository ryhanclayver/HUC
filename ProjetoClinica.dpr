program ProjetoClinica;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {formPrincipal},
  unitDM in 'unitDM.pas' {DM: TDataModule},
  unitCadMedicos in 'unitCadMedicos.pas' {formCadMedicos},
  unitCadConsultas in 'unitCadConsultas.pas' {formCadConsultas},
  unitCadPacientes in 'unitCadPacientes.pas' {formCadPacientes},
  unitAgendaNutricionista in 'unitAgendaNutricionista.pas' {formAgendaNutri},
  unitAgendaCardiologista in 'unitAgendaCardiologista.pas' {formAgendaCardi},
  unitAgendaPediatra in 'unitAgendaPediatra.pas' {formAgendaPed},
  unitHistorico in 'unitHistorico.pas' {formHistorico},
  unitHistoricoComPlano in 'unitHistoricoComPlano.pas' {formHistoricoComPlano},
  unitHistoricoSemPlano in 'unitHistoricoSemPlano.pas' {formHistoricoSemPlano};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TformCadMedicos, formCadMedicos);
  Application.CreateForm(TformCadConsultas, formCadConsultas);
  Application.CreateForm(TformCadPacientes, formCadPacientes);
  Application.CreateForm(TformAgendaNutri, formAgendaNutri);
  Application.CreateForm(TformAgendaCardi, formAgendaCardi);
  Application.CreateForm(TformAgendaPed, formAgendaPed);
  Application.CreateForm(TformHistorico, formHistorico);
  Application.CreateForm(TformHistoricoComPlano, formHistoricoComPlano);
  Application.CreateForm(TformHistoricoSemPlano, formHistoricoSemPlano);
  Application.Run;
end.
