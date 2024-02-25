create database musica;
use musica;

create table artista (
id_artista smallint,
nome_artista varchar(20),
primary key (id_artista)
);

-- Dados para a tabela "artista"
INSERT INTO artista (id_artista, nome_artista) VALUES
(1, 'Michael Jackson'),
(2, 'The Beatles'),
(3, 'Queen');

create table album (
id_artista smallint,
id_album smallint,
nome_album varchar(20),
primary key (id_album,nome_album),  -- Chave primária composta
foreign key (id_artista) references artista(id_artista)
);

-- Dados para a tabela "album"
INSERT INTO album (id_artista, id_album, nome_album) VALUES
(1, 1, 'Thriller'),
(2, 2, 'Abbey Road'),
(3, 3, 'A Night at the Opera');

create table faixa (
id_faixa smallint,
nome_faixa varchar(20),
duracao tinyint,
id_album smallint,
primary key (id_faixa,nome_faixa,duracao),
foreign key (id_album) references album(id_album)
);

-- Dados para a tabela "faixa"
INSERT INTO faixa (id_faixa, nome_faixa, duracao, id_album) VALUES
(1, 'Billie Jean', 4, 1),
(2, 'Come Together', 3, 2),
(3, 'Bohemian Rhapsody', 6, 3);

create table tocado (
id_faixa smallint,
tocado_hora DATETIME,
primary key (tocado_hora),
foreign key (id_faixa) references faixa(id_faixa)
);

-- Dados para a tabela "tocado"
INSERT INTO tocado (id_faixa, tocado_hora) VALUES
(1, '2024-02-15 10:00:00'), -- "Billie Jean" tocada às 10:00:00
(2, '2024-02-15 11:00:00'), -- "Come Together" tocada às 11:00:00
(3, '2024-02-15 12:00:00'); -- "Bohemian Rhapsody" tocada às 12:00:00
