CREATE DATABASE  livros;
use livros;

/*Table structure for table autor*/;

CREATE TABLE autor (
  nome_autor varchar(20) NOT NULL,
  endereco varchar(20) DEFAULT NULL,
  PRIMARY KEY (nome_autor)
);

/*Dumping data for table autor*/;

INSERT INTO autor VALUES 
('Camus','Franca'),
('Tolkien','Inglaterra'),
('Twain','Eua');

/*Table structure for table deposito*/;

CREATE TABLE deposito (
  codigo_deposito smallint NOT NULL,
  endereco varchar(20) DEFAULT NULL,
  PRIMARY KEY (codigo_deposito)
);

/* Dumping data for table deposito*/;

INSERT INTO deposito VALUES (1456,'China'),(1934,'China'),(9078,'China');

/* Table structure for table editora*/;

CREATE TABLE editora (
  nome_editora varchar(20) NOT NULL,
  endereco varchar(20) DEFAULT NULL,
  PRIMARY KEY (nome_editora)
);

/* Dumping data for table editora*/;

INSERT INTO editora VALUES 
('Harper','EUA'),
('Pearson','EUA'),
('Penguin','EUA');

/* Table structure for table livro*/;

CREATE TABLE livro (
  ISBN tinyint NOT NULL,
  titulo_livro varchar(20) DEFAULT NULL,
  lancamento date DEFAULT NULL,
  nome_autor varchar(20) DEFAULT NULL,
  nome_editora varchar(20) DEFAULT NULL,
  codigo_deposito smallint DEFAULT NULL,
  numero_estoque smallint DEFAULT NULL,
  PRIMARY KEY (ISBN)
);

/* Dumping data for table livro*/;

INSERT INTO livro VALUES 
(1,'Dom Casmurro','2005-10-15','Tolkien','Penguin',1456,10454),
(2,'A Arte da Guerra','2010-08-23','Camus','Harper',1934,20788),
(3,'O Senhor dos Anéis','2001-04-30','Twain','Pearson',9078,14567);

/* Table structure for table livro_didatico*/;

CREATE TABLE livro_didatico (
  id_didatico tinyint NOT NULL,
  ISBN tinyint DEFAULT NULL,
  tipo enum('Matematica','Lingua Portuguesa','Historia','Fisica','Biologia','Quimica','Geografia','Filosofia') DEFAULT NULL,
  PRIMARY KEY (id_didatico)
);

/* Dumping data for table livro_didatico*/;

INSERT INTO livro_didatico VALUES 
(101,1,'Matematica'),
(102,2,'Lingua Portuguesa'),
(103,3,'Historia');

/* Table structure for table livro_idiomas*/;

CREATE TABLE livro_idiomas (
  id_idiomas smallint NOT NULL,
  ISBN tinyint DEFAULT NULL,
  tipo enum('Ingles','Alemao','Espanhol','Italiano','Frances') DEFAULT NULL,
  PRIMARY KEY (id_idiomas)
);

/* Dumping data for table livro_idiomas*/;

INSERT INTO livro_idiomas VALUES 
(201,1,'Ingles'),
(202,2,'Espanhol'),
(203,3,'Frances');

/* Table structure for table livro_literario*/;

CREATE TABLE livro_literario (
  id_literario smallint NOT NULL,
  ISBN tinyint DEFAULT NULL,
  tipo enum('Romance','Terror','Comedia','Misterio','Aventura') DEFAULT NULL,
  PRIMARY KEY (id_literario),
  KEY ISBN (ISBN),
  CONSTRAINT livro_literario_ibfk_1 FOREIGN KEY (ISBN) REFERENCES livro (ISBN)
);

/* Dumping data for table livro_literario*/;

INSERT INTO livro_literario VALUES 
(301,1,'Romance'),
(302,2,'Terror'),
(303,3,'Aventura');

/*Inserido as chaves estrangeiras apos a criacao das tabelas*/
ALTER TABLE livro ADD CONSTRAINT FK_codigo_deposito FOREIGN KEY (codigo_deposito) REFERENCES deposito (codigo_deposito);
ALTER TABLE livro ADD CONSTRAINT FK_nome_autor FOREIGN KEY (nome_autor) REFERENCES autor (nome_autor);
ALTER TABLE livro ADD CONSTRAINT FK_nome_editora FOREIGN KEY (nome_editora) REFERENCES editora (nome_editora);
ALTER TABLE  livro_didatico ADD CONSTRAINT livro_didatico_ibfk_1 FOREIGN KEY (ISBN) REFERENCES livro (ISBN);
ALTER TABLE  livro_idiomas ADD CONSTRAINT livro_idiomas_ibfk_1 FOREIGN KEY (ISBN) REFERENCES livro (ISBN);
