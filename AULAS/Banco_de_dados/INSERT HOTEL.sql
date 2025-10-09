-- INSERINDO HÓSPEDES
INSERT INTO HOSPEDE (NOME_HOSP, EMAIL) VALUES
('Carlos Almeida', 'carlos.almeida@email.com'),
('Mariana Souza', 'mariana.souza@email.com'),
('João Pedro Santos', 'joaopedro.santos@email.com'),
('Ana Paula Lima', 'ana.lima@email.com'),
('Lucas Ferreira', 'lucas.ferreira@email.com'),
('Juliana Costa', 'juliana.costa@email.com'),
('Rafael Oliveira', 'rafael.oliveira@email.com'),
('Beatriz Silva', 'beatriz.silva@email.com'),
('Gabriel Rocha', 'gabriel.rocha@email.com'),
('Fernanda Gomes', 'fernanda.gomes@email.com');

-- INSERINDO TELEFONES (ligados aos hóspedes)
INSERT INTO TELEFONE (NUM_TEL, COD_HOSP) VALUES
('11987654321', 1),
('21999887766', 2),
('31988776655', 3),
('41977665544', 4),
('51966554433', 5),
('61955443322', 6),
('71944332211', 7),
('81933221100', 8),
('91922110099', 9),
('11911009877', 10);

-- INSERINDO QUARTOS
INSERT INTO QUARTO (TIPO_QUA, VALOR_DIARIA) VALUES
('SINGLE STD', 180.00),
('SINGLE LUXO', 250.00),
('CASAL STD', 300.00),
('CASAL LUXO', 400.00),
('SUITE MASTER', 600.00),
('SINGLE STD', 180.00),
('CASAL STD', 300.00),
('CASAL LUXO', 400.00),
('SINGLE LUXO', 250.00),
('SUITE MASTER', 600.00);

-- INSERINDO RESERVAS
INSERT INTO RESERVA (DT_ENT, DT_SAI, STATUS, COD_HOSP, NUM_QUA) VALUES
('2025-10-10', '2025-10-15', 'LIBERADO', 1, 1),
('2025-11-05', '2025-11-10', 'AGUARDANDO CONFIRMAÇÃO', 2, 2),
('2025-12-01', '2025-12-05', 'PENDENTE', 3, 3),
('2025-10-20', '2025-10-25', 'LIBERADO', 4, 4),
('2025-11-15', '2025-11-18', 'LIBERADO', 5, 5),
('2025-10-09', '2025-10-11', 'PENDENTE', 6, 6),
('2025-12-22', '2025-12-27', 'AGUARDANDO CONFIRMAÇÃO', 7, 7),
('2025-10-13', '2025-10-16', 'LIBERADO', 8, 8),
('2025-10-25', '2025-10-30', 'PENDENTE', 9, 9),
('2025-11-02', '2025-11-07', 'LIBERADO', 10, 10);

-- INSERINDO PAGAMENTOS
INSERT INTO PAGAMENTO (FORMA, DATA_PAG, VALOR_PAG, NUM_RSV) VALUES
('PIX', '2025-10-09', 900.00, 1),
('CRÉDITO', '2025-11-04', 1250.00, 2),
('DINHEIRO', '2025-12-01', 1200.00, 3),
('DÉBITO', '2025-10-19', 2000.00, 4),
('PIX', '2025-11-14', 1800.00, 5),
('DINHEIRO', '2025-10-08', 360.00, 6),
('CRÉDITO', '2025-12-21', 1500.00, 7),
('DÉBITO', '2025-10-12', 1200.00, 8),
('PIX', '2025-10-24', 1250.00, 9),
('CRÉDITO', '2025-11-01', 3000.00, 10);
