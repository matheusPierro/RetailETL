-- Procedures para Carregar Dimensões
CREATE OR REPLACE PROCEDURE load_dim_cliente(
    p_surrogate_cliente IN DIMENSAO_CLIENTE.surrogate_cliente%TYPE,
    p_nome_cliente IN DIMENSAO_CLIENTE.nome_cliente%TYPE,
    p_sexo_cliente IN DIMENSAO_CLIENTE.sexo_cliente%TYPE,
    p_idade_cliente IN DIMENSAO_CLIENTE.idade_cliente%TYPE
) IS
    v_count NUMBER;
    v_is_valid BOOLEAN;
BEGIN
    -- Chama a função para validar os dados de entrada
    v_is_valid := valid_dimensao_cliente(p_surrogate_cliente, p_nome_cliente, p_sexo_cliente, p_idade_cliente);
    
    -- Se os dados de entrada não forem válidos, interrompe a execução da procedure
    IF NOT v_is_valid THEN
        DBMS_OUTPUT.PUT_LINE('Dados de entrada inválidos para DIMENSAO_CLIENTE.');
        RETURN;
    END IF;
    
    -- Verifica se o cliente já existe
    SELECT COUNT(*) INTO v_count FROM DIMENSAO_CLIENTE WHERE surrogate_cliente = p_surrogate_cliente;

    IF v_count = 0 THEN
        -- Insere novo cliente
        INSERT INTO DIMENSAO_CLIENTE (surrogate_cliente, nome_cliente, sexo_cliente, idade_cliente)
        VALUES (p_surrogate_cliente, p_nome_cliente, p_sexo_cliente, p_idade_cliente);
    ELSE
        -- Atualiza cliente existente
        UPDATE DIMENSAO_CLIENTE
        SET nome_cliente = p_nome_cliente,
            sexo_cliente = p_sexo_cliente,
            idade_cliente = p_idade_cliente
        WHERE surrogate_cliente = p_surrogate_cliente;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir/atualizar na DIMENSAO_CLIENTE: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE load_dim_data(
    p_surrogate_data IN DIMENSAO_DATA.surrogate_data%TYPE,
    p_dia IN DIMENSAO_DATA.dia%TYPE,
    p_mes IN DIMENSAO_DATA.mes%TYPE,
    p_ano IN DIMENSAO_DATA.ano%TYPE
) IS
    v_count NUMBER;
    v_is_valid BOOLEAN;
BEGIN
    -- Chama a função para validar os dados de entrada
    v_is_valid := valid_dimensao_data(p_surrogate_data, p_dia, p_mes, p_ano);
    
    -- Se os dados de entrada não forem válidos, interrompe a execução da procedure
    IF NOT v_is_valid THEN
        DBMS_OUTPUT.PUT_LINE('Dados de entrada inválidos para DIMENSAO_DATA.');
        RETURN;
    END IF;
    
    -- Verifica se o registro já existe
    SELECT COUNT(*) INTO v_count FROM DIMENSAO_DATA WHERE surrogate_data = p_surrogate_data;
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Chave duplicada encontrada para surrogate_data.');
    ELSE
        -- Insere novo registro
        INSERT INTO DIMENSAO_DATA (surrogate_data, dia, mes, ano)
        VALUES (p_surrogate_data, p_dia, p_mes, p_ano);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir na DIMENSAO_DATA: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE load_dim_local(
    p_surrogate_loja IN DIMENSAO_LOCAL.surrogate_loja%TYPE,
    p_nome_loja IN DIMENSAO_LOCAL.nome_loja%TYPE,
    p_codigo_loja IN DIMENSAO_LOCAL.codigo_loja%TYPE,
    p_bairro_loja IN DIMENSAO_LOCAL.bairro_loja%TYPE,
    p_cidade_loja IN DIMENSAO_LOCAL.cidade_loja%TYPE,
    p_estado_loja IN DIMENSAO_LOCAL.estado_loja%TYPE
) IS
    v_is_valid BOOLEAN;
