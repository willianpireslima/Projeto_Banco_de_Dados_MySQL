create database shop_online;
use shop_online;

create table cliente (
id_cliente mediumint,
nome varchar(20),
endereco varchar(20),
contato varchar(10),
primary key (id_cliente)
);

-- Dados para a tabela "cliente"
INSERT INTO cliente (id_cliente, nome, endereco, contato) VALUES
(1, 'João', 'Rua A, 123', '1234567890'),
(2, 'Maria', 'Rua B, 456', '9876543210'),
(3, 'Pedro', 'Rua C, 789', '1112223333');

create table transportadora (
id_transportadora mediumint,
nome_transpor varchar (20),
primary key (id_transportadora)
);

-- Dados para a tabela "transportadora"
INSERT INTO transportadora (id_transportadora, nome_transpor) VALUES
(1, 'Transportadora A'),
(2, 'Transportadora B'),
(3, 'Transportadora C');

create table encomenda (
id_encomenda mediumint,
encomenda_data date,
quantia smallint,
id_cliente mediumint,
id_transportadora mediumint,
primary key (id_encomenda),
foreign key (id_cliente) references cliente(id_cliente),
foreign key (id_transportadora) references transportadora(id_transportadora)
);

-- Dados para a tabela "encomenda"
INSERT INTO encomenda (id_encomenda, encomenda_data, quantia, id_cliente, id_transportadora) VALUES
(1, '2024-02-15', 5, 1, 1),
(2, '2024-02-16', 3, 2, 2),
(3, '2024-02-17', 7, 3, 3);

create table produto (
id_produto mediumint,
nome varchar(20),
preco decimal (10,2),
disponivel enum ("SIM","NAO"),
categoria varchar(20),
id_encomenda mediumint,
primary key (id_produto),
foreign key (id_encomenda) references encomenda(id_encomenda)
);

-- Dados para a tabela "produto"
INSERT INTO produto (id_produto, nome, preco, disponivel, categoria, id_encomenda) VALUES
(1, 'Produto A', 50.00, 'SIM', 'Categoria 1', 1),
(2, 'Produto B', 30.00, 'SIM', 'Categoria 2', 2),
(3, 'Produto C', 70.00, 'SIM', 'Categoria 3', 3);

create table encomenda_produto (
id_encomenda mediumint,
id_produto mediumint,
foreign key (id_encomenda) references encomenda(id_encomenda),
foreign key (id_produto) references produto(id_produto)
);

-- Dados para a tabela "encomenda_produto"
INSERT INTO encomenda_produto (id_encomenda, id_produto) VALUES
(1, 1),
(2, 2),
(3, 3);

create table fornecedor (
id_fornecedor mediumint,
nome varchar(20),
endereco varchar(20),
id_produto mediumint,
primary key (id_fornecedor),
foreign key (id_produto) references produto(id_produto)
);

-- Dados para a tabela "fornecedor"
INSERT INTO fornecedor (id_fornecedor, nome, endereco, id_produto) VALUES
(1, 'Fornecedor A', 'Endereço A', 1),
(2, 'Fornecedor B', 'Endereço B', 2),
(3, 'Fornecedor C', 'Endereço C', 3);

create table sites (
id_sites mediumint,
nome_site varchar (20),
url_site varchar (20),
id_produto mediumint,
primary key (id_sites),
foreign key (id_produto) references produto(id_produto)
);

-- Dados para a tabela "sites"
INSERT INTO sites (id_sites, nome_site, url_site, id_produto) VALUES
(1, 'Site A', 'http://siteA.com', 1),
(2, 'Site B', 'http://siteB.com', 2),
(3, 'Site C', 'http://siteC.com', 3);