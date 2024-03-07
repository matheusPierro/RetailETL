SET SERVEROUTPUT ON;

BEGIN
    load_dim_cliente(
        p_surrogate_cliente => 2, 
        p_nome_cliente => 'Nome Cliente', 
        p_sexo_cliente => 'Masculino', 
        p_idade_cliente => 30 
    );
END;

BEGIN
    load_dim_data(
        p_surrogate_data => 2, 
        p_dia => 15, 
        p_mes => 4, 
        p_ano => 2024 
    );
END;

BEGIN
    load_dim_local(
        p_surrogate_loja => 2, 
        p_nome_loja => 'Nome Loja', 
        p_codigo_loja => 1234, 
        p_bairro_loja => 'Bairro Loja', 
        p_cidade_loja => 'Cidade Loja', 
        p_estado_loja => 'SP' 
    );
END;

BEGIN
    load_dim_produto(
        p_surrogate_produto => 3, 
        p_codigo_produto => 5679, 
        p_nome_produto => 'Nome Produto', 
        p_nome_fabricante => 'Nome Fabricante', 
        p_tipo_produto => 'Tipo Produto', 
        p_genero_produto => 'Gênero Produto' 
    );
END;

BEGIN
    load_dim_vendedor(
        p_surrogate_vendedor => 2, 
        p_codigo_vendedor => 9876, 
        p_nome_vendedor => 'Nome Vendedor', 
        p_codigo_gerente => 5432, 
        p_nome_gerente => 'Nome Gerente' 
    );
END;