BEGIN
    -- Chama a função para validar os dados de entrada
    v_is_valid := valid_dimensao_local(p_surrogate_loja, p_nome_loja, p_codigo_loja, p_bairro_loja, p_cidade_loja, p_estado_loja);
    
    -- Se os dados de entrada não forem válidos, interrompe a execução da procedure
    IF NOT v_is_valid THEN
        DBMS_OUTPUT.PUT_LINE('Dados de entrada inválidos para DIMENSAO_LOCAL.');
        RETURN;
    END IF;
    
    -- Procede com o MERGE somente se os dados forem válidos
    MERGE INTO DIMENSAO_LOCAL d
    USING DUAL
    ON (d.surrogate_loja = p_surrogate_loja)
    WHEN MATCHED THEN
        UPDATE SET d.nome_loja = p_nome_loja,
                   d.codigo_loja = p_codigo_loja,
                   d.bairro_loja = p_bairro_loja,
                   d.cidade_loja = p_cidade_loja,
                   d.estado_loja = p_estado_loja
    WHEN NOT MATCHED THEN
        INSERT (surrogate_loja, nome_loja, codigo_loja, bairro_loja, cidade_loja, estado_loja)
        VALUES (p_surrogate_loja, p_nome_loja, p_codigo_loja, p_bairro_loja, p_cidade_loja, p_estado_loja);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir/atualizar na DIMENSAO_LOCAL: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE load_dim_produto(
    p_surrogate_produto IN DIMENSAO_PRODUTO.surrogate_produto%TYPE,
    p_codigo_produto IN DIMENSAO_PRODUTO.codigo_produto%TYPE,
    p_nome_produto IN DIMENSAO_PRODUTO.nome_produto%TYPE, 
    p_nome_fabricante IN DIMENSAO_PRODUTO.nome_fabricante%TYPE,
    p_tipo_produto IN DIMENSAO_PRODUTO.tipo_produto%TYPE,
    p_genero_produto IN DIMENSAO_PRODUTO.genero_produto%TYPE
) IS
    v_count NUMBER;
    v_is_valid BOOLEAN;
BEGIN
    -- Chama a função para validar os dados de entrada
    v_is_valid := valid_dimensao_produto(p_surrogate_produto, p_codigo_produto, p_nome_produto, p_nome_fabricante, p_tipo_produto, p_genero_produto);
    
    -- Se os dados de entrada não forem válidos, interrompe a execução da procedure
    IF NOT v_is_valid THEN
        DBMS_OUTPUT.PUT_LINE('Dados de entrada inválidos para DIMENSAO_PRODUTO.');
        RETURN;
    END IF;
    
    -- Verifica se o produto já existe
    SELECT COUNT(*) INTO v_count FROM DIMENSAO_PRODUTO WHERE surrogate_produto = p_surrogate_produto;
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Chave duplicada encontrada para surrogate_produto.');
    ELSE
        -- Insere novo produto
        INSERT INTO DIMENSAO_PRODUTO (surrogate_produto, codigo_produto, nome_produto, nome_fabricante, tipo_produto, genero_produto)
        VALUES (p_surrogate_produto, p_codigo_produto, p_nome_produto, p_nome_fabricante, p_tipo_produto, p_genero_produto);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir na DIMENSAO_PRODUTO: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE load_dim_vendedor(
    p_surrogate_vendedor IN DIMENSAO_VENDEDOR.surrogate_vendedor%TYPE,
    p_codigo_vendedor IN DIMENSAO_VENDEDOR.codigo_vendedor%TYPE,
    p_nome_vendedor IN DIMENSAO_VENDEDOR.nome_vendedor%TYPE,
    p_codigo_gerente IN DIMENSAO_VENDEDOR.codigo_gerente%TYPE,
    p_nome_gerente IN DIMENSAO_VENDEDOR.nome_gerente%TYPE
) IS
    v_is_valid BOOLEAN;
