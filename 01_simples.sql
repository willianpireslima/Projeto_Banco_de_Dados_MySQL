create database simples;
use simples;

CREATE TABLE Produto (
    id_produto SMALLINT,
    nome_produto VARCHAR(50),
    preco DECIMAL(10, 2),
    PRIMARY KEY (id_produto)
);

CREATE TABLE Pedido (
    id_pedido SMALLINT ,
    data_pedido DATE,
    quantidade INT,
    id_produto SMALLINT,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

INSERT INTO Produto (id_produto, nome_produto, preco) VALUES
(102, 'Laptop', 1200.00),
(106, 'Smartphone', 800.00),
(107, 'Fone', 10.00),
(109, 'Lavadora', 1200.00),
(110, 'Batedeira', 60.00),
(123, 'TV', 100.00),
(145, 'Cafeteira', 1200.00),
(155, 'Forno', 60.00),
(160, 'Microondas', 100.00),
(170, 'Fogao', 100.00);

INSERT INTO Pedido  VALUES
(200, '2024-02-15', 1, 102),
(203, '2024-02-16', 2, 106),
(208, '2024-02-17', 1, 107),
(212, '2024-02-18', 3, 109),
(215, '2024-02-15', 1, 123),
(230, '2024-02-16', 2, 145),
(256, '2024-02-17', 1, 155),
(278, '2024-02-18', 3, 160),
(280, '2024-02-15', 1, 170);