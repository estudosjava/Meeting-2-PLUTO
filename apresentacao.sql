--Apresentação PLUTO (PLSQL Unit Testing for Oracle)
--Passo 1: Instalação
@sql/pre_installation_cleanup.sql;

@sql/core/pluto_proc_name_tab.sql;

@sql/utilities/pluto_output_obj.pks;

@sql/utilities/pluto_output_obj.pkb;

@sql/utilities/pluto_output_tap_obj.pks;

@sql/utilities/pluto_output_tap_obj.pkb;

@sql/utilities/pluto_util_obj.pks;

@sql/utilities/pluto_util_obj.pkb;

@sql/core/pluto_obj.pks;

@sql/core/pluto_obj.pkb;

--Passo 2: Grants de Acesso
  execute immediate 'GRANT UNDER ON pluto_obj TO PUBLIC';

  execute immediate 'GRANT EXECUTE ON pluto_obj TO PUBLIC';

  execute immediate 'GRANT EXECUTE ON pluto_output_obj TO PUBLIC';

  execute immediate 'GRANT EXECUTE ON pluto_output_tap_obj TO PUBLIC';

  execute immediate 'GRANT EXECUTE ON pluto_util_obj TO PUBLIC';

--Passo 3: Cenário Atual
  select * from t_funcionarios;

--Passo 4: Rotina de Testes
  teste_cpf.sql
  teste_dependentes.sql
  teste_data.sql
  
--Passo 5: Prós e Contras  
