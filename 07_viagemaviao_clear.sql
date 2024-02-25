create database viagemAviao;
use viagemAviao;

create table passageiro (
id_passageiro smallint,
nome varchar(20),
email varchar(20),
primary key (id_passageiro)
);

-- Dados para a tabela "passageiro"
INSERT INTO passageiro (id_passageiro, nome, email) VALUES
(1, 'João', 'joao@example.com'),
(2, 'Maria', 'maria@example.com'),
(3, 'Pedro', 'pedro@example.com');

create table aviao (
id_aviao smallint,
capacidade smallint,
modelo varchar(20),
primary key (id_aviao)
);

-- Dados para a tabela "aviao"
INSERT INTO aviao (id_aviao, capacidade, modelo) VALUES
(1, 150, 'Boeing 737'),
(2, 200, 'Airbus A320'),
(3, 100, 'Embraer E190');

create table voo (
id_voo smallint,
origem varchar (20),
destino varchar (20),
partida_data date,
partida_hora time,
chegada_data date,
chegada_hora time,
id_aviao smallint,
primary key(id_voo),
foreign key (id_aviao ) references aviao (id_aviao )
);

-- Dados para a tabela "voo"
INSERT INTO voo (id_voo, origem, destino, partida_data, partida_hora, chegada_data, chegada_hora, id_aviao) VALUES
(1, 'São Paulo', 'Rio de Janeiro', '2024-02-20', '08:00:00', '2024-02-20', '09:30:00', 1),
(2, 'Rio de Janeiro', 'Brasília', '2024-02-21', '10:00:00', '2024-02-21', '12:00:00', 2),
(3, 'Brasília', 'Salvador', '2024-02-22', '14:00:00', '2024-02-22', '16:30:00', 3);

create table reserva (
id_passageiro smallint,
id_voo smallint,
foreign key (id_passageiro) references passageiro(id_passageiro),
foreign key (id_voo) references voo(id_voo)
);

-- Dados para a tabela "reserva"
INSERT INTO reserva (id_passageiro, id_voo) VALUES
(1, 1), -- João reservou o voo 1
(2, 2), -- Maria reservou o voo 2
(3, 3); -- Pedro reservou o voo 3