-- 1. Somente o nome de todos os vendedores em ordem alfabética.
--SELECT NOME_VEND FROM VENDEDOR
--ORDER BY NOME_VEND

-- 2. Os produtos que o preço seja maior que R$200,00, em ordem crescente pelo preço.
-- SELECT * FROM PRODUTO WHERE VALOR_UNITARIO > 200.00
-- ORDER BY VALOR_UNITARIO

-- 3. O nome do produto, o preço e o preço reajustado em 10%, ordenado pelo nome do produto.
-- SELECT NOME_PRODUTO, VALOR_UNITARIO, ROUND(VALOR_UNITARIO + (VALOR_UNITARIO * 0.10), 2) AS VALOR_REAJUSTADO
-- FROM PRODUTO
-- ORDER BY NOME_PRODUTO

-- 4. Os municípios do Rio Grande do Sul.
-- SELECT MUNICIPIO 
-- FROM CLIENTE
--WHERE UF = 'RS'

-- 5. Os pedidos feitos entre 10/04/2008 e 25/04/2008 ordenados pelo valor.
-- SELECT * 
-- FROM PEDIDO
-- WHERE DATA_PEDIDO BETWEEN '10/04/2008' AND '25/04/2008'
-- ORDER BY VALOR

-- 6. Os pedidos que o valor esteja entre R$1.000,00 e R$1.500,00.
-- SELECT * 
-- FROM PEDIDO
-- WHERE VALOR BETWEEN 1000.00 AND 1500.00

-- 7. Os pedidos que o valor não esteja entre R$100,00 e R$500,00.
-- SELECT *
-- FROM PEDIDO
-- WHERE VALOR NOT BETWEEN 500.00 AND 1000.00

-- 8. Os pedidos do vendedor André ordenados pelo valor em ordem decrescente.
-- SELECT P.*, V.NOME_VEND  
-- FROM PEDIDO P, VENDEDOR V
-- WHERE P.IDVENDEDOR = V.IDVENDEDOR
-- AND V.NOME_VEND = 'André'
-- ORDER BY VALOR DESC

-- 9. Os pedidos do cliente Manoel ordenados pelo valor em ordem crescente.
-- SELECT P.*, C.NOME  
-- FROM PEDIDO P, CLIENTE C
-- WHERE P.IDCLIENTE = C.IDCLIENTE
-- AND C.NOME = 'Manoel'
-- ORDER BY VALOR 

-- 10. Os pedidos da cliente Jéssica que foram feitos pelo vendedor André.
-- SELECT P.*, C.NOME, V.NOME_VEND  
-- FROM PEDIDO P, CLIENTE C, VENDEDOR V
-- WHERE P.IDCLIENTE = C.IDCLIENTE
-- AND C.NOME = 'Jéssica'
-- AND V.NOME_VEND = 'André'

-- 11. Os pedidos que foram transportados pela transportadora União Transportes.
-- SELECT P.*, T.NOME_TRANSP
-- FROM PEDIDO P, TRANSPORTADORA T
-- WHERE P.IDTRANSPORTADORA = T.IDTRANSPORTADORA
-- AND NOME_TRANSP = 'União Transportes'

-- 12. Os pedidos feitos pela vendedora Maria ou pela transportadora União Transportes.
-- SELECT P.*, V.NOME_VEND, T.NOME_TRANSP  
-- FROM PEDIDO P, VENDEDOR V, TRANSPORTADORA T
-- WHERE P.IDVENDEDOR = V.IDVENDEDOR
-- AND P.IDTRANSPORTADORA = T.IDTRANSPORTADORA
-- AND (V.NOME_VEND = 'Maria' OR T.NOME_TRANSP = 'União Transportes')

-- 13. Os clientes que moram em União da Vitória ou Porto União.
-- SELECT *
-- FROM CLIENTE
-- WHERE (MUNICIPIO = 'União da Vitória' OR MUNICIPIO = 'Porto União')

-- 14. Os clientes que não moram em União da Vitória e nem em Porto União.
-- SELECT *
-- FROM CLIENTE
-- WHERE NOT(MUNICIPIO = 'União da Vitória' OR MUNICIPIO = 'Porto União')

-- 15. Os clientes que não informaram o logradouro.
-- SELECT *
-- FROM CLIENTE
-- WHERE LOGRADOURO IS NULL

-- 16. Os vendedores que o nome começa com a letra S.
-- SELECT * 
-- FROM VENDEDOR
-- WHERE NOME_VEND LIKE 'S%'


-- 17. Os vendedores que o nome começa com a letra A.
-- SELECT * 
-- FROM VENDEDOR
-- WHERE NOME_VEND LIKE 'A%'

-- 18. Os vendedores que o nome termina com a letra A.
-- SELECT * 
-- FROM VENDEDOR
-- WHERE NOME_VEND LIKE '%a'

-- 19. Os clientes que o nome contém a letra R.
-- SELECT * 
-- FROM VENDEDOR
-- WHERE NOME_VEND LIKE '%r%'

