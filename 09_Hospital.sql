create database hospital;
use hospital;

create table paciente (
id_paciente mediumint,
nome varchar (20),
genero enum ("M","F"),
nascimento date,
notes text,
primary key(id_paciente)
);

-- Dados para a tabela "paciente"
INSERT INTO paciente (id_paciente, nome, genero, nascimento, notes) VALUES
(1, 'João', 'M', '1990-05-15', 'Paciente com histórico de alergia a penicilina.'),
(2, 'Maria', 'F', '1985-08-20', 'Paciente com pressão alta.'),
(3, 'Pedro', 'M', '1978-03-10', 'Paciente com histórico de diabetes.');

create table medico (
id_medico mediumint,
nome varchar (20),
genero enum ("M","F"),
nascimento date,
id_paciente mediumint,
primary key(id_medico),
foreign key (id_paciente) references paciente(id_paciente)
);

-- Dados para a tabela "medico"
INSERT INTO medico (id_medico, nome, genero, nascimento, id_paciente) VALUES
(1, 'Ana', 'F', '1980-11-25', 1),
(2, 'Carlos', 'M', '1975-09-30', 2),
(3, 'Mariana', 'F', '1988-06-12', 3);

create table registro (
id_registro mediumint,
data_registro date,
garantia varchar (20),
id_paciente mediumint,
primary key(id_registro),
foreign key (id_paciente) references paciente(id_paciente)
);

-- Dados para a tabela "registro"
INSERT INTO registro (id_registro, data_registro, garantia, id_paciente) VALUES
(1, '2024-02-15', 'Seguro saúde', 1),
(2, '2024-02-16', 'Particular', 2),
(3, '2024-02-17', 'Plano de saúde', 3);

create table registroMedico (
id_registroMedico mediumint,
data_registro date,
diagnostico text,
medicamentos text,
referencia text,
id_medico mediumint,
primary key(id_registroMedico),
foreign key (id_medico) references medico(id_medico)
);

-- Dados para a tabela "registroMedico"
INSERT INTO registroMedico (id_registroMedico, data_registro, diagnostico, medicamentos, referencia, id_medico) VALUES
(1, '2024-02-15', 'Febre e dor de garganta', 'Paracetamol, Amoxicilina', 'Otorrinolaringologista', 1),
(2, '2024-02-16', 'Fratura na perna', 'Imobilização, Analgésicos', 'Ortopedista', 2),
(3, '2024-02-17', 'Hipertensão', 'Anti-hipertensivos', 'Cardiologista', 3);

create table administracao (
id_administracao mediumint,
cid text,
carta text,
endosso text,
id_registroMedico mediumint,
primary key(id_administracao),
foreign key (id_registroMedico) references registroMedico(id_registroMedico)
);

-- Dados para a tabela "administracao"
INSERT INTO administracao (id_administracao, cid, carta, endosso, id_registroMedico) VALUES
(1, 'A01', 'Carta A', 'Endosso A', 1),
(2, 'B02', 'Carta B', 'Endosso B', 2),
(3, 'C03', 'Carta C', 'Endosso C', 3);

create table escritorio (
id_escritorio mediumint,
id_administracao mediumint,
recepcao text,
entrega varchar(20),
primary key(id_escritorio),
foreign key (id_administracao) references administracao(id_administracao)
);

-- Dados para a tabela "escritorio"
INSERT INTO escritorio (id_escritorio, id_administracao, recepcao, entrega) VALUES
(1, 1, 'Recepção A', 'Entrega A'),
(2, 2, 'Recepção B', 'Entrega B'),
(3, 3, 'Recepção C', 'Entrega C');