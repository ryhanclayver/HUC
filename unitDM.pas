unit unitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    conexao: TFDConnection;
    tbMedico: TFDTable;
    tbConsulta: TFDTable;
    dsConsulta: TDataSource;
    dsMedico: TDataSource;
    tbMedicoID_MEDICO: TIntegerField;
    tbMedicoNOME: TStringField;
    tbMedicoCRM: TStringField;
    tbMedicoCPF: TStringField;
    tbMedicoNUMERO: TStringField;
    tbMedicoENDERECO: TStringField;
    tbMedicoDATANASC: TDateField;
    tbMedicoESPECIALIDADE: TStringField;
    tbMedicoRG: TStringField;
    tbMedicoGENERO: TStringField;
    tbConsultaID_CONSULTA: TIntegerField;
    tbConsultaID_MEDICO: TIntegerField;
    tbConsultaID_PACIENTE: TIntegerField;
    tbConsultaDATA: TDateField;
    tbConsultaVALOR: TCurrencyField;
    tbPaciente: TFDTable;
    dsPaciente: TDataSource;
    tbPacienteID_PACIENTE: TIntegerField;
    tbPacienteNOME: TStringField;
    tbPacienteCPF: TStringField;
    tbPacienteNUMERO: TStringField;
    tbPacienteDATANASC: TDateField;
    tbPacienteENDERECO: TStringField;
    tbPacientePLANO: TStringField;
    tbPacienteDATACAD: TDateField;
    tbPacienteRG: TStringField;
    tbPacienteGENERO: TStringField;
    QueryNutricionista: TFDQuery;
    dsNutricionista: TDataSource;
    QueryPediatra: TFDQuery;
    dsPediatra: TDataSource;
    QueryCardiologista: TFDQuery;
    dsCardiologista: TDataSource;
    QueryHistorico: TFDQuery;
    dsHistorico: TDataSource;
    QueryCPlano: TFDQuery;
    dsCPlano: TDataSource;
    QuerySPlano: TFDQuery;
    dsSPlano: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
