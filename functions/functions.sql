CREATE OR REPLACE FUNCTION valid_dimensao_cliente (
    p_surrogate_cliente IN NUMBER,
    p_nome_cliente      IN VARCHAR2,
    p_sexo_cliente      IN VARCHAR2,
    p_idade_cliente     IN NUMBER
)
RETURN BOOLEAN
IS
    v_valid BOOLEAN := TRUE;
BEGIN
   
    IF p_surrogate_cliente IS NULL THEN
        v_valid := FALSE;
    END IF;

    IF p_nome_cliente IS NULL OR p_nome_cliente = '' THEN
        v_valid := FALSE;
    END IF;

    IF p_sexo_cliente IS NULL OR p_sexo_cliente = '' THEN
        v_valid := FALSE;
    END IF;
    RETURN v_valid;
END;

CREATE OR REPLACE FUNCTION valid_dimensao_data (
    p_surrogate_data IN NUMBER,
    p_dia            IN NUMBER,
    p_mes            IN NUMBER,
    p_ano            IN NUMBER
)
RETURN BOOLEAN
IS
    v_valid BOOLEAN := TRUE;
BEGIN
 
    IF p_dia IS NULL OR p_dia < 1 OR p_dia > 31 THEN
        v_valid := FALSE;
    END IF;


    IF p_mes IS NULL OR p_mes < 1 OR p_mes > 12 THEN
        v_valid := FALSE;
    END IF;
    RETURN v_valid;
END;

CREATE OR REPLACE FUNCTION valid_dimensao_local (
    p_surrogate_loja IN NUMBER,
    p_nome_loja      IN NVARCHAR2,
    p_codigo_loja    IN NUMBER,
    p_bairro_loja    IN VARCHAR2,
    p_cidade_loja    IN VARCHAR2,
    p_estado_loja    IN VARCHAR2
)
RETURN BOOLEAN
IS
    v_valid BOOLEAN := TRUE;
BEGIN

    IF p_surrogate_loja IS NULL THEN
        v_valid := FALSE;
    END IF;

    IF p_codigo_loja IS NULL OR p_codigo_loja < 1 OR p_codigo_loja > 9999 THEN
        v_valid := FALSE;
    END IF;

   
    IF LENGTH(p_estado_loja) != 2 THEN
        v_valid := FALSE;
    END IF;

    RETURN v_valid;
END;

CREATE OR REPLACE FUNCTION valid_dimensao_produto (
    p_surrogate_produto   IN NUMBER,
    p_codigo_produto      IN NUMBER,
    p_nome_produto        IN VARCHAR2,
    p_nome_fabricante     IN VARCHAR2,
    p_tipo_produto        IN VARCHAR2,
    p_genero_produto      IN VARCHAR2
)
RETURN BOOLEAN
IS
    v_valid BOOLEAN := TRUE;
BEGIN
   
    IF p_surrogate_produto IS NULL THEN
        v_valid := FALSE;
    END IF;

   
    IF p_codigo_produto IS NULL OR p_codigo_produto < 1 OR p_codigo_produto > 9999 THEN
        v_valid := FALSE;
    END IF;

   
    IF p_nome_fabricante IS NULL OR p_nome_fabricante = '' THEN
        v_valid := FALSE;
    END IF;


    FOR i IN 1..LENGTH(p_nome_fabricante) LOOP
        IF SUBSTR(p_nome_fabricante, i, 1) BETWEEN '0' AND '9' THEN
            v_valid := FALSE;
            EXIT;
        END IF;
    END LOOP;

    RETURN v_valid;
END;

CREATE OR REPLACE FUNCTION valid_dimensao_vendedor (
    p_surrogate_vendedor IN NUMBER,
    p_codigo_vendedor    IN NUMBER,
    p_nome_vendedor      IN VARCHAR2,
    p_codigo_gerente     IN NUMBER,
    p_nome_gerente       IN VARCHAR2
)
RETURN BOOLEAN
IS
    v_valid BOOLEAN := TRUE;
BEGIN
  
    IF p_surrogate_vendedor IS NULL THEN
        v_valid := FALSE;
    END IF;

 
    IF p_codigo_vendedor IS NULL OR p_codigo_vendedor < 1 OR p_codigo_vendedor > 9999 THEN
        v_valid := FALSE;
    END IF;


    IF p_nome_vendedor IS NULL OR p_nome_vendedor = '' THEN
        v_valid := FALSE;
    END IF;


    IF p_codigo_gerente IS NULL OR p_codigo_gerente < 1 OR p_codigo_gerente > 9999 THEN
        v_valid := FALSE;
    END IF;
    RETURN v_valid;
END;

CREATE OR REPLACE FUNCTION validar_fato_venda (
    p_dimensao_local_surrogate   IN NUMBER,
    p_dimensao_produto_surrogate IN NUMBER,
    p_dimensao_data_surrogate    IN NUMBER,
    p_dimensao_cliente_surrogate IN NUMBER,
    p_dimensao_vendedor_surrogate IN NUMBER,
    p_valor_venda                IN NUMBER,
    p_quantidade_venda           IN NUMBER
)
RETURN BOOLEAN
IS
    v_valid BOOLEAN := TRUE;
BEGIN
    
    IF p_valor_venda < 0 THEN
        v_valid := FALSE;
    END IF;


    IF p_quantidade_venda <= 0 THEN
        v_valid := FALSE;
    END IF;

    RETURN v_valid;
END;
