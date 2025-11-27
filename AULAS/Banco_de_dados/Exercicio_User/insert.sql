INSERT INTO CLIENTE (NOME_CLI) VALUES
('Ana Paula'),
('João Ribeiro'),
('Marcos Silva'),
('Fernanda Santos'),
('Carlos Almeida');

INSERT INTO FINANCEIRO (PAGAMENTO, COD_CLI) VALUES
(250.75, 1),
(130.00, 2),
(499.90, 3),
(89.50, 4),
(920.00, 5);

INSERT INTO CARGO (DESCRICAO) VALUES
('Analista de Sistemas'),
('Técnico de Suporte'),
('Gerente de TI'),
('Auxiliar Administrativo'),
('Desenvolvedor Backend');

INSERT INTO FUNCIONARIO (NOME_FUNC, COD_CARGO, SALARIO) VALUES
('Bruno Martins', 1, 4500.00),
('Camila Rocha', 2, 2800.00),
('Ricardo Teixeira', 3, 7500.00),
('Juliana Moreira', 4, 2300.00),
('Henrique Lopes', 5, 6200.00);

INSERT INTO PRODUTO (NOME_PROD, PRECO) VALUES
('Mouse sem fio', 89.90),
('Teclado mecânico', 350.00),
('Monitor 24 polegadas', 899.00),
('Headset gamer', 199.90),
('Webcam HD', 120.00);

INSERT INTO VENDA (COD_PROD, COD_CLI, QTD, DATA_VENDA) VALUES
(1, 1, 2, '2025-01-10'),
(2, 3, 1, '2025-01-11'),
(4, 2, 1, '2025-01-12'),
(5, 5, 3, '2025-01-12'),
(3, 4, 1, '2025-01-13');

INSERT INTO CHAMADO (DESCRICAO, DATA_CHAMADO) VALUES
('Erro no sistema de vendas', '2025-01-10'),
('Instabilidade no servidor', '2025-01-11'),
('Solicitação de criação de usuário', '2025-01-12'),
('Problema no acesso ao banco de dados', '2025-01-13'),
('Atualização de software necessária', '2025-01-14');



