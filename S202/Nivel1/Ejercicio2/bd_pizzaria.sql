-- bd pizzaria
create database if not exists pizzaria;
use pizzaria;

-- tabela de clientes
-- cada cliente tem nome, endereco, cep, cidade, estado e telefone
create table cliente (
    id int auto_increment primary key,         -- id cliente
    nome varchar(100) not null,                -- nome
    sobrenome varchar(100) not null,           -- sobrenome
    endereco varchar(255) not null,            -- endereco completo
    cep varchar(10) not null,                  -- cep
    cidade varchar(100) not null,              -- cidade
    estado varchar(100) not null,              -- estado (sigla ou nome)
    telefone varchar(20) not null              -- telefone
);

-- tabela de lojas
-- cada loja tem endereco e localizacao
create table loja (
    id int auto_increment primary key,         -- id loja
    endereco varchar(255) not null,            -- endereco completo
    cep varchar(10) not null,                  -- cep
    cidade varchar(100) not null,              -- cidade
    estado varchar(100) not null               -- estado
);

-- tabela de funcionarios
-- cada funcionario trabalha em uma loja e tem cargo
create table funcionario (
    id int auto_increment primary key,         -- id funcionario
    nome varchar(100) not null,                -- nome
    sobrenome varchar(100) not null,           -- sobrenome
    nif varchar(20) not null unique,           -- cpf ou nif
    telefone varchar(20) not null,             -- telefone
    cargo enum('cozinheiro','entregador') not null, -- cargo
    loja_id int not null,                      -- loja onde trabalha
    foreign key (loja_id) references loja(id)  -- fk loja
);

-- tabela de categorias de pizza
create table categoria (
    id int auto_increment primary key,         -- id categoria
    nome varchar(100) not null                 -- nome categoria
);

-- tabela de produtos (pizza, hamburguer, bebida)
create table produto (
    id int auto_increment primary key,             -- id produto
    nome varchar(100) not null,                    -- nome
    descricao text,                                -- descricao
    imagem varchar(255),                           -- imagem opcional
    preco decimal(10,2) not null,                  -- preco
    tipo enum('pizza','hamburguer','bebida') not null, -- tipo
    categoria_id int,                              -- so se for pizza
    foreign key (categoria_id) references categoria(id)
);

-- tabela de pedidos
-- cada pedido tem cliente, loja, data, tipo de entrega
create table pedido (
    id int auto_increment primary key,         -- id pedido
    cliente_id int not null,                   -- fk cliente
    loja_id int not null,                      -- fk loja
    tipo_entrega enum('domicilio','retirada') not null, -- entrega
    data_hora datetime not null,               -- data do pedido
    data_entrega datetime,                     -- entrega (so se for domicilio)
    entregador_id int,                         -- fk funcionario (entregador)
    preco_total decimal(10,2) not null,        -- preco total
    foreign key (cliente_id) references cliente(id),
    foreign key (loja_id) references loja(id),
    foreign key (entregador_id) references funcionario(id)
);

-- tabela que liga pedido com produtos
-- um pedido pode ter varios produtos
create table pedido_produto (
    pedido_id int not null,                -- fk pedido
    produto_id int not null,              -- fk produto
    quantidade int not null,              -- qtd comprada
    preco_unitario decimal(10,2) not null,-- preco na hora
    primary key (pedido_id, produto_id),
    foreign key (pedido_id) references pedido(id),
    foreign key (produto_id) references produto(id)
);
