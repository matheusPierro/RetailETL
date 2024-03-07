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

CREATE OR REPLACE PACKAGE BODY data_load_pkg IS  
  PROCEDURE load_dim_cliente(
      p_surrogate_cliente IN DIMENSAO_CLIENTE.surrogate_cliente%TYPE,
      p_nome_cliente IN DIMENSAO_CLIENTE.nome_cliente%TYPE,
      p_sexo_cliente IN DIMENSAO_CLIENTE.sexo_cliente%TYPE,
      p_idade_cliente IN DIMENSAO_CLIENTE.idade_cliente%TYPE
  ) IS
  BEGIN
    load_dim_cliente(
        p_surrogate_cliente => 2, -- Substitua 1 pelo seu valor real
        p_nome_cliente => 'Nome Cliente', -- Substitua 'Nome Cliente' pelo nome real do cliente
        p_sexo_cliente => 'Masculino', -- Substitua 'Masculino' pelo sexo real do cliente
        p_idade_cliente => 30 -- Substitua 30 pela idade real do cliente
    );
  END load_dim_cliente;

  PROCEDURE load_dim_data(
      p_surrogate_data IN DIMENSAO_DATA.surrogate_data%TYPE,
      p_dia IN DIMENSAO_DATA.dia%TYPE,
      p_mes IN DIMENSAO_DATA.mes%TYPE,
      p_ano IN DIMENSAO_DATA.ano%TYPE
  ) IS
  BEGIN
    load_dim_data(
        p_surrogate_data => 2, -- Substitua 1 pelo seu valor real
        p_dia => 15, -- Substitua 15 pelo dia real
        p_mes => 4, -- Substitua 4 pelo mês real
        p_ano => 2024 -- Substitua 2024 pelo ano real
    );
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
    load_dim_local(
        p_surrogate_loja => 2, -- Substitua 1 pelo seu valor real
        p_nome_loja => 'Nome Loja', -- Substitua 'Nome Loja' pelo nome real da loja
        p_codigo_loja => 1234, -- Substitua 1234 pelo código real da loja
        p_bairro_loja => 'Bairro Loja', -- Substitua 'Bairro Loja' pelo bairro real da loja
        p_cidade_loja => 'Cidade Loja', -- Substitua 'Cidade Loja' pela cidade real da loja
        p_estado_loja => 'SP' -- Substitua 'SP' pelo estado real da loja
    );
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
    load_dim_produto(
        p_surrogate_produto => 3, -- Substitua 1 pelo seu valor real
        p_codigo_produto => 5679, -- Substitua 5678 pelo código real do produto
        p_nome_produto => 'Nome Produto', -- Substitua 'Nome Produto' pelo nome real do produto
        p_nome_fabricante => 'Nome Fabricante', -- Substitua 'Nome Fabricante' pelo fabricante real do produto
        p_tipo_produto => 'Tipo Produto', -- Substitua 'Tipo Produto' pelo tipo real do produto
        p_genero_produto => 'Gênero Produto' -- Substitua 'Gênero Produto' pelo gênero real do produto
    );
  END load_dim_produto;

  PROCEDURE load_dim_vendedor(
      p_surrogate_vendedor IN DIMENSAO_VENDEDOR.surrogate_vendedor%TYPE,
      p_codigo_vendedor IN DIMENSAO_VENDEDOR.codigo_vendedor%TYPE,
      p_nome_vendedor IN DIMENSAO_VENDEDOR.nome_vendedor%TYPE,
      p_codigo_gerente IN DIMENSAO_VENDEDOR.codigo_gerente%TYPE,
      p_nome_gerente IN DIMENSAO_VENDEDOR.nome_gerente%TYPE
  ) IS
  BEGIN
    load_dim_vendedor(
        p_surrogate_vendedor => 2, -- Substitua 1 pelo seu valor real
        p_codigo_vendedor => 9876, -- Substitua 9876 pelo código real do vendedor
        p_nome_vendedor => 'Nome Vendedor', -- Substitua 'Nome Vendedor' pelo nome real do vendedor
        p_codigo_gerente => 5432, -- Substitua 5432 pelo código real do gerente
        p_nome_gerente => 'Nome Gerente' -- Substitua 'Nome Gerente' pelo nome real do gerente
    );
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
    load_fato_venda(
        p_dim_local_surrogate_loja => 1, -- Substitua 1 pelo ID da loja da dimensão local
        p_dim_produto_surrogate_produto => 1, -- Substitua 1 pelo ID do produto da dimensão produto
        p_dim_data_surrogate_data => 1, -- Substitua 1 pelo ID da data da dimensão data
        p_dim_cliente_surrogate_cliente => 1, -- Substitua 1 pelo ID do cliente da dimensão cliente
        p_dim_vendedor_surrogate_vendedor => 1, -- Substitua 1 pelo ID do vendedor da dimensão vendedor
        p_valor_venda => 500.00, -- Substitua 500.00 pelo valor da venda
        p_quantidade_venda => 2 -- Substitua 2 pela quantidade vendida
    );
  END load_fato_venda;

PROCEDURE load_initial_fato_vendas IS
    v_max_local_id DIMENSAO_LOCAL.surrogate_loja%TYPE;
    v_max_produto_id DIMENSAO_PRODUTO.surrogate_produto%TYPE;
    v_max_data_id DIMENSAO_DATA.surrogate_data%TYPE;
    v_max_cliente_id DIMENSAO_CLIENTE.surrogate_cliente%TYPE;
    v_max_vendedor_id DIMENSAO_VENDEDOR.surrogate_vendedor%TYPE;
BEGIN
    -- Calcula os IDs máximos uma vez antes do loop
    SELECT MAX(surrogate_loja) INTO v_max_local_id FROM DIMENSAO_LOCAL;
    SELECT MAX(surrogate_produto) INTO v_max_produto_id FROM DIMENSAO_PRODUTO;
    SELECT MAX(surrogate_data) INTO v_max_data_id FROM DIMENSAO_DATA;
    SELECT MAX(surrogate_cliente) INTO v_max_cliente_id FROM DIMENSAO_CLIENTE;
    SELECT MAX(surrogate_vendedor) INTO v_max_vendedor_id FROM DIMENSAO_VENDEDOR;

    FOR i IN 1..100 LOOP
        load_fato_venda(
            p_dim_local_surrogate_loja => i MOD v_max_local_id + 1,
            p_dim_produto_surrogate_produto => i MOD v_max_produto_id + 1,
            p_dim_data_surrogate_data => i MOD v_max_data_id + 1,
            p_dim_cliente_surrogate_cliente => i MOD v_max_cliente_id + 1,
            p_dim_vendedor_surrogate_vendedor => i MOD v_max_vendedor_id + 1,
            p_valor_venda => DBMS_RANDOM.VALUE(100, 1000), -- Gera um valor aleatório entre 100 e 1000
            p_quantidade_venda => DBMS_RANDOM.VALUE(1, 10) -- Gera uma quantidade aleatória entre 1 e 10
        );
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao carregar dados iniciais em FATO_VENDA: ' || SQLERRM);
END load_initial_fato_vendas;

END data_load_pkg;
