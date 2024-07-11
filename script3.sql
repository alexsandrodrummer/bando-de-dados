#Codigo adaptado em PostgreeSQL
#PostgreSQL usa SERIAL para incremento automático.
#Tipo de dado DOUBLE: Em PostgreSQL, você pode continuar usando DOUBLE PRECISION ou NUMERIC.

CREATE TABLE TIPO_PRODUTO (
  ID SERIAL PRIMARY KEY,
  DESCRICAO VARCHAR(50) NOT NULL
);

CREATE TABLE TIPO_PAGTO (
  ID SERIAL PRIMARY KEY,
  DESCRICAO VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUTOS (
  ID SERIAL PRIMARY KEY,
  DESCRICAO VARCHAR(50) NOT NULL,
  VALOR NUMERIC(10, 2) NOT NULL,
  ID_TIPO_PRODUTO INT NOT NULL REFERENCES TIPO_PRODUTO(ID)
);

CREATE TABLE PEDIDOS (
  ID SERIAL PRIMARY KEY,
  DATA TIMESTAMP NOT NULL,
  ID_TIPO_PAGTO INT NOT NULL REFERENCES TIPO_PAGTO(ID),
  VALOR_TOTAL NUMERIC(10, 2) NOT NULL
);

CREATE TABLE PEDIDOS_PRODUTOS (
  ID SERIAL PRIMARY KEY,
  ID_PEDIDO INT NOT NULL REFERENCES PEDIDOS(ID),
  ID_PRODUTO INT NOT NULL REFERENCES PRODUTOS(ID),
  QTDE INT NOT NULL,
  VALOR_UNIT NUMERIC(10, 2) NOT NULL,
  VALOR_TOTAL NUMERIC(10, 2) NOT NULL
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
