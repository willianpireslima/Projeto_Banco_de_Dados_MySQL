create database biblioteca;
use biblioteca;

/*Criando Tabela*/
create table usuario (
id_usuario smallint,
nome varchar(30),
primary key (id_usuario)
);

/*Inserindo Dados*/
insert into usuario values 
(1, 'João'),
(2, 'Maria'),
(3, 'Pedro'),
(4, 'Ana'),
(5, 'Lucas');

/*Criando Tabela*/
create table livros (
id_livro smallint,
quantidade smallint,
nome varchar(40),
categoria varchar(40),
autor varchar(40),
data_publi date,
primary key (id_livro)
);

/*Inserindo Dados*/
insert into livros values
(1, 20, 'Dom Casmurro', 'Ficção', 'Machado de Assis', '1889-01-01'),
(2, 15, '1984', 'Ficção Distópica', 'George Orwell', '1949-06-08'),
(3, 30, 'Orgulho e Preconceito', 'Romance', 'Jane Austen', '1813-01-28'),
(4, 25, 'O Pequeno Príncipe', 'Ficção Infantil', 'Antoine de Saint-Exupéry', '1943-04-06'),
(5, 18, 'A Revolução dos Bichos', 'Fábula', 'George Orwell', '1945-08-17');

create table emprestimo (
id_usuario smallint,
id_livro smallint,
data_empres date,
data_retor date,
foreign key (id_usuario) references usuario(id_usuario),
foreign key (id_livro) references  livros(id_livro)
);

create table devolucao (
id_usuario smallint,
id_livro smallint,
data_devol date,
foreign key (id_usuario) references usuario(id_usuario),
foreign key (id_livro) references  livros(id_livro)
);

/*Criando Trigers*/
CREATE TRIGGER update_qtd_livros_emp
AFTER INSERT ON emprestimo -- A trigger ira ocorrer apos ocorrer um emprestimo o livro
FOR EACH ROW
-- Atualizar a quantidade disponível de livros na tabela de inventário
UPDATE livros SET quantidade = quantidade - 1 WHERE id_livro = NEW.id_livro;

CREATE TRIGGER update_qtd_livros_devol
AFTER INSERT ON devolucao -- A trigger ira ocorrer apos ocorrer uma devolucao o livro
FOR EACH ROW
-- Atualizar a quantidade disponível de livros na tabela de inventário
UPDATE livros SET quantidade = quantidade + 1 WHERE id_livro = NEW.id_livro;

/*Inserindo Dados em Emprestimo*/
insert into emprestimo values 
(1,1,"2024-09-01","2024-09-30"),
(1,2,"2024-09-01","2024-09-30"),
(1,3,"2024-09-01","2024-09-30"),
(2,1,"2024-09-01","2024-09-30"),
(2,2,"2024-09-01","2024-09-30"),
(2,3,"2024-09-01","2024-09-30"),
(3,1,"2024-09-01","2024-09-30"),
(3,2,"2024-09-01","2024-09-30"),
(3,3,"2024-09-01","2024-09-30");

/*Inserindo Dados em devolucao*/
insert into devolucao values 
(1,1,"2024-09-20"),
(1,2,"2024-09-20"),
(2,1,"2024-09-25"),
(2,2,"2024-09-25"),
(3,1,"2024-09-28"),
(3,3,"2024-09-28");

/*Criando Stored Procedures*/

-- Funcao Basica para usar e mostrar uma variavel
DELIMITER $$
CREATE PROCEDURE basico ()
BEGIN
	DECLARE x int;
    SET x = 10;
    SELECT x;
END  $$
DELIMITER ;

-- Funcao Basica de entrada IN  e saida OUT com loop
DELIMITER $$
CREATE PROCEDURE loopWhile (IN aux SMALLINT,OUT soma int)
BEGIN
	DECLARE x int DEFAULT 0;
    
    WHILE (x < aux)DO
		SET x = x+1;
	END WHILE;
    
    SET soma = x;
END $$
DELIMITER ;

-- CALL loopWhile (20,@result); Funcao de Chamada
-- SELECT @result; mostrando a variavel chamada

-- Funcao de contagem
DELIMITER $$
CREATE PROCEDURE contar_emprestimos_usuario(IN aux SMALLINT)
BEGIN
    SELECT (SELECT COUNT(*) FROM emprestimo WHERE id_usuario = aux) as Quantia ,variavel;
END $$
DELIMITER ;

-- Funcao de Busca Simples
DELIMITER $$
CREATE PROCEDURE busca_Livro (aux smallint)
BEGIN
	SELECT * FROM livros where id_livro = aux;
END  $$
DELIMITER ;

-- Funcao de Busca com if
DELIMITER $$
CREATE PROCEDURE busca_Livro_ap (IN aux SMALLINT)
BEGIN
    DECLARE livro_existe INT;

    -- Verifica se o livro com o ID fornecido existe
    SELECT COUNT(*) INTO livro_existe FROM livros WHERE id_livro = aux;

    -- Se o livro existir, execute a consulta SELECT
    IF livro_existe > 0 THEN
        SELECT * FROM livros WHERE id_livro = aux;
    ELSE
        SELECT 'Livro não encontrado';
    END IF;
END $$
DELIMITER ;

-- funçao para mostrar uma INNER JOIN entre duas tablels
DELIMITER $$
CREATE PROCEDURE mostrar_IJ_Usuario_Emprestimo()
BEGIN
	SELECT * -- Nome da coluna(s)
	FROM usuario  -- Tabela1
	INNER JOIN emprestimo -- Tabela2
	ON usuario.id_usuario = emprestimo.id_usuario; -- colunas forem iguais
END$$
DELIMITER ;