-- 20. Os municípios que começam com a letra P e são de Santa Catarina.
-- SELECT MUNICIPIO, UF
-- FROM CLIENTE
-- WHERE MUNICIPIO LIKE 'P%'
-- AND UF = 'SC'

-- 21. Os fornecedores que informaram o endereço.
--PULAR

-- 22. Os itens do pedido 01.
-- SELECT P.*, I.IDPRODUTO, PROD.NOME_PRODUTO
-- FROM PEDIDO P, ITEM_PEDIDO I, PRODUTO PROD
-- WHERE P.IDPEDIDO = I.IDPEDIDO
-- AND I.IDPRODUTO = PROD.IDPRODUTO
-- AND P.IDPEDIDO = 1

-- 23. Os itens do pedido 06 ou do pedido 10.
-- SELECT P.*, I.IDPRODUTO, PROD.NOME_PRODUTO
-- FROM PEDIDO P, ITEM_PEDIDO I, PRODUTO PROD
-- WHERE P.IDPEDIDO = I.IDPEDIDO
-- AND I.IDPRODUTO = PROD.IDPRODUTO
-- AND (P.IDPEDIDO = 6 OR P.IDPEDIDO = 10)

-- Exercícios - Subconsultas

-- 1. O nome dos clientes que moram na mesma cidade do Manoel. Não deve ser mostrado o Manoel.
-- SELECT NOME
-- FROM CLIENTE
-- WHERE MUNICIPIO = (
-- 	SELECT MUNICIPIO
-- 	FROM CLIENTE
-- 	WHERE NOME = 'Manoel'
-- )
-- AND NOT NOME = 'Manoel'

-- 2. A data e o valor dos pedidos que o valor do pedido seja menor que a média de todos os pedidos.
-- SELECT DATA_PEDIDO, VALOR
-- FROM PEDIDO
-- WHERE VALOR < (
-- 	SELECT AVG(VALOR)
-- 	FROM PEDIDO
-- )

-- 3. A data, o valor, o cliente e o vendedor dos pedidos que possuem 2 ou mais produtos.
-- SELECT DATA_PEDIDO, VALOR, IDCLIENTE, IDVENDEDOR
-- FROM PEDIDO
-- WHERE IDPEDIDO IN (
-- 	SELECT IDPEDIDO
-- 	FROM ITEM_PEDIDO
-- 	GROUP BY IDPEDIDO
-- 	HAVING COUNT(*) >= 2
-- ) 
-- ORDER BY DATA_PEDIDO

-- 4. O nome dos clientes que moram na mesma cidade da transportadora BSTransportes.
-- SELECT NOME
-- FROM CLIENTE
-- WHERE MUNICIPIO IN (
-- 	SELECT MUNICIPIO
-- 	FROM TRANSPORTADORA
-- 	WHERE NOME_TRANSP = 'BS. Transportes'
-- )

-- 5. O nome do cliente e o município dos clientes que estão localizados no mesmo município de qualquer uma das transportadoras.
-- SELECT NOME, MUNICIPIO
-- FROM CLIENTE
-- WHERE MUNICIPIO IN (
-- 	SELECT MUNICIPIO
-- 	FROM TRANSPORTADORA
-- )

-- 6. Atualizar o valor do pedido em 5% para os pedidos que o somatório do valor total dos produtos daquele pedido seja maior que a média do valor total dos produtos de todos os pedidos.
-- UPDATE PEDIDO
-- SET VALOR = VALOR * 1.05
-- WHERE IDPEDIDO IN (
--     SELECT I.IDPEDIDO
--     FROM ITEM_PEDIDO I
--     JOIN PRODUTO PR ON I.IDPRODUTO = PR.IDPRODUTO
--     GROUP BY I.IDPEDIDO
--     HAVING SUM(I.QUANTIDADE * PR.VALOR_UNITARIO) > (
--         SELECT AVG(SOMA_TOTAL)
--         FROM (
--             SELECT SUM(I2.QUANTIDADE * PR2.VALOR_UNITARIO) AS SOMA_TOTAL
--             FROM ITEM_PEDIDO I2
--             JOIN PRODUTO PR2 ON I2.IDPRODUTO = PR2.IDPRODUTO
--             GROUP BY I2.IDPEDIDO
--         ) AS MEDIA_PEDIDOS
--     )
-- );

-- 7. O nome do cliente e a quantidade de pedidos feitos pelo cliente.
-- SELECT NOME,(
-- 	SELECT COUNT(*)
-- 	FROM PEDIDO P
-- 	WHERE P.IDCLIENTE = C.IDCLIENTE) AS PEDIDOS_FEITOS
-- FROM CLIENTE C

-- 8. Para revisar, refaça o exercício anterior (número 07) utilizando GROUP BY e mostrando somente os clientes que fizeram pelo menos um pedido.
-- SELECT C.NOME, COUNT(P.IDPEDIDO) AS PEDIDOS_FEITOS
-- FROM CLIENTE C
-- JOIN PEDIDO P ON C.IDCLIENTE = P.IDCLIENTE
-- GROUP BY C.NOME
-- HAVING COUNT(P.IDPEDIDO) >= 1;

