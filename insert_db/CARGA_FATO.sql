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
END;

--Carga de dados para 100 registros na tabela FATO_VENDA
BEGIN
    data_load_pkg.load_initial_fato_vendas;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao executar load_initial_fato_vendas: ' || SQLERRM);
END;