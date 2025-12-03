CREATE TABLE funcionario (
 id_func SERIAL PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 email VARCHAR(120) UNIQUE NOT NULL,
 departamento VARCHAR(50) NOT NULL,
 salario NUMERIC(10,2) NOT NULL,
 ativo BOOLEAN DEFAULT TRUE
);
CREATE TABLE projeto (
 id_proj SERIAL PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 data_inicio DATE NOT NULL,
 data_fim DATE,
 status VARCHAR(20) DEFAULT 'Em andamento'
);
CREATE TABLE func_projeto (
 id_func INT REFERENCES funcionario(id_func),
 id_proj INT REFERENCES projeto(id_proj),
 papel VARCHAR(50) NOT NULL,
 PRIMARY KEY (id_func, id_proj)
);
CREATE TABLE auditoria_salario (
 id_aud SERIAL PRIMARY KEY,
 id_func INT NOT NULL,
 salario_antigo NUMERIC(10,2),
 salario_novo NUMERIC(10,2),
 data_alteracao TIMESTAMP DEFAULT NOW(),
 usuario_sistema TEXT
);
CREATE TABLE log_evento (
 id_log SERIAL PRIMARY KEY,
 usuario TEXT NOT NULL,
 tabela_afetada TEXT NOT NULL,
 operacao TEXT NOT NULL,
 data_hora TIMESTAMP DEFAULT NOW()
);