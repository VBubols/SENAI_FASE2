INSERT INTO funcionario (nome, email, departamento, salario, ativo) VALUES
('Carlos Mendes', 'carlos.mendes@empresa.com', 'TI', 5500.00, TRUE),
('Ana Pereira', 'ana.pereira@empresa.com', 'RH', 4800.00, TRUE),
('Bruno Silva', 'bruno.silva@empresa.com', 'Financeiro', 6200.00, TRUE),
('Juliana Costa', 'juliana.costa@empresa.com', 'Marketing', 5100.00, TRUE),
('Ricardo Alves', 'ricardo.alves@empresa.com', 'TI', 7000.00, TRUE);

INSERT INTO projeto (nome, data_inicio, data_fim, status) VALUES
('Sistema de Vendas', '2025-01-10', NULL, 'Em andamento'),
('Aplicativo Mobile', '2025-02-01', '2025-06-15', 'Concluído'),
('Infraestrutura Cloud', '2025-03-05', NULL, 'Em andamento'),
('Campanha de Marketing Q3', '2025-04-20', '2025-08-30', 'Concluído'),
('Automação Financeira', '2025-05-12', NULL, 'Em andamento');

INSERT INTO func_projeto (id_func, id_proj, papel) VALUES
(1, 1, 'Desenvolvedor'),
(1, 3, 'Analista'),
(2, 4, 'Coordenadora'),
(3, 5, 'Especialista'),
(5, 1, 'Líder Técnico');
