create database manufatura;
use manufatura;

create table funcionario (
id_funcionario mediumint,
nome varchar(20),
posicao varchar(20),
pagamento decimal (7,2),
id_supervisor mediumint,
primary key (id_funcionario),
foreign key (id_supervisor) references funcionario(id_funcionario)
);

-- Dados para a tabela "funcionario"
INSERT INTO funcionario (id_funcionario, nome, posicao, pagamento, id_supervisor) VALUES
(1, 'João', 'Gerente', 5000.00, NULL), -- João é o gerente da fábrica 1
(2, 'Maria', 'Supervisor', 3000.00, 1), -- Maria é supervisora na fábrica 1, reportando para João
(3, 'Pedro', 'Operário', 2000.00, 2),  -- Pedro é um operário na fábrica 1, reportando para Maria
(4, 'Ana', 'Gerente', 5500.00, NULL),  -- Ana é o gerente da fábrica 2
(5, 'Carlos', 'Supervisor', 3200.00, 4),-- Carlos é supervisor na fábrica 2, reportando para Ana
(6, 'Mariana', 'Operário', 2100.00, 5);-- Mariana é um operário na fábrica 2, reportando para Carlos

create table fabrica (
id_fabrica  mediumint,
id_gerente mediumint,
cidade varchar (20),
primary key (id_fabrica)
);
-- Dados para a tabela "fabrica"
INSERT INTO fabrica (id_fabrica, id_gerente, cidade) VALUES
(1, 1, 'São Paulo'), -- Fábrica 1 é gerenciada por João e está localizada em São Paulo
(2, 4, 'Rio de Janeiro'); -- Fábrica 2 é gerenciada por Ana e está localizada no Rio de Janeiro

ALTER TABLE fabrica ADD CONSTRAINT FK_id_gerente FOREIGN KEY (id_gerente) REFERENCES funcionario (id_funcionario);