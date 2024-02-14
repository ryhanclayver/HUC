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
      Required = True
      Size = 100
    end
    object tbMedicoCRM: TStringField
      FieldName = 'CRM'
      Origin = 'CRM'
      Required = True
    end
    object tbMedicoCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
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
      Required = True
      EditMask = '##/##/####;1;_'
    end
    object tbMedicoESPECIALIDADE: TStringField
      FieldName = 'ESPECIALIDADE'
      Origin = 'ESPECIALIDADE'
      Required = True
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
      Required = True
    end
    object tbConsultaID_MEDICO: TIntegerField
      FieldName = 'ID_MEDICO'
      Origin = 'ID_MEDICO'
      Required = True
    end
    object tbConsultaID_PACIENTE: TIntegerField
      FieldName = 'ID_PACIENTE'
      Origin = 'ID_PACIENTE'
      Required = True
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
end
