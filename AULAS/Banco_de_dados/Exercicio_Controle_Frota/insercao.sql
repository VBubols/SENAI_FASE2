-- INSERINDO DADOS NAS TABELAS

-- =========================
-- VEICULO (pelo menos 5)
-- =========================
INSERT INTO VEICULO (PLACA, MODELO, ANO, KM, STATUS) VALUES
('ABC1D23', 'Fiat Ducato', '2020', 85000, 'DISPONIVEL'),
('XYZ9K87', 'Mercedes Sprinter', '2019', 120000, 'EM MANUTENCAO'),
('JKL4P56', 'VW Delivery', '2021', 65000, 'DISPONIVEL'),
('MNO3T21', 'Ford Transit', '2022', 40000, 'FORA DE OPERACAO'),
('PQR8V65', 'Iveco Daily', '2020', 95000, 'EM MANUTENCAO');

-- =========================
-- MOTORISTA (pelo menos 4)
-- =========================
INSERT INTO MOTORISTA (NOME, CNH, CIDADE_ORG) VALUES
('João Pereira', '12345678900', 'Florianópolis'),
('Carlos Mendes', '98765432100', 'São José'),
('Rafael Lima', '45678912300', 'Palhoça'),
('Eduardo Silva', '32165498700', 'Biguaçu');

-- =========================
-- TELEFONE (1:N com MOTORISTA)
-- =========================
INSERT INTO TELEFONE (NUM_TEL, COD_MOT) VALUES
('48999999999', 1),
('48988888888', 1),
('48977777777', 2),
('48966666666', 3),
('48955555555', 4);

-- =========================
-- VIAGEM (pelo menos 4)
-- =========================
INSERT INTO VIAGEM (COD_MOT, COD_VEI, DATA_SAI, DESTINO, DISTANCIA) VALUES
(1, 1, '2025-09-04', 'Não Me Toque', 520),
(1, 1, '2025-09-01', 'Joinville', 180),
(2, 3, '2025-09-03', 'Blumenau', 240),
(3, 2, '2025-09-05', 'Curitiba', 480),
(4, 5, '2025-09-10', 'Porto Alegre', 720);

-- =========================
-- OCORRENCIA (pelo menos 3)
-- =========================
INSERT INTO OCORRENCIA (COD_VIA, DATA_OCR, TIPO_OCR, DESCRICAO) VALUES
(1, '2025-09-02', 'MANUTENCAO', 'Problema no ar condicionado.'),
(1, '2025-09-02', 'ATRASO', 'Trânsito intenso na BR-101 causou atraso na entrega.'),
(2, '2025-09-04', 'MANUTENCAO', 'Falha no sistema de freio durante o trajeto.'),
(4, '2025-09-11', 'ACIDENTE', 'Colisão leve durante o descarregamento no destino.');
