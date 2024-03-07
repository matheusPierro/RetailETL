SET SERVEROUTPUT ON;

BEGIN
    load_dim_cliente(
        p_surrogate_cliente => 2, -- Substitua 1 pelo seu valor real
        p_nome_cliente => 'Nome Cliente', -- Substitua 'Nome Cliente' pelo nome real do cliente
        p_sexo_cliente => 'Masculino', -- Substitua 'Masculino' pelo sexo real do cliente
        p_idade_cliente => 30 -- Substitua 30 pela idade real do cliente
    );
END;

BEGIN
    load_dim_data(
        p_surrogate_data => 2, -- Substitua 1 pelo seu valor real
        p_dia => 15, -- Substitua 15 pelo dia real
        p_mes => 4, -- Substitua 4 pelo mês real
        p_ano => 2024 -- Substitua 2024 pelo ano real
    );
END;

BEGIN
    load_dim_local(
        p_surrogate_loja => 2, -- Substitua 1 pelo seu valor real
        p_nome_loja => 'Nome Loja', -- Substitua 'Nome Loja' pelo nome real da loja
        p_codigo_loja => 1234, -- Substitua 1234 pelo código real da loja
        p_bairro_loja => 'Bairro Loja', -- Substitua 'Bairro Loja' pelo bairro real da loja
        p_cidade_loja => 'Cidade Loja', -- Substitua 'Cidade Loja' pela cidade real da loja
        p_estado_loja => 'SP' -- Substitua 'SP' pelo estado real da loja
    );
END;

BEGIN
    load_dim_produto(
        p_surrogate_produto => 3, -- Substitua 1 pelo seu valor real
        p_codigo_produto => 5679, -- Substitua 5678 pelo código real do produto
        p_nome_produto => 'Nome Produto', -- Substitua 'Nome Produto' pelo nome real do produto
        p_nome_fabricante => 'Nome Fabricante', -- Substitua 'Nome Fabricante' pelo fabricante real do produto
        p_tipo_produto => 'Tipo Produto', -- Substitua 'Tipo Produto' pelo tipo real do produto
        p_genero_produto => 'Gênero Produto' -- Substitua 'Gênero Produto' pelo gênero real do produto
    );
END;

BEGIN
    load_dim_vendedor(
        p_surrogate_vendedor => 2, -- Substitua 1 pelo seu valor real
        p_codigo_vendedor => 9876, -- Substitua 9876 pelo código real do vendedor
        p_nome_vendedor => 'Nome Vendedor', -- Substitua 'Nome Vendedor' pelo nome real do vendedor
        p_codigo_gerente => 5432, -- Substitua 5432 pelo código real do gerente
        p_nome_gerente => 'Nome Gerente' -- Substitua 'Nome Gerente' pelo nome real do gerente
    );
END;