BEGIN
    -- Chama a função para validar os dados de entrada
    v_is_valid := valid_dimensao_vendedor(p_surrogate_vendedor, p_codigo_vendedor, p_nome_vendedor, p_codigo_gerente, p_nome_gerente);
    
    -- Se os dados de entrada não forem válidos, interrompe a execução da procedure
    IF NOT v_is_valid THEN
        DBMS_OUTPUT.PUT_LINE('Dados de entrada inválidos para DIMENSAO_VENDEDOR.');
        RETURN;
    END IF;
    
    -- Procede com o MERGE somente se os dados forem válidos
    MERGE INTO DIMENSAO_VENDEDOR d
    USING DUAL
    ON (d.surrogate_vendedor = p_surrogate_vendedor)
    WHEN MATCHED THEN
        UPDATE SET d.codigo_vendedor = p_codigo_vendedor,
                   d.nome_vendedor = p_nome_vendedor,
                   d.codigo_gerente = p_codigo_gerente,
                   d.nome_gerente = p_nome_gerente
    WHEN NOT MATCHED THEN
        INSERT (surrogate_vendedor, codigo_vendedor, nome_vendedor, codigo_gerente, nome_gerente)
        VALUES (p_surrogate_vendedor, p_codigo_vendedor, p_nome_vendedor, p_codigo_gerente, p_nome_gerente);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir/atualizar na DIMENSAO_VENDEDOR: ' || SQLERRM);
END;

CREATE OR REPLACE PROCEDURE load_fato_venda(
    p_dim_local_surrogate_loja IN FATO_VENDA.DIMENSAO_LOCAL_surrogate_loja%TYPE,
    p_dim_produto_surrogate_produto IN FATO_VENDA.DIMENSAO_PRODUTO_surrogate_produto%TYPE,
    p_dim_data_surrogate_data IN FATO_VENDA.DIMENSAO_DATA_surrogate_data%TYPE,
    p_dim_cliente_surrogate_cliente IN FATO_VENDA.DIMENSAO_CLIENTE_surrogate_cliente%TYPE,
    p_dim_vendedor_surrogate_vendedor IN FATO_VENDA.DIMENSAO_VENDEDOR_surrogate_vendedor%TYPE,
    p_valor_venda IN FATO_VENDA.valor_venda%TYPE,
    p_quantidade_venda IN FATO_VENDA.quantidade_venda%TYPE
) IS
    v_is_valid BOOLEAN;
BEGIN
    -- Chama a função para validar os dados de entrada
    v_is_valid := validar_fato_venda(
        p_dim_local_surrogate_loja,
        p_dim_produto_surrogate_produto,
        p_dim_data_surrogate_data,
        p_dim_cliente_surrogate_cliente,
        p_dim_vendedor_surrogate_vendedor,
        p_valor_venda,
        p_quantidade_venda
    );
    
    -- Se os dados de entrada não forem válidos, interrompe a execução da procedure
    IF NOT v_is_valid THEN
        DBMS_OUTPUT.PUT_LINE('Dados de entrada inválidos para FATO_VENDA.');
        RETURN;
    END IF;
    
    -- Procede com a inserção somente se os dados forem válidos
    INSERT INTO FATO_VENDA (
        DIMENSAO_LOCAL_surrogate_loja,
        DIMENSAO_PRODUTO_surrogate_produto,
        DIMENSAO_DATA_surrogate_data,
        DIMENSAO_CLIENTE_surrogate_cliente,
        DIMENSAO_VENDEDOR_surrogate_vendedor,
        valor_venda,
        quantidade_venda
    ) VALUES (
        p_dim_local_surrogate_loja,
        p_dim_produto_surrogate_produto,
        p_dim_data_surrogate_data,
        p_dim_cliente_surrogate_cliente,
        p_dim_vendedor_surrogate_vendedor,
        p_valor_venda,
        p_quantidade_venda
    );

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir na FATO_VENDA: ' || SQLERRM);
END;
