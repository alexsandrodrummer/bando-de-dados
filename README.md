# banco-de-dados
Mapa de banco de dados 
Um cliente solicitou sua empresa a criação de um banco de dados para armazenar os pedidos de uma lanchonete. A solicitação engloba o cadastro produtos, seus respectivos preços e tipos, além do cadastro dos clientes e a forma de pagamento de cada pedido. Após a reunião da equipe de analistas o seguinte DER (diagrama de entidade e relacionamento) foi elaborado como representação dos requisitos obtidos com o cliente:

![QUE_107784_327329_1](https://github.com/user-attachments/assets/fda9d73c-daf2-4186-a6a9-ffacb206c73e)

As tabelas a seguir contêm os dados dos pedidos:

![QUE_107784_327329_2 (2)](https://github.com/user-attachments/assets/28ae31fd-2f01-43bd-a8eb-9d0fc97ece5c)

Chaves e Referências:

 

Tabela TIPO_PRODUTO:
- ID é chave primária.
 

Tabela TIPO_PAGTO:
- ID é chave primária.
 

Tabela PRODUTOS:
- ID é chave primária.
- ID_TIPO_PRODUTO é chave estrangeira e referencia ID da tabela TIPO_PRODUTO.

Tabela PEDIDOS:
- ID é chave primária.
- ID_TIPO_PAGTO é chave estrangeira e referencia ID da tabela TIPO_PAGTO.
 

Tabela PEDIDOS_PRODUTOS:
- ID é chave primária.
- ID_PEDIDO é chave estrangeira e referencia ID da tabela PEDIDOS.
- ID_PRODUTO é chave estrangeira e referencia ID da tabela PRODUTOS.

Com base nas informações descritas no DER e tabelas apresentadas, realize as seguintes atividades:

1) Crie um script contendo os comandos de criação das tabelas (CREATE TABLE), lembrando que os tipos dos campos poderá ser ao seu critério, porém, não fugindo da necessidade do campo.
2) Crie um script contendo os comandos de inserção de dados (INSERT), onde seja feita a inserção dos dados descritos nas tabelas acima.
3) Crie os comandos para apagar o conteúdos das tabelas (DELETE).
