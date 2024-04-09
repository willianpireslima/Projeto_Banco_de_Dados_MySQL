CREATE DATABASE  IF NOT EXISTS sistembank;
USE sistembank;

/*Table structure for table banco*/;

CREATE TABLE banco (
  id_banco smallint NOT NULL,
  PRIMARY KEY (id_banco)
);

/*Dumping data for table banco*/;

INSERT INTO banco VALUES (1),(2),(3),(4),(5);

/*Table structure for table banco_conta*/;

CREATE TABLE banco_conta (
  id_banco_conta smallint NOT NULL,
  balaco mediumint DEFAULT NULL,
  id_banco smallint DEFAULT NULL,
  id_cliente smallint DEFAULT NULL,
  PRIMARY KEY (id_banco_conta)
);

/*Dumping data for table banco_conta*/;

INSERT INTO banco_conta VALUES 
(1,5000,1,1),
(2,7000,2,2),
(3,3000,3,3),
(4,10000,4,4),
(5,8000,5,5);

/*Table structure for table cliente*/;

CREATE TABLE cliente (
  id_cliente smallint NOT NULL,
  nome_cliente varchar(20) DEFAULT NULL,
  PRIMARY KEY (id_cliente)
);

/*Dumping data for table cliente*/;

INSERT INTO cliente VALUES 
(1,'João'),
(2,'Maria'),
(3,'Pedro'),
(4,'Ana'),
(5,'Carlos');

/*Table structure for table transacao*/;

CREATE TABLE transacao (
  id_trasacao smallint NOT NULL,
  moeda varchar(10) DEFAULT NULL,
  hora_transacao timestamp NULL DEFAULT NULL,
  quantia decimal(10,2) DEFAULT NULL,
  conta_depositante smallint DEFAULT NULL,
  conta_retirante smallint DEFAULT NULL,
  PRIMARY KEY (id_trasacao)
);

/*Dumping data for table transacao*/;

INSERT INTO transacao VALUES 
(1,'USD','2024-02-15 12:30:00',1000.00,1,2),
(2,'EUR','2024-02-15 13:00:00',2000.00,3,4),
(3,'GBP','2024-02-15 13:30:00',1500.00,5,1),
(4,'USD','2024-02-15 14:00:00',3000.00,2,3),
(5,'EUR','2024-02-15 14:30:00',2500.00,4,5);

ALTER TABLE banco_conta ADD CONSTRAINT banco_conta_ibfk_1 FOREIGN KEY (id_banco) REFERENCES banco (id_banco);
ALTER TABLE banco_conta ADD CONSTRAINT banco_conta_ibfk_2 FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);
ALTER TABLE transacao ADD CONSTRAINT transacao_ibfk_1 FOREIGN KEY (conta_depositante) REFERENCES banco_conta (id_banco_conta);
ALTER TABLE transacao ADD CONSTRAINT transacao_ibfk_2 FOREIGN KEY (conta_retirante) REFERENCES banco_conta (id_banco_conta);