--Selecionando todos pagamento do mês 10 e somando todos valores
--SELECT SUM(VALOR_PAG) FROM PAGAMENTO
--WHERE DATA_PAG BETWEEN '01/10/2025' AND '31/10/2025';

--Selecionando todos pagamentos para somar e fazer a média, criando assim
--duas colunas na hora da saída do comando
--SELECT SUM(VALOR_PAG) AS TOTAL, AVG(VALOR_PAG) AS MEDIA FROM PAGAMENTO
--WHERE DATA_PAG BETWEEN '01/10/2025' AND '31/10/2025';

-- Consulta que combina informações de múltiplas tabelas relacionadas: PAGAMENTO, RESERVA, HOSPEDE, TELEFONE e QUARTO.
-- Objetivo: listar todos os pagamentos realizados em outubro de 2025, mostrando dados do pagamento, do hóspede, do quarto e do valor da diária.
--
-- Relações estabelecidas:
--   • PAGAMENTO (P) → RESERVA (R): relaciona o pagamento à reserva correspondente.
--   • RESERVA (R) → HOSPEDE (H): identifica o hóspede que fez a reserva.
--   • HOSPEDE (H) → TELEFONE (T): recupera o telefone do hóspede.
--   • RESERVA (R) → QUARTO (Q): obtém informações sobre o quarto reservado (como valor da diária).
--
-- O filtro final (BETWEEN) seleciona apenas pagamentos feitos entre 01/10/2025 e 31/10/2025.
SELECT P.VALOR_PAG, P.DATA_PAG, R.DT_ENT, R.DT_SAI, R.NUM_QUA, R.NUM_RSV, H.NOME_HOSP, T.NUM_TEL, Q.VALOR_DIARIA,
(R.DT_SAI - R.DT_ENT) AS DIARIAS
FROM PAGAMENTO P, RESERVA R, HOSPEDE H, TELEFONE T, QUARTO Q
WHERE P.NUM_RSV = R.NUM_RSV
AND R.COD_HOSP = H.COD_HOSP
AND H.COD_HOSP = T.COD_HOSP
AND R.NUM_QUA = Q.NUM_QUA
AND DATA_PAG BETWEEN '01/10/2025' AND '31/10/2025';