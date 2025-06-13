-- bd "optica"
create database if not exists optica;
use optica;

-- tabela de fornecedores
-- cada fornecedor precisa de identif e endereco completo
create table fornecedor (
    id int auto_increment primary key,         -- id fornecedor prim key
    nome varchar(100) not null,                -- nome fornecedor
    rua varchar(100),                          -- rua endereco
    numero varchar(10),                        -- num endereco que pode ter letras
    andar varchar(10),                         -- andar do prédio precisa ser opcional
    porta varchar(10),                         -- num apartamento/sala precisa ser opcional
    cidade varchar(50),                        -- cidade fornecedor
    codigo_postal varchar(15),                 -- cep
    pais varchar(50),                          -- pais
    telefone varchar(20),                      -- num telefone
    fax varchar(20),                           -- num fax
    nif varchar(20)                            -- num fiscal tipo cnpj
);

-- tabela de oculos vendidos
-- cada oculos tem marca graduacao tipo/cor da armacao cor da lente preco e vem de um fornecedor
create table oculos (
    id int auto_increment primary key,                		-- id oculos chave prim
    marca varchar(50) not null,                       		-- nome da marca
    -- separando grau cada lado pq eh comum ter valores diferentes em cada olho
    graduacao_esquerda varchar(10),                   		-- grau lado esquerdo
    graduacao_direita varchar(10),                    		-- grau lado direito
    tipo_armacao enum('flutuante', 'plastica', 'metalica'), -- tipo da armação
    cor_armacao varchar(30),                          		-- cor da armação
    cor_vidro varchar(30),                            		-- cor da lente
    preco decimal(8,2),                               		-- preco com 2 casas 17.90
    fornecedor_id int,                                		-- fornecedor que entregou esse oculos

    -- ligacao com a tabela fornecedor
    foreign key (fornecedor_id) references fornecedor(id)
        on delete set null                            -- null se apagar fornecedor
        on update cascade                             -- atualiza aqui se mudar o id do fornecedor
);

-- tabela de clientes
-- cada cliente tem nome endereco contato data de cadastro
create table cliente (
    id int auto_increment primary key,            -- id cliente
    nome varchar(100) not null,                   -- nome cliente
    endereco varchar(150),                        -- endereco completo simplificado
    telefone varchar(20),							
    email varchar(100),
    data_registro date                            -- quando foi cadastrado
);

-- tabela de indicacoes cliente com outro cliente que o indicou
create table indicacoes (
    cliente_id int,               -- quem foi indicado
    indicado_por_id int,          -- quem indicou

    -- duas fks apontando pra cliente
    foreign key (cliente_id) references cliente(id),
    foreign key (indicado_por_id) references cliente(id)
);

-- tabela de funcionarios
-- cada venda precisa de um funcionario que realizou a venda
create table funcionario (
    id int auto_increment primary key,   -- id funcionario
    nome varchar(100) not null           -- nome completo
);

-- tabela de vendas
-- armazena cada venda feita na otica com data cliente e funcionario
create table venda (
    id int auto_increment primary key,        -- id venda
    data date,                                -- data venda
    cliente_id int,                           -- cliente que fez a compra
    funcionario_id int,                       -- funcionario que vendeu

    foreign key (cliente_id) references cliente(id),
    foreign key (funcionario_id) references funcionario(id)
);

-- tabela que liga venda com oculos vendidos
-- uma venda pode ter varios oculos
create table venda_oculos (
    venda_id int,             -- id da venda
    oculos_id int,            -- id do oculos vendido

    foreign key (venda_id) references venda(id),
    foreign key (oculos_id) references oculos(id)
);

select * from venda_oculos;
select * from venda;
select * from funcionario;
select * from cliente;
select * from indicacoes;
select * from fornecedor;
select * from oculos;