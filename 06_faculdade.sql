CREATE DATABASE faculdade;
USE faculdade;

/*Table structure for table curso*/;
CREATE TABLE curso (
  id_curso smallint NOT NULL,
  nome varchar(20) DEFAULT NULL,
  PRIMARY KEY (id_curso)
);

/*Dumping data for table curso*/;
INSERT INTO curso (id_curso, nome) VALUES 
(1, 'Ciência Computação'),
(2, 'Engenharia Elétrica'),
(3, 'Administração');

/*Table structure for table estudante*/;
CREATE TABLE estudante (
  id_estudante smallint NOT NULL,
  nome varchar(20) DEFAULT NULL,
  endereco_rua varchar(20) DEFAULT NULL,
  endereco_bairro varchar(20) DEFAULT NULL,
  endereco_cidade varchar(20) DEFAULT NULL,
  endereco_estado varchar(20) DEFAULT NULL,
  PRIMARY KEY (id_estudante)
);

/*Dumping data for table estudante*/;
INSERT INTO estudante (id_estudante, nome, endereco_rua, endereco_bairro, endereco_cidade, endereco_estado) VALUES 
(1, 'João', 'Rua A', 'Bairro X', 'Cidade 1', 'Estado 1'),
(2, 'Maria', 'Rua B', 'Bairro Y', 'Cidade 2', 'Estado 2'),
(3, 'Pedro', 'Rua C', 'Bairro Z', 'Cidade 3', 'Estado 3');

/*Table structure for table estudante_curso*/;
CREATE TABLE estudante_curso (
  id_estudante smallint DEFAULT NULL,
  id_curso smallint DEFAULT NULL
);

/*Dumping data for table estudante_curso*/;
INSERT INTO estudante_curso (id_estudante, id_curso) VALUES 
(1, 1), -- João no curso de Ciência da Computação
(2, 2), -- Maria no curso de Engenharia Elétrica
(3, 3); -- Pedro no curso de Administração

/*Table structure for table telefone*/;
CREATE TABLE telefone (
  id_telefone tinyint NOT NULL,
  PRIMARY KEY (id_telefone)
);

/*Dumping data for table telefone*/;
INSERT INTO telefone (id_telefone) VALUES 
(1), -- Telefone 1
(2), -- Telefone 2
(3); -- Telefone 3

CREATE TABLE estudante_telefone (
  id_telefone tinyint DEFAULT NULL,
  id_estudante smallint DEFAULT NULL
);

/*Dumping data for table estudante_telefone*/;
INSERT INTO  estudante_telefone VALUES 
(1, 1), -- Telefone de João
(2, 2), -- Telefone de Maria
(3, 3); -- Telefone de Pedro


/*Table structure for table professor*/;
CREATE TABLE professor (
  id_professor smallint NOT NULL,
  nome varchar(20) DEFAULT NULL,
  id_estudante smallint DEFAULT NULL,
  PRIMARY KEY (id_professor)
);

/*Dumping data for table professor*/;
INSERT INTO professor (id_professor, nome, id_estudante) VALUES 
(1, 'Ana', 1), -- Ana é professor, mas não é estudante
(2, 'Carlos', 2), -- Carlos é professor, mas não é estudante
(3, 'Mariana', 2); -- Mariana é professor, mas não é estudante

/*Table structure for table materia*/;
CREATE TABLE materia (
  id_materia smallint NOT NULL,
  nome varchar(20) DEFAULT NULL,
  id_professor smallint DEFAULT NULL,
  id_curso smallint DEFAULT NULL,
  PRIMARY KEY (id_materia)
);

/*Dumping data for table materia*/;
INSERT INTO materia (id_materia, nome, id_professor, id_curso) VALUES 
(1, 'Matemática', 1, 1), -- Matemática é ensinada pelo Professor 1 no curso de Ciência da Computação
(2, 'Física', 2, 2), -- Física é ensinada pelo Professor 2 no curso de Engenharia Elétrica
(3, 'Economia', 3, 3); -- Economia é ensinada pelo Professor 3 no curso de Administração

/*Table structure for table professor_curso*/;
CREATE TABLE professor_curso (
  id_professor smallint DEFAULT NULL,
  id_curso smallint DEFAULT NULL
);

/*Dumping data for table professor_curso*/;
INSERT INTO professor_curso (id_professor, id_curso) VALUES 
(1, 1), -- Ana leciona no curso de Ciência da Computação
(2, 2), -- Carlos leciona no curso de Engenharia Elétrica
(3, 3); -- Mariana leciona no curso de Administração

ALTER TABLE estudante_curso ADD CONSTRAINT estudante_curso_ibfk_1 FOREIGN KEY (id_estudante) REFERENCES estudante (id_estudante);
ALTER TABLE estudante_curso ADD CONSTRAINT estudante_curso_ibfk_2 FOREIGN KEY (id_curso) REFERENCES curso (id_curso);
ALTER TABLE estudante_telefone ADD CONSTRAINT estudante_telefone_ibfk_1 FOREIGN KEY (id_telefone) REFERENCES telefone (id_telefone);
ALTER TABLE estudante_telefone ADD CONSTRAINT estudante_telefone_ibfk_2 FOREIGN KEY (id_estudante) REFERENCES estudante (id_estudante);
ALTER TABLE professor ADD CONSTRAINT professor_ibfk_1 FOREIGN KEY (id_estudante) REFERENCES estudante (id_estudante);
ALTER TABLE materia  ADD CONSTRAINT id_curso_ibfk_1 FOREIGN KEY (id_curso) REFERENCES curso (id_curso);
ALTER TABLE materia  ADD CONSTRAINT materia_ibfk_1 FOREIGN KEY (id_professor) REFERENCES professor (id_professor);
ALTER TABLE professor_curso  ADD CONSTRAINT professor_curso_ibfk_1 FOREIGN KEY (id_professor) REFERENCES professor (id_professor);
ALTER TABLE professor_curso  ADD CONSTRAINT professor_curso_ibfk_2 FOREIGN KEY (id_curso) REFERENCES curso (id_curso);
