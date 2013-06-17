declare
  --Cria variável com o tipo PLUTO_UTIL_OBJ (criado na instalação)
  v_util_obj pluto_util_obj :=  pluto_util_obj( output_object => pluto_output_tap_obj() );
  
  --Valores definidos para inserção
  p_matricula NUMBER := 200;
  p_nome_completo VARCHAR2(60) := 'Mestre Windu';
  p_cpf NUMBER := 1233421334;
  p_num_dependentes NUMBER := 3;
  p_plano_saude CHAR(1) := 'N'; 
  p_data_admissao DATE := sysdate;
  p_num_dependentes_erro NUMBER := 2;

begin
  --Procedure utilizada para inserir os dados na tabela t_funcionarios
  Prc_Ins_Func(p_matricula,p_nome_completo,p_cpf,p_num_dependentes,p_plano_saude,p_data_admissao);
  
  --Teste realizado para conferir o número de dependentes do funcionário
  v_util_obj.is_ok( data_got => Valida_Dependentes(p_matricula,p_num_dependentes), data_expected => true, test_label => 'Número de dependentes inválidos');
  v_util_obj.is_ok( data_got => Valida_Dependentes(p_matricula,p_num_dependentes_erro), data_expected => false, test_label => 'Número de dependentes inválidos');
  
  --Procedure utilizada para deletar os dados testados na tabela t_funcionarios
  Prc_Del_Func(p_matricula);

end;
