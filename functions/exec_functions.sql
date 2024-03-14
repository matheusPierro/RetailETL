DECLARE
    v_result BOOLEAN;
BEGIN
    v_result := valid_dimensao_cliente(2, 'João', 'Masculino', 30);
    
    IF v_result THEN
        DBMS_OUTPUT.PUT_LINE('Os dados do cliente são válidos.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Os dados do cliente não são válidos.');
    END IF;
END;
/

DECLARE
    v_result BOOLEAN;
BEGIN
    v_result := valid_dimensao_data(1, 12, 6, 2023);
    
    IF v_result THEN
        DBMS_OUTPUT.PUT_LINE('Os dados da data são válidos.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Os dados da data não são válidos.');
    END IF;
END;
/
 
DECLARE
    v_result BOOLEAN;
BEGIN
    v_result := valid_dimensao_local(1, 'Nome da Loja', 1234, 'Bairro da Loja', 'Cidade da Loja', 'SP');
    
    IF v_result THEN
        DBMS_OUTPUT.PUT_LINE('Os dados da loja são válidos.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Os dados da loja não são válidos.');
    END IF;
END;
/

DECLARE
    v_result BOOLEAN;
BEGIN
    v_result := valid_dimensao_produto(1, 1234, 'Nome do Produto', 'Nome do Fabricante', 'Tipo do Produto', 'Gênero do Produto');
    
    IF v_result THEN
        DBMS_OUTPUT.PUT_LINE('Os dados do produto são válidos.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Os dados do produto não são válidos.');
    END IF;
END;
/

DECLARE
    v_result BOOLEAN;
BEGIN
    v_result := valid_dimensao_vendedor(1, 1234, 'Nome do Vendedor', 5678, 'Nome do Gerente');
    
    IF v_result THEN
        DBMS_OUTPUT.PUT_LINE('Os dados do vendedor são válidos.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Os dados do vendedor não são válidos.');
    END IF;
END;
/

DECLARE
    v_result BOOLEAN;
BEGIN
    v_result := validar_fato_venda(1, 2, 3, 4, 5, 100, 10);
    
    IF v_result THEN
        DBMS_OUTPUT.PUT_LINE('Os dados da venda são válidos.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Os dados da venda não são válidos.');
    END IF;
END;
/
