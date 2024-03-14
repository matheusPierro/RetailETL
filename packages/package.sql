CREATE OR REPLACE PACKAGE pkg_gestao_venda AS
    PROCEDURE load_cliente(
        p_surrogate_cliente IN DIMENSAO_CLIENTE.surrogate_cliente%TYPE,
        p_nome_cliente IN DIMENSAO_CLIENTE.nome_cliente%TYPE,
        p_sexo_cliente IN DIMENSAO_CLIENTE.sexo_cliente%TYPE,
        p_idade_cliente IN DIMENSAO_CLIENTE.idade_cliente%TYPE
    );

    PROCEDURE load_data(
        p_surrogate_data IN DIMENSAO_DATA.surrogate_data%TYPE,
        p_dia IN DIMENSAO_DATA.dia%TYPE,
        p_mes IN DIMENSAO_DATA.mes%TYPE,
        p_ano IN DIMENSAO_DATA.ano%TYPE
    );

    PROCEDURE load_local(
        p_surrogate_loja IN DIMENSAO_LOCAL.surrogate_loja%TYPE,
        p_nome_loja IN DIMENSAO_LOCAL.nome_loja%TYPE,
        p_codigo_loja IN DIMENSAO_LOCAL.codigo_loja%TYPE,
        p_bairro_loja IN DIMENSAO_LOCAL.bairro_loja%TYPE,
        p_cidade_loja IN DIMENSAO_LOCAL.cidade_loja%TYPE,
        p_estado_loja IN DIMENSAO_LOCAL.estado_loja%TYPE
    );

    PROCEDURE load_produto(
        p_surrogate_produto IN DIMENSAO_PRODUTO.surrogate_produto%TYPE,
        p_codigo_produto IN DIMENSAO_PRODUTO.codigo_produto%TYPE,
        p_nome_produto IN DIMENSAO_PRODUTO.nome_produto%TYPE, 
        p_nome_fabricante IN DIMENSAO_PRODUTO.nome_fabricante%TYPE,
        p_tipo_produto IN DIMENSAO_PRODUTO.tipo_produto%TYPE,
        p_genero_produto IN DIMENSAO_PRODUTO.genero_produto%TYPE
    );

    PROCEDURE load_vendedor(
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
END pkg_gestao_venda;


CREATE OR REPLACE PACKAGE BODY pkg_gestao_venda AS    
    PROCEDURE load_cliente(
        p_surrogate_cliente IN DIMENSAO_CLIENTE.surrogate_cliente%TYPE,
        p_nome_cliente IN DIMENSAO_CLIENTE.nome_cliente%TYPE,
        p_sexo_cliente IN DIMENSAO_CLIENTE.sexo_cliente%TYPE,
        p_idade_cliente IN DIMENSAO_CLIENTE.idade_cliente%TYPE
    ) IS
    BEGIN
        load_dim_cliente(p_surrogate_cliente, p_nome_cliente, p_sexo_cliente, p_idade_cliente);
    END load_cliente;
    
    PROCEDURE load_data(
        p_surrogate_data IN DIMENSAO_DATA.surrogate_data%TYPE,
        p_dia IN DIMENSAO_DATA.dia%TYPE,
        p_mes IN DIMENSAO_DATA.mes%TYPE,
        p_ano IN DIMENSAO_DATA.ano%TYPE
    ) IS
    BEGIN
        load_dim_data(p_surrogate_data, p_dia, p_mes, p_ano);
    END load_data;
    
    PROCEDURE load_local(
        p_surrogate_loja IN DIMENSAO_LOCAL.surrogate_loja%TYPE,
        p_nome_loja IN DIMENSAO_LOCAL.nome_loja%TYPE,
        p_codigo_loja IN DIMENSAO_LOCAL.codigo_loja%TYPE,
        p_bairro_loja IN DIMENSAO_LOCAL.bairro_loja%TYPE,
        p_cidade_loja IN DIMENSAO_LOCAL.cidade_loja%TYPE,
        p_estado_loja IN DIMENSAO_LOCAL.estado_loja%TYPE
    ) IS
    BEGIN
        load_dim_local(p_surrogate_loja, p_nome_loja, p_codigo_loja, p_bairro_loja, p_cidade_loja, p_estado_loja);
    END load_local;

    PROCEDURE load_produto(
        p_surrogate_produto IN DIMENSAO_PRODUTO.surrogate_produto%TYPE,
        p_codigo_produto IN DIMENSAO_PRODUTO.codigo_produto%TYPE,
        p_nome_produto IN DIMENSAO_PRODUTO.nome_produto%TYPE, 
        p_nome_fabricante IN DIMENSAO_PRODUTO.nome_fabricante%TYPE,
        p_tipo_produto IN DIMENSAO_PRODUTO.tipo_produto%TYPE,
        p_genero_produto IN DIMENSAO_PRODUTO.genero_produto%TYPE
    ) IS
    BEGIN
        load_dim_produto(p_surrogate_produto, p_codigo_produto, p_nome_produto, p_nome_fabricante, p_tipo_produto, p_genero_produto);
    END load_produto;
    
    PROCEDURE load_vendedor(
        p_surrogate_vendedor IN DIMENSAO_VENDEDOR.surrogate_vendedor%TYPE,
        p_codigo_vendedor IN DIMENSAO_VENDEDOR.codigo_vendedor%TYPE,
        p_nome_vendedor IN DIMENSAO_VENDEDOR.nome_vendedor%TYPE,
        p_codigo_gerente IN DIMENSAO_VENDEDOR.codigo_gerente%TYPE,
        p_nome_gerente IN DIMENSAO_VENDEDOR.nome_gerente%TYPE
    ) IS
    BEGIN
        load_dim_vendedor(p_surrogate_vendedor, p_codigo_vendedor, p_nome_vendedor, p_codigo_gerente, p_nome_gerente);
    END load_vendedor;

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
    END load_fato_venda;

END pkg_gestao_venda;


