-- Criação de um Package
CREATE OR REPLACE PACKAGE data_load_pkg IS

  PROCEDURE load_dim_cliente(
      p_surrogate_cliente IN DIMENSAO_CLIENTE.surrogate_cliente%TYPE,
      p_nome_cliente IN DIMENSAO_CLIENTE.nome_cliente%TYPE,
      p_sexo_cliente IN DIMENSAO_CLIENTE.sexo_cliente%TYPE,
      p_idade_cliente IN DIMENSAO_CLIENTE.idade_cliente%TYPE
  );

  PROCEDURE load_dim_data(
      p_surrogate_data IN DIMENSAO_DATA.surrogate_data%TYPE,
      p_dia IN DIMENSAO_DATA.dia%TYPE,
      p_mes IN DIMENSAO_DATA.mes%TYPE,
      p_ano IN DIMENSAO_DATA.ano%TYPE
  );

  PROCEDURE load_dim_local(
      p_surrogate_loja IN DIMENSAO_LOCAL.surrogate_loja%TYPE,
      p_nome_loja IN DIMENSAO_LOCAL.nome_loja%TYPE,
      p_codigo_loja IN DIMENSAO_LOCAL.codigo_loja%TYPE,
      p_bairro_loja IN DIMENSAO_LOCAL.bairro_loja%TYPE,
      p_cidade_loja IN DIMENSAO_LOCAL.cidade_loja%TYPE,
      p_estado_loja IN DIMENSAO_LOCAL.estado_loja%TYPE
  );

  PROCEDURE load_dim_produto(
      p_surrogate_produto IN DIMENSAO_PRODUTO.surrogate_produto%TYPE,
      p_codigo_produto IN DIMENSAO_PRODUTO.codigo_produto%TYPE,
      p_nome_produto IN VARCHAR2,
      p_nome_fabricante IN DIMENSAO_PRODUTO.nome_fabricante%TYPE,
      p_tipo_produto IN DIMENSAO_PRODUTO.tipo_produto%TYPE,
      p_genero_produto IN DIMENSAO_PRODUTO.genero_produto%TYPE
  );

  PROCEDURE load_dim_vendedor(
      p_surrogate_vendedor IN DIMENSAO_VENDEDOR.surrogate_vendedor%TYPE,
      p_codigo_vendedor IN DIMENSAO_VENDEDOR.codigo_vendedor%TYPE,
      p_nome_vendedor IN DIMENSAO_VENDEDOR.nome_vendedor%TYPE,
      p_codigo_gerente IN DIMENSAO_VENDEDOR.codigo_gerente%TYPE,
      p_nome_gerente IN DIMENSAO_VENDEDOR.nome_gerente%TYPE
  );

  PROCEDURE load_fato_venda(
      p_dim_local_surrogate_loja IN FATO_VENDA.DIMENSAO_LOCAL_surrogate_loja%TYPE,
      p_dim_produto_surrogate_produto IN FATO_VENDA.DIMENSAO_PRODUTO_surrogate_produto%TYPE,
      p_dim_data_surrogate_data IN FATO_VENDA.DIMENSAO_DATA_surrogate_data%TYPE,
      p_dim_cliente_surrogate_cliente IN FATO_VENDA.DIMENSAO_CLIENTE_surrogate_cliente%TYPE,
      p_dim_vendedor_surrogate_vendedor IN FATO_VENDA.DIMENSAO_VENDEDOR_surrogate_vendedor%TYPE,
      p_valor_venda IN FATO_VENDA.valor_venda%TYPE,
      p_quantidade_venda IN FATO_VENDA.quantidade_venda%TYPE
  );

  PROCEDURE load_initial_fato_vendas;
END data_load_pkg;

