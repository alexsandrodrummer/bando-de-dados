#Codigo adaptado em MySQL

#MySQL usa AUTO_INCREMENT em vez de AUTOINCREMENT.
#Tipo de dado DOUBLE: Em MySQL, você pode usar DECIMAL para valores monetários.

CREATE TABLE TIPO_PRODUTO (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  DESCRICAO VARCHAR(50) NOT NULL
);

CREATE TABLE TIPO_PAGTO (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  DESCRICAO VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUTOS (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  DESCRICAO VARCHAR(50) NOT NULL,
  VALOR DECIMAL(10, 2) NOT NULL,
  ID_TIPO_PRODUTO INT NOT NULL,
  FOREIGN KEY (ID_TIPO_PRODUTO) REFERENCES TIPO_PRODUTO(ID)
);

CREATE TABLE PEDIDOS (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  DATA DATETIME NOT NULL,
  ID_TIPO_PAGTO INT NOT NULL,
  VALOR_TOTAL DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (ID_TIPO_PAGTO) REFERENCES TIPO_PAGTO(ID)
);

CREATE TABLE PEDIDOS_PRODUTOS (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  ID_PEDIDO INT NOT NULL,
  ID_PRODUTO INT NOT NULL,
  QTDE INT NOT NULL,
  VALOR_UNIT DECIMAL(10, 2) NOT NULL,
  VALOR_TOTAL DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDOS(ID),
  FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTOS(ID)
);

INSERT INTO TIPO_PRODUTO(DESCRICAO) VALUES ('CONSUMO'), ('VENDA');
INSERT INTO TIPO_PAGTO(DESCRICAO) VALUES ('A VISTA'), ('A PRAZO');
INSERT INTO PRODUTOS(DESCRICAO, VALOR, ID_TIPO_PRODUTO) VALUES 
  ('SABÃO EM PÓ 2KG', '17.00', 1),
  ('COXINHA', '5.00', 2),
  ('EMPADINHA', '7.00', 2),
  ('BOLO PEDAÇO', '7.50', 2),
  ('DETERGENTE 5 LITROS', '8.00', 1),
  ('PASTEL', '6.00', 2),
  ('PIZZA PEDAÇO', '7.00', 2),
  ('SUCO', '7.00', 2);

INSERT INTO PEDIDOS(DATA, ID_TIPO_PAGTO, VALOR_TOTAL) VALUES 
  ('2020-07-27', 1, '16.00'),
  ('2020-08-05', 2, '27.00'),
  ('2020-08-06', 1, '13.50');

INSERT INTO PEDIDOS_PRODUTOS(ID_PEDIDO, ID_PRODUTO, QTDE, VALOR_UNIT, VALOR_TOTAL) VALUES 
  (1, 2, 2, '5.00', '10.00'),
  (1, 6, 1, '6.00', '6.00'),
  (2, 3, 3, '7.00', '21.00'),
  (2, 6, 1, '6.00', '6.00'),
  (3, 4, 1, '7.50', '7.50'),
  (3, 6, 1, '6.00', '6.00');

DELETE FROM PEDIDOS_PRODUTOS WHERE ID IN (1, 2, 3, 4, 5, 6);
DELETE FROM PRODUTOS WHERE ID IN (1, 2, 3, 4, 5, 6, 7, 8);
DELETE FROM PEDIDOS WHERE ID IN (1, 2, 3);
DELETE FROM TIPO_PRODUTO WHERE ID IN (1, 2);
DELETE FROM TIPO_PAGTO WHERE ID IN (1, 2);

