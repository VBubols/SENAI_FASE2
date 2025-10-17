--CONSULTAS
-- 1: Listar todos os produtos com estoque abaixo de 10 unidades
SELECT * FROM PRODUTO WHERE QTD_EST < 10

-- 2: Exibir os produtos e seus respectivos fornecedores
SELECT P.NOME_PRODUTO, F.NOME_FORNECEDOR
FROM PRODUTO P, FORNECEDOR F
WHERE F.ID_FORNECEDOR = P.ID_FORNECEDOR

-- 3: Mostrar a quantidade total de solicitações de manutenção do produto 1
SELECT COUNT(ID_MANUTENCAO)
FROM MANUTENCAO
WHERE ID_PRODUTO = 1

-- 4: Exibir as manutenções com status "pendente" ordenadas por data
SELECT * FROM MANUTENCAO 
WHERE STATUS = 'PENDENTE'
ORDER BY DATA_SOLICITACAO

-- 5: Calcular o valor total de produtos em estoque
SELECT SUM(PRECO * QTD_EST) AS VALOR_TOTAL
FROM PRODUTO






