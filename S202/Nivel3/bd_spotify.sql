-- bd_spotify.sql 

create database if not exists spotify;
use spotify;

-- tabela de usuarios
-- infos basicas do usuario e se eh gratis ou premium
create table usuario (
    id int auto_increment primary key,
    email varchar(100) not null unique,
    senha varchar(100) not null,
    nome varchar(100),
    data_nascimento date,
    sexo enum('m', 'f', 'outro'),
    pais varchar(50),
    codigo_postal varchar(15),
    tipo enum('gratis', 'premium') not null
);

-- tabela de assinaturas premium
-- armazena dados da assinatura ativa de um usuario
create table assinatura (
    id int auto_increment primary key,
    usuario_id int not null,
    data_assinatura date,
    tipo varchar(50),
    valor decimal(10,2),
    forma_pagamento enum('cartao', 'paypal'),
    foreign key (usuario_id) references usuario(id)
);

-- tabela de cartoes so para quem paga com cartao
create table cartao (
    id int auto_increment primary key,
    assinatura_id int not null,
    numero_cartao varchar(20),
    validade date,
    codigo_seguranca varchar(4),
    foreign key (assinatura_id) references assinatura(id)
);

-- tabela de paypal se usou paypal
create table paypal (
    id int auto_increment primary key,
    assinatura_id int not null,
    usuario_paypal varchar(100),
    foreign key (assinatura_id) references assinatura(id)
);

-- tabela de playlists
-- cada usuario pode criar varias playlists
create table playlist (
    id int auto_increment primary key,
    usuario_id int,
    titulo varchar(100),
    numero_musicas int default 0,
    data_criacao date,
    ativa boolean default true,
    compartilhada boolean default false,
    foreign key (usuario_id) references usuario(id)
);

-- tabela de artistas
create table artista (
    id int auto_increment primary key,
    nome varchar(100) not null
);

-- tabela de albuns
-- cada album pertence a um artista
create table album (
    id int auto_increment primary key,
    titulo varchar(100),
    data_lancamento date,
    imagem varchar(100),
    artista_id int,
    foreign key (artista_id) references artista(id)
);

-- tabela de musicas
-- cada musica pertence a um album
create table musica (
    id int auto_increment primary key,
    titulo varchar(100),
    duracao int, -- duracao em segundos
    album_id int,
    foreign key (album_id) references album(id)
);

-- tabela para associar musicas com playlists
-- inclui quem adicionou e quando
create table playlist_musica (
    playlist_id int,
    musica_id int,
    adicionado_por int,
    data_adicao datetime,
    foreign key (playlist_id) references playlist(id),
    foreign key (musica_id) references musica(id),
    foreign key (adicionado_por) references usuario(id)
);

-- tabela de seguidores de artistas
-- relacao muitos pra muitos entre usuario e artista
create table usuario_artista (
    usuario_id int,
    artista_id int,
    data_seguimento date,
    primary key (usuario_id, artista_id),
    foreign key (usuario_id) references usuario(id),
    foreign key (artista_id) references artista(id)
);

-- tabela de artistas similares
-- auto relacionamento entre artistas
create table artista_similar (
    artista_id int,
    similar_id int,
    primary key (artista_id, similar_id),
    foreign key (artista_id) references artista(id),
    foreign key (similar_id) references artista(id)
);

-- tabela de favoritos
-- usuario pode favoritar musicas
create table favorito_musica (
    usuario_id int,
    musica_id int,
    data_favorito datetime,
    primary key (usuario_id, musica_id),
    foreign key (usuario_id) references usuario(id),
    foreign key (musica_id) references musica(id)
);

-- tabela de favoritos de albuns
-- usuario pode favoritar albuns
create table favorito_album (
    usuario_id int,
    album_id int,
    data_favorito datetime,
    primary key (usuario_id, album_id),
    foreign key (usuario_id) references usuario(id),
    foreign key (album_id) references album(id)
);
