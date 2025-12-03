--ATIVIDADES
-- 1 Trigger de auditoria de salário
-- Crie um trigger que registre qualquer alteração no campo salario da tabela funcionario na tabela auditoria_salario.

-- CREATE OR REPLACE FUNCTION ALTERACAO_SALARIO()
-- RETURNS TRIGGER AS $$
-- BEGIN
-- 	IF NEW.SALARIO <> OLD.SALARIO THEN
-- 		INSERT INTO AUDITORIA_SALARIO(ID_FUNC, SALARIO_ANTIGO, SALARIO_NOVO, DATA_ALTERACAO, USUARIO_SISTEMA)
-- 		VALUES(OLD.ID_FUNC, OLD.SALARIO, NEW.SALARIO, CURRENT_TIMESTAMP, CURRENT_USER);
-- 	END IF;
-- 	RETURN NEW;
-- END;
-- $$ LANGUAGE PLPGSQL;

-- CREATE TRIGGER TG_ALTERACAO_SALARIO
-- AFTER UPDATE
-- ON FUNCIONARIO
-- FOR EACH ROW
-- EXECUTE PROCEDURE ALTERACAO_SALARIO();

-- 2 Trigger para impedir salário negativo (validacao BEFORE)
-- Crie um trigger BEFORE UPDATE/INSERT na tabela funcionario que bloqueie salários inválidos.

-- CREATE OR REPLACE FUNCTION SALARIO_INVALIDO()
-- RETURNS TRIGGER AS $$
-- BEGIN
-- 	IF NEW.SALARIO < 0 OR NEW.SALARIO IS NULL THEN
-- 		RAISE EXCEPTION 'Não é possível cadastrar um salário negativo ou inexistente';
-- 	END IF;
-- 	RETURN NEW;
-- END;
-- $$ LANGUAGE PLPGSQL;

-- CREATE TRIGGER TG_SALARIO_INVALIDO
-- BEFORE UPDATE OR INSERT ON FUNCIONARIO
-- FOR EACH ROW
-- EXECUTE PROCEDURE SALARIO_INVALIDO();

-- 3 Trigger para registrar ações na tabela log_evento
-- A empresa deseja rastrear operações sobre a tabela projeto. Crie um trigger que registre insert, update e delete na tabela log_evento.

-- CREATE OR REPLACE FUNCTION ALTERACAO_PROJETO()
-- RETURNS TRIGGER AS $$
-- BEGIN
-- 	INSERT INTO LOG_EVENTO(USUARIO, TABELA_AFETADA, OPERACAO, DATA_HORA)
-- 	VALUES(CURRENT_USER, TG_TABLE_NAME, TG_OP, CURRENT_TIMESTAMP);
-- 	RETURN NEW;
-- END;
-- $$ LANGUAGE PLPGSQL;

-- CREATE TRIGGER TG_ALTERACAO_PROJETO
-- AFTER INSERT OR UPDATE OR DELETE ON PROJETO
-- FOR EACH ROW
-- EXECUTE PROCEDURE ALTERACAO_PROJETO();

-- 4 Trigger para atualizar status do projeto automaticamente
-- Quando o campo data_fim for preenchido, o projeto deve ser marcado como “Concluído”. Crie um trigger AFTER UPDATE na tabela projeto.

-- CREATE OR REPLACE FUNCTION CONCLUIR_PROJETO()
-- RETURNS TRIGGER AS $$
-- BEGIN
-- 	IF NEW.DATA_FIM IS NOT NULL AND OLD.DATA_FIM IS NULL THEN
-- 		NEW.STATUS := 'Concluído';
-- 	END IF;
-- 	RETURN NEW;
-- END;
-- $$ LANGUAGE PLPGSQL;

-- CREATE TRIGGER TG_CONCLUIR_PROJETO
-- AFTER UPDATE ON PROJETO
-- FOR EACH ROW
-- EXECUTE PROCEDURE CONCLUIR_PROJETO();

