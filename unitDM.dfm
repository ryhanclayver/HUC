object DM: TDM
  OldCreateOrder = False
  Height = 461
  Width = 645
  object conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Suporte\Documents\Embarcadero\Studio\Projects\' +
        'Clinica\BD\BD.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 24
  end
  object tbMedico: TFDTable
    Active = True
    IndexFieldNames = 'ID_MEDICO'
    Connection = conexao
    UpdateOptions.UpdateTableName = 'MEDICO'
    TableName = 'MEDICO'
    Left = 24
    Top = 80
    object tbMedicoID_MEDICO: TIntegerField
      FieldName = 'ID_MEDICO'
      Origin = 'ID_MEDICO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbMedicoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object tbMedicoCRM: TStringField
      FieldName = 'CRM'
      Origin = 'CRM'
    end
    object tbMedicoCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '###.###.###-##;1;_'
      Size = 14
    end
    object tbMedicoNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      EditMask = '(##)#####-####;1;_'
      Size = 14
    end
    object tbMedicoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 255
    end
    object tbMedicoDATANASC: TDateField
      FieldName = 'DATANASC'
      Origin = 'DATANASC'
      EditMask = '##/##/####;1;_'
    end
    object tbMedicoESPECIALIDADE: TStringField
      FieldName = 'ESPECIALIDADE'
      Origin = 'ESPECIALIDADE'
    end
    object tbMedicoRG: TStringField
      FieldName = 'RG'
      Origin = 'RG'
    end
    object tbMedicoGENERO: TStringField
      FieldName = 'GENERO'
      Origin = 'GENERO'
      Size = 10
    end
  end
  object tbConsulta: TFDTable
    Active = True
    IndexFieldNames = 'ID_CONSULTA'
    Connection = conexao
    UpdateOptions.UpdateTableName = 'CONSULTA'
    TableName = 'CONSULTA'
    Left = 168
    Top = 80
    object tbConsultaID_CONSULTA: TIntegerField
      FieldName = 'ID_CONSULTA'
      Origin = 'ID_CONSULTA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbConsultaID_MEDICO: TIntegerField
      FieldName = 'ID_MEDICO'
      Origin = 'ID_MEDICO'
    end
    object tbConsultaID_PACIENTE: TIntegerField
      FieldName = 'ID_PACIENTE'
      Origin = 'ID_PACIENTE'
    end
    object tbConsultaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      EditMask = '##/##/####;1;_'
    end
    object tbConsultaVALOR: TCurrencyField
      FieldName = 'VALOR'
      Origin = 'VALOR'
    end
  end
  object dsConsulta: TDataSource
    DataSet = tbConsulta
    Left = 168
    Top = 144
  end
  object dsMedico: TDataSource
    DataSet = tbMedico
    Left = 24
    Top = 144
  end
  object tbPaciente: TFDTable
    Active = True
    IndexFieldNames = 'ID_PACIENTE'
    Connection = conexao
    UpdateOptions.UpdateTableName = 'PACIENTE'
    TableName = 'PACIENTE'
    Left = 96
    Top = 80
    object tbPacienteID_PACIENTE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PACIENTE'
      Origin = 'ID_PACIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object tbPacienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object tbPacienteCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      EditMask = '###.###.###-##;1;_'
      Size = 14
    end
    object tbPacienteNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      EditMask = '(##)#####-####;1;_'
      Size = 14
    end
    object tbPacienteDATANASC: TDateField
      FieldName = 'DATANASC'
      Origin = 'DATANASC'
      EditMask = '##/##/####;1;_'
    end
    object tbPacienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 255
    end
    object tbPacientePLANO: TStringField
      FieldName = 'PLANO'
      Origin = 'PLANO'
      Size = 3
    end
    object tbPacienteDATACAD: TDateField
      FieldName = 'DATACAD'
      Origin = 'DATACAD'
    end
    object tbPacienteRG: TStringField
      FieldName = 'RG'
      Origin = 'RG'
    end
    object tbPacienteGENERO: TStringField
      FieldName = 'GENERO'
      Origin = 'GENERO'
      Size = 10
    end
  end
  object dsPaciente: TDataSource
    DataSet = tbPaciente
    Left = 96
    Top = 144
  end
  object QueryNutricionista: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      
        'select consulta.id_consulta,consulta.data, consulta.valor, pacie' +
        'nte.nome from consulta'
      'inner join medico on consulta.id_medico = medico.id_medico'
      
        'inner join paciente on consulta.id_paciente = paciente.id_pacien' +
        'te'
      'where medico.especialidade = '#39'Nutricionista'#39' AND'
      'consulta.data >= CURRENT_DATE'
      'order by consulta.data desc')
    Left = 576
    Top = 80
  end
  object dsNutricionista: TDataSource
    DataSet = QueryNutricionista
    Left = 576
    Top = 136
  end
  object QueryPediatra: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      
        'select consulta.id_consulta,consulta.data, consulta.valor, pacie' +
        'nte.nome from consulta'
      'inner join medico on consulta.id_medico = medico.id_medico'
      
        'inner join paciente on consulta.id_paciente = paciente.id_pacien' +
        'te'
      'where medico.especialidade = '#39'Pediatra'#39' AND'
      'consulta.data >= CURRENT_DATE'
      'order by consulta.data desc ')
    Left = 480
    Top = 80
  end
  object dsPediatra: TDataSource
    DataSet = QueryPediatra
    Left = 480
    Top = 136
  end
  object QueryCardiologista: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      
        'select consulta.id_consulta,consulta.data, consulta.valor, pacie' +
        'nte.nome from consulta'
      'inner join medico on consulta.id_medico = medico.id_medico'
      
        'inner join paciente on consulta.id_paciente = paciente.id_pacien' +
        'te'
      'where medico.especialidade = '#39'Cardiologista'#39' AND'
      'consulta.data >= CURRENT_DATE'
      'order by consulta.data desc; ')
    Left = 392
    Top = 80
  end
  object dsCardiologista: TDataSource
    DataSet = QueryCardiologista
    Left = 392
    Top = 136
  end
  object QueryHistorico: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      
        'select consulta.id_consulta, consulta.data, consulta.valor, paci' +
        'ente.nome from consulta'
      'inner join medico on consulta.id_medico = medico.id_medico'
      
        'inner join paciente on consulta.id_paciente = paciente.id_pacien' +
        'te'
      'where consulta.data < CURRENT_DATE'
      'order by data desc; ')
    Left = 24
    Top = 288
  end
  object dsHistorico: TDataSource
    DataSet = QueryHistorico
    Left = 24
    Top = 344
  end
  object QueryCPlano: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      
        'select consulta.id_consulta, consulta.data, consulta.valor, paci' +
        'ente.nome from consulta'
      'inner join medico on consulta.id_medico = medico.id_medico'
      
        'inner join paciente on consulta.id_paciente = paciente.id_pacien' +
        'te'
      'where consulta.data < CURRENT_DATE AND'
      'paciente.plano = '#39'Sim'#39
      'order by data desc;')
    Left = 104
    Top = 288
  end
  object dsCPlano: TDataSource
    DataSet = QueryCPlano
    Left = 104
    Top = 344
  end
  object QuerySPlano: TFDQuery
    Active = True
    Connection = conexao
    SQL.Strings = (
      
        'select consulta.id_consulta, consulta.data, consulta.valor, paci' +
        'ente.nome from consulta'
      'inner join medico on consulta.id_medico = medico.id_medico'
      
        'inner join paciente on consulta.id_paciente = paciente.id_pacien' +
        'te'
      'where consulta.data < CURRENT_DATE AND'
      'paciente.plano = '#39'N'#227'o'#39
      'order by data desc;')
    Left = 184
    Top = 288
  end
  object dsSPlano: TDataSource
    DataSet = QuerySPlano
    Left = 184
    Top = 344
  end
  object qraux: TFDQuery
    Connection = conexao
    Left = 104
    Top = 240
  end
end
