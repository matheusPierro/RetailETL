DECLARE
    v_dim_local_surrogate_loja NUMBER;
    v_dim_produto_surrogate_produto NUMBER;
    v_dim_data_surrogate_data NUMBER;
    v_dim_cliente_surrogate_cliente NUMBER;
    v_dim_vendedor_surrogate_vendedor NUMBER;
    v_valor_venda NUMBER;
    v_quantidade_venda NUMBER;
BEGIN
    FOR i IN 1..100 LOOP
        v_dim_local_surrogate_loja := i;
        v_dim_produto_surrogate_produto := i;
        v_dim_data_surrogate_data := i;
        v_dim_cliente_surrogate_cliente := i;
        v_dim_vendedor_surrogate_vendedor := i;
        v_valor_venda := 100.00;
        v_quantidade_venda := 2;
        
        pkg_gestao_venda.load_cliente(v_dim_cliente_surrogate_cliente, 'Cliente ' || i, 'M', 30);
        pkg_gestao_venda.load_data(v_dim_data_surrogate_data, i mod 30 + 1, i mod 12 + 1, 2020);
        pkg_gestao_venda.load_local(v_dim_local_surrogate_loja, 'Loja ' || i, v_dim_local_surrogate_loja, 'Bairro ' || i, 'Cidade ' || i, 'SP');
        pkg_gestao_venda.load_produto(v_dim_produto_surrogate_produto, v_dim_produto_surrogate_produto, 'Produto ' || i, 'Fabricante ' || i, 'Tipo ' || i, 'Gênero ' || i);
        pkg_gestao_venda.load_vendedor(v_dim_vendedor_surrogate_vendedor, v_dim_vendedor_surrogate_vendedor, 'Vendedor ' || i, v_dim_vendedor_surrogate_vendedor, 'Nome Gerente ' || i);
        pkg_gestao_venda.load_fato_venda(v_dim_local_surrogate_loja, v_dim_produto_surrogate_produto, v_dim_data_surrogate_data, v_dim_cliente_surrogate_cliente, v_dim_vendedor_surrogate_vendedor, v_valor_venda, v_quantidade_venda);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir registros: ' || SQLERRM);
END;