-- 5 Trigger para impedir exclusão de funcionário vinculado a projeto
-- Não é permitido remover um funcionário que esteja participando de algum projeto. Crie um trigger BEFORE DELETE.

-- CREATE OR REPLACE FUNCTION REMOVER_FUNCIONARIO()
-- RETURNS TRIGGER AS $$
-- DECLARE VINCULO INTEGER;
-- BEGIN
-- 	SELECT COUNT(*)
-- 	INTO VINCULO
-- 	FROM FUNC_PROJETO
-- 	WHERE ID_FUNC = OLD.ID_FUNC;
	
-- 	IF VINCULO > 0 THEN
-- 		RAISE EXCEPTION 'Não é possível excluir um funcionário que está em um projeto';
-- 	END IF;
-- 	RETURN OLD;
-- END;
-- $$ LANGUAGE PLPGSQL;

-- CREATE TRIGGER TG_REMOVER_FUNCIONARIO
-- BEFORE DELETE ON FUNCIONARIO
-- FOR EACH ROW
-- EXECUTE PROCEDURE REMOVER_FUNCIONARIO();

-- 6 Permitir gerente alterar tabela projeto. 
-- Gerentes devem poder inserir e atualizar projetos.

-- GRANT INSERT, UPDATE ON PROJETO TO GRUPO_GERENTE;
-- GRANT ALL ON ALL SEQUENCES IN SCHEMA PUBLIC TO GRUPO_GERENTE;

-- 7 Exercício de permissões — permitir RH atualizar apenas salário
-- Dê permissão ao grupo RH para atualizar SOMENTE o campo salário

-- GRANT UPDATE ON FUNCIONARIO TO GRUPO_RH;

-- 8 Exercício de permissões — proibir estagiário de alterar funcionário
-- Remova qualquer permissão de UPDATE do grupo estagiário na tabela funcionário.

--REVOKE UPDATE ON FUNCIONARIO FROM GRUPO_ESTAGIARIO

-- 9 Trigger para bloquear alterações de registros inativos
-- Se ativo = FALSE, nenhum campo pode ser alterado. Crie um trigger BEFORE UPDATE.

-- CREATE OR REPLACE FUNCTION REGISTRO_INATIVO()
-- RETURNS TRIGGER AS $$
-- BEGIN
-- 	IF OLD.ATIVO = FALSE THEN
-- 		RAISE EXCEPTION 'Não é possível alterar nenhum campo de um funcionário inativo';
-- 	END IF;
-- 	RETURN NEW;
-- END;
-- $$ LANGUAGE PLPGSQL;

-- CREATE TRIGGER TG_REGISTRO_INATIVO
-- BEFORE UPDATE ON FUNCIONARIO
-- FOR EACH ROW
-- EXECUTE PROCEDURE REGISTRO_INATIVO();

-- 10 Trigger que registra o usuário que adicionou funcionário ao projeto
-- Toda inclusão na tabela func_projeto deve gerar um registro com o usuário que executou a ação. Crie um trigger AFTER INSERT.

-- CREATE OR REPLACE FUNCTION ALTERACAO_FUNC_PROJETO()
-- RETURNS TRIGGER AS $$
-- BEGIN
-- 	INSERT INTO LOG_EVENTO(USUARIO, TABELA_AFETADA, OPERACAO, DATA_HORA)
-- 	VALUES(CURRENT_USER, TG_TABLE_NAME, TG_OP, CURRENT_TIMESTAMP);
-- 	RETURN NEW;
-- END;
-- $$ LANGUAGE PLPGSQL;

-- CREATE TRIGGER TG_ALTERACAO_FUNC_PROJETO
-- AFTER INSERT ON FUNC_PROJETO
-- FOR EACH ROW
-- EXECUTE PROCEDURE ALTERACAO_FUNC_PROJETO();

