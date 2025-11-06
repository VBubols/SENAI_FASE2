-- 1 – Cálculo do valor total de um pedido
-- Contexto: Crie uma função chamada fn_total_pedido(id_pedido INT) que retorne o valor 
-- total do pedido informado, considerando o valor unitário dos produtos e as quantidades.
CREATE OR REPLACE FUNCTION FN_TOTAL_PEDIDO(ID_PEDIDO INT)
RETURNS FLOAT AS $$
BEGIN
	SELECT SUM(P.VALOR_UNITARIO * I.QUANTIDADE) AS TOTAL
	FROM ITEM_PEDIDO I
	JOIN PRODUTO P ON I.IDPRODUTO = P.IDPRODUTO
	WHERE I.IDPEDIDO = ID_PEDIDO;
	ORDER BY TOTAL;
END;
$$ LANGUAGE PLPGSQL;

SELECT FN_TOTAL_PEDIDO(3)

-- 2 – Contagem de pedidos por cliente
-- Contexto: Crie uma função chamada fn_qtd_pedidos_cliente(id_cliente INT) que retorne 
-- quantos pedidos o cliente realizou



-- 3 – Listar clientes por UF
-- Contexto: Crie uma função chamada fn_clientes_por_uf(sigla_uf CHAR(2)) que retorne uma 
-- tabela com idcliente e nome dos clientes pertencentes àquela UF.



-- 4 – Média de valores de pedidos por vendedor
-- Contexto: Crie uma função chamada fn_media_pedidos_vendedor(id_vendedor INT) que 
-- retorne a média dos valores dos pedidos feitos por um determinado vendedor.



-- 5 – Buscar nome de cliente por CPF
-- Contexto: Crie uma função chamada fn_nome_cliente(cpf_cliente VARCHAR) que retorne o 
-- nome do cliente associado ao CPF informado. Caso o CPF não exista, a função deve retornar 
-- 'Cliente não encontrado'.