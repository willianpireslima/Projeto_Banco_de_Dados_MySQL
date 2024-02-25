CREATE DATABASE empresa;

use empresa;

CREATE TABLE departamento (
  id_departamento varchar(10) NOT NULL,
  localizacao varchar(20) DEFAULT NULL,
  id_funcionario_Super int DEFAULT NULL,
  PRIMARY KEY (id_departamento)
);

/*Dumping data for table departamento*/

INSERT INTO departamento VALUES 
('Jornalismo','Periferia',3),
('Moda','Centro',8),
('RH','Centro',12);

/*Table structure for table dependentes*/

CREATE TABLE dependentes (
  nome varchar(20) NOT NULL,
  genero enum('M','F') DEFAULT NULL,
  nascimento date DEFAULT NULL,
  relacao enum('PAI','MAE','FILHO','FILHA','MARIDO','ESPOSA') DEFAULT NULL,
  id_funcionario int DEFAULT NULL
);

/*Dumping data for table dependentes*/

INSERT INTO dependentes VALUES 
('João','M','2005-03-15','FILHO',1),
('Maria','F','2008-07-20','FILHA',1),
('Pedro','M','1980-01-10','PAI',2),
('Ana','F','1978-09-25','MAE',2),
('Carlos','M','2010-11-03','FILHO',3),
('Sofia','F','2013-04-12','FILHA',3),
('Lucas','M','2000-06-08','FILHO',4),
('Luana','F','2002-12-17','FILHA',4),
('Márcio','M','1970-05-20','PAI',5),
('Fernanda','F','1972-11-30','MAE',5),
('Diego','M','1995-08-22','FILHO',6),
('Carolina','F','1998-02-10','FILHA',6),
('Rafael','M','2007-04-18','FILHO',7),
('Mariana','F','2010-09-05','FILHA',7),
('Gustavo','M','1992-10-28','MARIDO',8),
('Camila','F','1995-12-15','ESPOSA',8),
('Ricardo','M','1982-07-07','PAI',9),
('Juliana','F','1984-03-22','MAE',9),
('Paulo','M','2004-09-30','FILHO',10),
('Laura','F','2008-11-11','FILHA',10),
('Vino','M','2004-03-15','FILHO',12);

/*Table structure for table funcionarios*/

CREATE TABLE funcionarios (
  id_funcionario int NOT NULL AUTO_INCREMENT,
  nome varchar(30) NOT NULL,
  genero enum('M','F') DEFAULT NULL,
  nascimento date DEFAULT NULL,
  altura decimal(3,2) DEFAULT NULL,
  id_departamento varchar(10) DEFAULT NULL,
  PRIMARY KEY (id_funcionario)
);

/*Dumping data for table funcionarios*/

INSERT INTO funcionarios VALUES 
(1,'Marcelo Bastos','M','1990-05-15',1.75,'Moda'),
(2,'Maria Santos','F','1988-09-22',1.68,'Jornalismo'),
(3,'Pedro Oliveira','M','1995-03-10',1.80,'RH'),
(4,'Ana Costa','F','1992-07-18',1.60,'Moda'),
(5,'Carlos Pereira','M','1985-12-30',1.78,'Jornalismo'),
(6,'Fernanda Martins','F','1998-02-05',1.65,'RH'),
(7,'Rafaela Sousa','F','1991-11-20',1.70,'Jornalismo'),
(8,'Gustavo Santos','M','1987-04-25',1.85,'RH'),
(9,'Lucas Mendes','M','1993-08-12',1.79,'Moda'),
(10,'Aline Costa','F','1997-06-07',1.63,'Jornalismo'),
(11,'Maria Santos','F','1990-05-15',1.65,'RH'),
(12,'José Oliveira','M','1985-08-20',1.78,'Moda'),
(13,'Ana Costa','F','1992-03-10',1.70,'Jornalismo'),
(14,'Pedro Almeida','M','1988-11-25',1.85,'RH'),
(15,'Sofia Pereira','F','1995-07-08',1.60,'Moda'),
(16,'Carlos Ferreira','M','1993-09-14',1.75,'Jornalismo'),
(17,'Mariana Cardoso','F','1987-04-30',1.68,'RH'),
(18,'Ricardo Sousa','M','1991-06-22',1.80,'Jornalismo'),
(19,'Luana Martins','F','1994-02-18',1.62,'Jornalismo');

/*Table structure for table projetos*/

CREATE TABLE projetos (
  id_projeto varchar(20),
  custo int DEFAULT NULL,
  id_departamento varchar(20) DEFAULT NULL,
  PRIMARY KEY (id_projeto)
);

/*Dumping data for table projetos*/

INSERT INTO projetos VALUES 
('Andromeda',50000,'Jornalismo'),
('Cometa',70000,'Moda'),
('Magalhaes',90000,'RH');

/*Table structure for table relacaotrabalha*/

CREATE TABLE relacaotrabalha (
  id_funcionario int DEFAULT NULL,
  id_projeto varchar(20) DEFAULT NULL,
  data_inicio date DEFAULT NULL
);

/*Dumping data for table relacaotrabalha*/

INSERT INTO relacaotrabalha VALUES 
(1,'Andromeda','2020-06-08'),
(2,'Andromeda','2022-06-06'),
(3,'Andromeda','2021-06-08'),
(4,'Cometa','2022-06-08'),
(5,'Cometa','2014-06-08'),
(6,'Cometa','2015-06-08'),
(7,'Magalhaes','2011-06-08'),
(8,'Magalhaes','2010-06-08'),
(9,'Magalhaes','2012-06-08'),
(10,'Magalhaes','2010-06-08');

/*Inserido as chaves estrangeiras apos a criacao das tabelas*/
ALTER TABLE relacaotrabalha ADD CONSTRAINT FK_id_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario);
ALTER TABLE relacaotrabalha ADD CONSTRAINT FK_id_projeto FOREIGN KEY (id_projeto) REFERENCES projetos (id_projeto);
ALTER TABLE projetos ADD CONSTRAINT fk_id_departamento FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento);
ALTER TABLE funcionarios ADD CONSTRAINT fk_departamento FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento);
ALTER TABLE dependentes ADD CONSTRAINT dependentes_ibfk_1 FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id_funcionario);
ALTER TABLE departamento ADD CONSTRAINT fk_id_funcionario_Super FOREIGN KEY (id_funcionario_Super) REFERENCES funcionarios (id_funcionario);