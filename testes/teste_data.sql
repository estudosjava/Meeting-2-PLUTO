declare
  --Cria vari�vel com o tipo PLUTO_UTIL_OBJ (criado na instala��o)
  v_util_obj pluto_util_obj :=  pluto_util_obj( output_object => pluto_output_tap_obj() );
  
  --Valores definidos para inser��o
  p_matricula NUMBER := 200;
  p_nome_completo VARCHAR2(60) := 'Mestre Windu';
  p_cpf NUMBER := 1233421334;
  p_num_dependentes NUMBER := 3;
  p_plano_saude CHAR(1) := 'N'; 
  p_data_admissao DATE := sysdate;
  p_data_admissao_erro DATE := sysdate-30;

begin
  --Procedure utilizada para inserir os dados na tabela t_funcionarios
  Prc_Ins_Func(p_matricula,p_nome_completo,p_cpf,p_num_dependentes,p_plano_saude,p_data_admissao);
  
  --Teste realizado para conferir o n�mero de dependentes do funcion�rio
  v_util_obj.is_ok( data_got => Valida_Data(p_matricula,p_data_admissao), data_expected => true, test_label => 'Data de Admiss�o Inv�lida');
  v_util_obj.is_ok( data_got => Valida_Data(p_matricula,p_data_admissao_erro), data_expected => false, test_label => 'Data de Admiss�o Inv�lida');
  
  --Procedure utilizada para deletar os dados testados na tabela t_funcionarios
  Prc_Del_Func(p_matricula);

end;
