# Exercici 1 - Òptica

Este projeto modela e implementa a base de dados de uma ótica chamada Cul d’Ampolla.
O objetivo é informatizar a gestão de clientes, vendas e fornecedores de óculos.

---

## Entidades modeladas

- fornecedor: nome, rua, número, andar, porta, cidade, código postal, país, telefone, fax e NIF
- oculos: marca, graduação esquerda e direita, tipo de armação, cor da armação, cor do vidro, preço, fornecedor
- cliente: dados pessoais, contato, data de cadastro
- funcionario: nome do funcionário que realizou vendas
- venda: registros de vendas com cliente, data e funcionário responsável
- venda_oculos: associação N:M entre vendas e óculos
- indicacoes: relacionamento entre clientes (quem indicou quem)

---

## Relacionamentos e requisitos funcionais atendidos

- **"L’òptica vol saber quin és el proveïdor de cadascuna de les ulleres..."**  
  **pt-br** A ótica quer saber qual é o fornecedor de cada um dos óculos.  
  Foi criada a tabela `fornecedor` com todos os campos exigidos, e a tabela `oculos` com o campo `fornecedor_id`, implementando um relacionamento 1:N (fornecedor:oculos).

- **"De les ulleres vol saber: la marca, la graduació..."**  
  **pt-br** Deseja-se saber detalhes técnicos e visuais dos óculos.  
  Todos os atributos foram incorporados na tabela `oculos`. 
  O relacionamento com `fornecedor` já foi descrito acima.

- **"Dels clients/es vol emmagatzemar..."**  
  **pt-br** Sobre os clientes, deseja-se armazenar: nome, endereço, telefone, e-mail e data de cadastro.  
  Criamos a tabela `cliente` com esses campos. Posteriormente, associamos cada cliente às suas compras via relacionamento 1:N (cliente:venda).

- **"Quan arriba un/a client/a nou, emmagatzemar el/la client/a que li ha recomanat."**  
  **pt-br** Registrar quem indicou o novo cliente.  
  Para isso, foi criada a tabela `indicacoes`, que representa um relacionamento entre clientes — tecnicamente, um relacionamento indireto do tipo cliente 1:N cliente, representado com `cliente_id` e `indicado_por_id`.

- **"El sistema ha d'indicar qui ha sigut l'empleat..."**  
  **pt-br** O sistema deve registrar qual funcionário vendeu cada óculos.  
  Criamos a tabela `funcionario` e a tabela `venda` com `funcionario_id`. A venda de óculos é registrada via tabela intermediária `venda_oculos`, criando os relacionamentos:
  - funcionario 1:N venda
  - venda N:M oculos (`venda_oculos`)

- **"Definiu un període de temps de les vendes."**  
  **pt-br** Definir um período de tempo para as vendas.  
  O campo `data` na tabela `venda` permite esse controle.

---
- **"Llista el total de compres d’un client/a."**  
  **pt-br** Liste o total de compras de um cliente.  
  Consulta SQL incluída em `consultas_optica.sql` usando `JOIN` entre `cliente` e `venda` com `GROUP BY` por cliente.

- **"Llista les diferents ulleres que ha venut un empleat durant un any."**  
  **pt-br** Liste os diferentes óculos que um funcionário vendeu durante um ano.  
  Implementamos consulta combinando `funcionario`, `venda`, `venda_oculos` e `oculos`, com filtro por ano (`YEAR(data) = 2025`).

- **"Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l’òptica."**  
  **pt-br** Liste os diferentes fornecedores que forneceram óculos vendidos com sucesso.  
  Consulta feita via `JOIN` entre `fornecedor`, `oculos` e `venda_oculos`, com uso de `DISTINCT`.

## Estrutura dos arquivos do projeto
- `bd_optica.sql`
  Contém a criação do banco de dados e todas as tabelas com chaves primárias, estrangeiras e estrutura relacional. Representa a modelagem do sistema da ótica.

- `dados_optica.sql`
  Preenche o banco com dados fictícios, simulando fornecedores, óculos, clientes, funcionários e vendas. Serve para testar o modelo relacional.

- `consultas_optica.sql`  
  Conjunto de comandos `SELECT` que validam a estrutura e relacionamentos entre as tabelas, com foco em cruzamento de dados e consultas funcionais.

- `der_optica.png`  
  Imagem gerada no MySQL Workbench que representa o DER (Diagrama Entidade-Relacionamento) com todas as entidades e ligações.

---

## Como gerar o DER no MySQL Workbench

1. Abra o MySQL Workbench
2. Vá em `File > New Model`
3. Acesse `Database > Reverse Engineer`
4. Escolha a conexão usada para o banco `optica`
5. Siga os passos e selecione todas as tabelas
6. Ao final, abra o `EER Diagram` no painel esquerdo
7. Ajuste o layout e exporte se necessário em `File > Export > PNG`

---