# Exercício 2 - Pizzaria

Este projeto modela e implementa a base de dados de uma pizzaria com atendimento presencial e entrega a domicílio.  
O objetivo é gerenciar clientes, pedidos, produtos, lojas e funcionários de forma estruturada.

---

## Entidades modeladas

- cliente: nome, sobrenome, endereço completo, cep, cidade, estado e telefone
- loja: endereço completo da unidade, cidade, estado e cep
- funcionario: nome, sobrenome, NIF, telefone, cargo (cozinheiro ou entregador), e a loja onde trabalha
- categoria: nome da categoria das pizzas (ex: Tradicionais, Especiais)
- produto: nome, descrição, imagem, preço, tipo (pizza, hamburguer ou bebida), categoria (apenas se for pizza)
- pedido: data, cliente, loja, tipo de entrega (retirada ou domicílio), entregador (se for o caso), e valor total
- pedido_produto: produtos e quantidades incluídos em cada pedido

---

## Relacionamentos e requisitos funcionais atendidos

- **"Cada cliente pode realizar pedidos..."**  
  Relacionamento 1:N entre cliente e pedido (`cliente_id` na tabela `pedido`).

- **"Cada pedido deve estar vinculado a uma loja e registrar se é retirada ou entrega..."**  
  Campo `loja_id` e `tipo_entrega` na tabela `pedido`. Se for entrega, também registra o `entregador_id`.

- **"Produtos disponíveis: pizzas, hambúrgueres e bebidas. Pizzas pertencem a uma categoria."**  
  Campo `tipo` define o tipo do produto.  
  A `categoria_id` é usada apenas para produtos do tipo `pizza`.

- **"Cada pedido pode ter vários produtos com suas quantidades e preços."**  
  Relacionamento N:M implementado com a tabela `pedido_produto`, que guarda `quantidade` e `preco_unitario`.

- **"Funcionários podem ser cozinheiros ou entregadores, e estão vinculados a uma loja."**  
  Campo `cargo` (ENUM) e `loja_id` na tabela `funcionario`.

---

- **"Listar todos os pedidos com dados do cliente, loja e tipo de entrega."**  
  Consulta implementada com `JOIN` entre `pedido`, `cliente` e `loja`, ordenada por data (`data_hora`).

- **"Exibir itens de um pedido específico, incluindo subtotal."**  
  Consulta usa `JOIN` com `pedido_produto` e `produto`, incluindo cálculo `quantidade * preco_unitario`.

- **"Quantidade de entregas feitas por cada entregador."**  
  Filtra `funcionario` com cargo 'entregador' e soma apenas os pedidos do tipo `domicilio`.

- **"Quantidade de bebidas vendidas por cidade da loja."**  
  Filtra os produtos do tipo `bebida`, soma quantidades, agrupa por cidade (`loja.cidade`).

- **"Faturamento total por loja."**  
  Soma `preco_total` dos pedidos agrupados por `loja`.

---

## Estrutura dos arquivos do projeto

- `bd_pizzaria.sql`  
  Criação do banco de dados, tabelas e relacionamentos com chaves primárias e estrangeiras.

- `dados_pizzaria.sql`  
  Preenchimento do banco com dados fictícios de clientes, produtos, lojas, pedidos e funcionários.

- `consultas_pizzaria.sql`  
  Conjunto de comandos `SELECT` com cruzamentos de tabelas que respondem aos requisitos do projeto.

---

## Como gerar o DER no MySQL Workbench

1. Abra o MySQL Workbench
2. Vá em `File > New Model`
3. Acesse `Database > Reverse Engineer`
4. Conecte ao banco `pizzaria`
5. Avance e selecione todas as tabelas
6. Abra o `EER Diagram` no painel lateral
7. Ajuste o layout e exporte com `File > Export > PNG`

---
