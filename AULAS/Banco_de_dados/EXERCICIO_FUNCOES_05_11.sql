-- 1 – Cálculo do valor total de um pedido
-- Contexto: Crie uma função chamada fn_total_pedido(id_pedido INT) que retorne o valor 
-- total do pedido informado, considerando o valor unitário dos produtos e as quantidades.
CREATE OR REPLACE FUNCTION FN_TOTAL_PEDIDO(ID_PEDIDO INT)
RETURNS FLOAT AS $$
DECLARE
	TOTAL FLOAT;	
BEGIN
	SELECT (P.VALOR_UNITARIO * I.QUANTIDADE)
	INTO TOTAL
	FROM ITEM_PEDIDO I
	JOIN PRODUTO P ON I.IDPRODUTO = P.IDPRODUTO
	WHERE I.IDPEDIDO = ID_PEDIDO;

	RETURN TOTAL;
END;
$$ LANGUAGE PLPGSQL;

SELECT FN_TOTAL_PEDIDO(1)

-- 2 – Contagem de pedidos por cliente
-- Contexto: Crie uma função chamada fn_qtd_pedidos_cliente(id_cliente INT) que retorne 
-- quantos pedidos o cliente realizou
CREATE OR REPLACE FUNCTION FN_QTD_PEDIDOS_CLIENTE(ID_CLIENTE INT)
RETURNS TABLE (
	NOME_CLIENTE TEXT,
	PEDIDOS_FEITOS INT
) AS $$
BEGIN
	RETURN QUERY
	SELECT C.NOME::TEXT, COUNT(P.IDPEDIDO)::INT
	FROM PEDIDO P
	JOIN CLIENTE C ON P.IDCLIENTE = C.IDCLIENTE
	WHERE C.IDCLIENTE = ID_CLIENTE
	GROUP BY C.NOME;
END;
$$ LANGUAGE PLPGSQL;

--Retorna tudo numa coluna:
SELECT FN_QTD_PEDIDOS_CLIENTE(3);

--Retorna em uma tabela:
SELECT * FROM FN_QTD_PEDIDOS_CLIENTE(3);

-- 3 – Listar clientes por UF
-- Contexto: Crie uma função chamada fn_clientes_por_uf(sigla_uf CHAR(2)) que retorne uma 
-- tabela com idcliente e nome dos clientes pertencentes àquela UF.
CREATE OR REPLACE FUNCTION FN_CLIENTES_POR_UF(SIGLA_UF CHAR(2))
RETURNS TABLE (
	ID_CLIENTE INT,
	NOME_CLIENTE TEXT,
	UF_CLIENTE TEXT
) AS $$
BEGIN
	RETURN QUERY
	SELECT IDCLIENTE::INT, NOME::TEXT, UF::TEXT
	FROM CLIENTE
	WHERE UF = SIGLA_UF;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM FN_CLIENTES_POR_UF('SC');

-- 4 – Média de valores de pedidos por vendedor
-- Contexto: Crie uma função chamada fn_media_pedidos_vendedor(id_vendedor INT) que 
-- retorne a média dos valores dos pedidos feitos por um determinado vendedor.
CREATE OR REPLACE FUNCTION FN_MEDIA_PEDIDOS_VENDEDOR(ID_VENDEDOR INT)
RETURNS TABLE (
	NOME_VENDEDOR TEXT,
	MEDIA_VALORES NUMERIC(10, 2)
) AS $$
BEGIN
	RETURN QUERY
	SELECT V.NOME_VEND::TEXT, AVG(P.VALOR)::NUMERIC(10,2)
	FROM PEDIDO P
	JOIN VENDEDOR V ON V.IDVENDEDOR = P.IDVENDEDOR
	WHERE P.IDVENDEDOR = ID_VENDEDOR
	GROUP BY V.NOME_VEND;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM FN_MEDIA_PEDIDOS_VENDEDOR(1)

-- 5 – Buscar nome de cliente por CPF
-- Contexto: Crie uma função chamada fn_nome_cliente(cpf_cliente VARCHAR) que retorne o 
-- nome do cliente associado ao CPF informado. Caso o CPF não exista, a função deve retornar 
-- 'Cliente não encontrado'.
CREATE OR REPLACE FUNCTION FN_NOME_CLIENTE(CPF_CLIENTE TEXT)
RETURNS TEXT AS $$
DECLARE
	CPF_INFORMADO TEXT;
BEGIN
	SELECT NOME
	INTO CPF_INFORMADO
	FROM CLIENTE
	WHERE CPF = CPF_CLIENTE;

	IF CPF_INFORMADO IS NULL THEN
		RETURN 'Cliente não encontrado';
	ELSE
		RETURN CPF_INFORMADO;
	END IF;
END;
$$ LANGUAGE PLPGSQL;

SELECT FN_NOME_CLIENTE('88818181811')
SELECT FN_NOME_CLIENTE('3213213')
SELECT FN_NOME_CLIENTE('')

