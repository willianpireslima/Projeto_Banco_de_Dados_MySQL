create database rh;
use rh;

/*Criando a tabela e inserindo dados em departamento*/
CREATE TABLE departamento (
id_departamento smallint,
nome_departamento varchar(40),
tipo_departamento varchar(40),
PRIMARY KEY (id_departamento)
);

INSERT INTO departamento VALUES 
(1,	"Vendas","Departamento comercial"),
(2,	"Recursos Humanos",	"Departamento administrativo"),
(3,	"Tecnologia da Informação",	"Departamento de suporte");

/*Criando a tabela e inserindo dados em login*/
CREATE TABLE login (
id_login  smallint,
nome_login varchar(40),
nome_senha varchar(40),
PRIMARY KEY (id_login)
);

INSERT INTO login VALUES 
(1,	"maria.silva","senha"),
(2,	"joao.mendes","senha"),
(3,	"ana.costa","senha");

/*Criando a tabela e inserindo dados em papel*/
CREATE TABLE papel (
id_papel  smallint,
nome_papel varchar(40),
PRIMARY KEY (id_papel)
);

INSERT INTO papel  VALUES 
(1,	"Vendedor"),
(2,	"Analista de RH"),
(3,	"Técnico de Suporte");

/*Criando a tabela e inserindo dados em empregados*/
CREATE TABLE empregados (
id_empregado smallint,
id_departamento smallint,
id_login  smallint,
id_papel  smallint,
nome varchar (40),
nascimento date ,
email varchar (40),
PRIMARY KEY (id_empregado),
FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento),
FOREIGN KEY (id_login) REFERENCES login(id_login),
FOREIGN KEY (id_papel) REFERENCES papel(id_papel)
);

INSERT INTO empregados VALUES 
(1,1,1,1,"Maria Silva","1980-01-01","maria.silva@empresa.com"),
(2,2,2,2,"João Mendes","1975-12-31","joao.mendes@empresa.com"),
(3,3,3,3,"Ana Costa","1990-05-15","ana.costa@empresa.com");

/*Craindo as Views*/
CREATE VIEW principal_empregados AS
SELECT id_empregado, nome,email
FROM empregados
WHERE id_empregado > 1;

CREATE VIEW principal_departamento AS
SELECT nome_departamento, tipo_departamento
FROM departamento;

CREATE VIEW principal_login AS
SELECT nome_login, nome_senha
FROM login;

CREATE VIEW principal_papel AS
SELECT nome_papel 
FROM papel;

-- SELECT * FROM principal_empregados;
-- SELECT * FROM principal_departamento;
-- SELECT * FROM principal_login;
-- SELECT * FROM principal_papel;