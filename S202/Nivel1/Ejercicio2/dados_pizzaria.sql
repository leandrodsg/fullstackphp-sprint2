-- dados pizzaria
use pizzaria;

-- clientes
insert into cliente (nome, sobrenome, endereco, cep, cidade, estado, telefone) values
('ana', 'silva', 'rua a, 123', '01001-000', 'sao paulo', 'sp', '(11)98765-4321'),
('bruno', 'costa', 'av. b, 456', '20020-010', 'rio de janeiro', 'rj', '(21)91234-5678');

-- lojas
insert into loja (endereco, cep, cidade, estado) values
('rua das flores, 100', '01002-000', 'sao paulo', 'sp'),
('av. atlantica, 1500', '22010-000', 'rio de janeiro', 'rj');

-- funcionarios
insert into funcionario (nome, sobrenome, nif, telefone, cargo, loja_id) values
('carlos', 'pereira', '12345678900', '(11)99876-5432', 'cozinheiro', 1),
('daniela', 'rocha', '98765432100', '(21)99911-2233', 'entregador', 2);

-- categorias de pizza
insert into categoria (nome) values
('tradicionais'),
('especiais');

-- produtos
insert into produto (nome, descricao, imagem, preco, tipo, categoria_id) values
('margherita', 'tomate, mussarela, manjericao', '/img/margherita.jpg', 29.90, 'pizza', 1),
('portuguesa', 'presunto, ovo, cebola', '/img/portuguesa.jpg', 34.50, 'pizza', 2),
('x-burger', 'pao, hamburguer, queijo', '/img/xb.jpg', 18.00, 'hamburguer', null),
('refrigerante 350ml', 'refrigerante lata', '/img/refri.jpg', 6.00, 'bebida', null);

-- pedidos
insert into pedido (cliente_id, loja_id, tipo_entrega, data_hora, data_entrega, entregador_id, preco_total) values
(1, 1, 'retirada', '2025-06-10 12:30', null, null, 29.90),
(2, 2, 'domicilio', '2025-06-10 13:00', '2025-06-10 13:45', 2, 40.50);

-- itens dos pedidos
insert into pedido_produto (pedido_id, produto_id, quantidade, preco_unitario) values
(1, 1, 1, 29.90),
(2, 2, 1, 34.50),
(2, 4, 1, 6.00);