-- Corpo do Package
CREATE OR REPLACE PACKAGE BODY data_load_pkg IS

  PROCEDURE load_dim_cliente(
      p_surrogate_cliente IN DIMENSAO_CLIENTE.surrogate_cliente%TYPE,
      p_nome_cliente IN DIMENSAO_CLIENTE.nome_cliente%TYPE,
      p_sexo_cliente IN DIMENSAO_CLIENTE.sexo_cliente%TYPE,
      p_idade_cliente IN DIMENSAO_CLIENTE.idade_cliente%TYPE
  ) IS
  BEGIN
    -- Implementação conforme mostrado anteriormente
  END load_dim_cliente;

  PROCEDURE load_dim_data(
      p_surrogate_data IN DIMENSAO_DATA.surrogate_data%TYPE,
      p_dia IN DIMENSAO_DATA.dia%TYPE,
      p_mes IN DIMENSAO_DATA.mes%TYPE,
      p_ano IN DIMENSAO_DATA.ano%TYPE
  ) IS
  BEGIN
    -- Implementação conforme mostrado anteriormente
  END load_dim_data;

  PROCEDURE load_dim_local(
      p_surrogate_loja IN DIMENSAO_LOCAL.surrogate_loja%TYPE,
      p_nome_loja IN DIMENSAO_LOCAL.nome_loja%TYPE,
      p_codigo_loja IN DIMENSAO_LOCAL.codigo_loja%TYPE,
      p_bairro_loja IN DIMENSAO_LOCAL.bairro_loja%TYPE,
      p_cidade_loja IN DIMENSAO_LOCAL.cidade_loja%TYPE,
      p_estado_loja IN DIMENSAO_LOCAL.estado_loja%TYPE
  ) IS
  BEGIN
    -- Implementação conforme mostrado anteriormente
  END load_dim_local;

  PROCEDURE load_dim_produto(
      p_surrogate_produto IN DIMENSAO_PRODUTO.surrogate_produto%TYPE,
      p_codigo_produto IN DIMENSAO_PRODUTO.codigo_produto%TYPE,
      p_nome_produto IN VARCHAR2,
      p_nome_fabricante IN DIMENSAO_PRODUTO.nome_fabricante%TYPE,
      p_tipo_produto IN DIMENSAO_PRODUTO.tipo_produto%TYPE,
      p_genero_produto IN DIMENSAO_PRODUTO.genero_produto%TYPE
  ) IS
  BEGIN
    -- Implementação conforme mostrado anteriormente
  END load_dim_produto;

  PROCEDURE load_dim_vendedor(
      p_surrogate_vendedor IN DIMENSAO_VENDEDOR.surrogate_vendedor%TYPE,
      p_codigo_vendedor IN DIMENSAO_VENDEDOR.codigo_vendedor%TYPE,
      p_nome_vendedor IN DIMENSAO_VENDEDOR.nome_vendedor%TYPE,
      p_codigo_gerente IN DIMENSAO_VENDEDOR.codigo_gerente%TYPE,
      p_nome_gerente IN DIMENSAO_VENDEDOR.nome_gerente%TYPE
  ) IS
  BEGIN
    -- Implementação conforme mostrado anteriormente
  END load_dim_vendedor;

  PROCEDURE load_fato_venda(
      p_dim_local_surrogate_loja IN FATO_VENDA.DIMENSAO_LOCAL_surrogate_loja%TYPE,
      p_dim_produto_surrogate_produto IN FATO_VENDA.DIMENSAO_PRODUTO_surrogate_produto%TYPE,
      p_dim_data_surrogate_data IN FATO_VENDA.DIMENSAO_DATA_surrogate_data%TYPE,
      p_dim_cliente_surrogate_cliente IN FATO_VENDA.DIMENSAO_CLIENTE_surrogate_cliente%TYPE,
      p_dim_vendedor_surrogate_vendedor IN FATO_VENDA.DIMENSAO_VENDEDOR_surrogate_vendedor%TYPE,
      p_valor_venda IN FATO_VENDA.valor_venda%TYPE,
      p_quantidade_venda IN FATO_VENDA.quantidade_venda%TYPE
  ) IS
  BEGIN
    -- Implementação conforme mostrado anteriormente
  END load_fato_venda;

  PROCEDURE load_initial_fato_vendas IS
    BEGIN
    FOR i IN 1..100 LOOP
        -- Aqui você chamaria a procedure load_fato_venda com valores. 
        -- Exemplo de chamada (ajuste conforme necessário):
        load_fato_venda(
        p_dim_local_surrogate_loja => /* valor válido */,
        p_dim_produto_surrogate_produto => /* valor válido */,
        p_dim_data_surrogate_data => /* valor válido */,
        p_dim_cliente_surrogate_cliente => /* valor válido */,
        p_dim_vendedor_surrogate_vendedor => /* valor válido */,
        p_valor_venda => /* valor aleatório ou fixo, ex: 100.00 */,
        p_quantidade_venda => /* valor aleatório ou fixo, ex: 2 */
        );
    END LOOP;
    EXCEPTION
    WHEN OTHERS THEN
        -- Tratamento de erros genérico
        DBMS_OUTPUT.PUT_LINE('Erro ao carregar dados iniciais em FATO_VENDA: ' || SQLERRM);
    END load_initial_fato_vendas;


END data_load_pkg;
