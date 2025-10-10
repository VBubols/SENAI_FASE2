--CONSULTA 1: Exibir todos os veículos cujo status seja "em manutenção"
--SELECT * FROM VEICULO WHERE STATUS = 'EM MANUTENCAO'

--CONSULTA 2: Exibir os nomes dos motoristas e as viagens que realizaram, com destino e distância
--SELECT M.NOME, V.DESTINO, V.DISTANCIA
--FROM MOTORISTA M, VIAGEM V
--WHERE M.COD_MOT = V.COD_MOT

--CONSULTA 3: Mostrar o total de ocorrências registradas por viagem
--SELECT COD_VIA, COUNT(COD_VIA) AS TOTAL_OCORRENCIA FROM OCORRENCIA GROUP BY COD_VIA

--CONSULTA 4: Calcular a média de quilômetros registradas por viagem por veículos ativos
--Para informação o veículo 1 tem duas viagens registradas, sendo elas de 180km e 520km, respectivamente
--SELECT AVG(V.DISTANCIA) AS MEDIA_KM, VC.COD_VEI 
--FROM VIAGEM V, VEICULO VC
--WHERE V.COD_VEI = VC.COD_VEI
--AND VC.STATUS = 'DISPONIVEL'
--GROUP BY VC.COD_VEI 

--CONSULTA 5: Listar viagens com distância superior a 500km, ordenadas de forma descrescente 
--SELECT * FROM VIAGEM WHERE DISTANCIA > 500 ORDER BY DISTANCIA








