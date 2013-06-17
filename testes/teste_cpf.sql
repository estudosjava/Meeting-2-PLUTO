declare
  --Cria variável com o tipo PLUTO_UTIL_OBJ (criado na instalação)
  v_util_obj pluto_util_obj :=  pluto_util_obj( output_object => pluto_output_tap_obj() );
  
  --Valores definidos para inserção
  p_matricula NUMBER := 300;
  p_nome_completo VARCHAR2(60) := 'Alberto';
  p_cpf NUMBER := 12332000220;
  p_num_dependentes NUMBER := 4;
  p_plano_saude CHAR(1) := 'S'; 
  p_data_admissao DATE := sysdate-1;

begin
  --Procedure utilizada para inserir os dados na tabela t_funcionarios
  Prc_Ins_Func(p_matricula,p_nome_completo,p_cpf,p_num_dependentes,p_plano_saude,p_data_admissao);
  
  --Teste realizado para conferir o número de dígitos do CPF inserido
  v_util_obj.is_ok( data_got => length(p_cpf), data_expected => 11, test_label => 'Número de dígitos do CPF Inválido');
  
  --Procedure utilizada para deletar os dados testados na tabela t_funcionarios
  Prc_Del_Func(p_matricula);

end;
