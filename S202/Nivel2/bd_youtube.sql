-- bd_youtube.sql 

create database if not exists youtube;
use youtube;

-- tabela de usuarios
-- armazena dados basicos e login dos usuarios
create table usuario (
    id int auto_increment primary key,
    email varchar(100) not null unique,
    senha varchar(100) not null,
    nome_usuario varchar(50) not null,
    data_nascimento date,
    sexo enum('M', 'F', 'Outro'),
    pais varchar(50),
    codigo_postal varchar(15)
);

-- tabela de canais
-- cada usuario pode ter um canal proprio
create table canal (
    id int auto_increment primary key,
    nome varchar(100),
    descricao text,
    data_criacao date,
    usuario_id int,
    foreign key (usuario_id) references usuario(id)
        on delete cascade
        on update cascade
);

-- tabela de videos
-- videos publicados dentro de um canal
-- inclui estatisticas simples como views e curtidas
create table video (
    id int auto_increment primary key,
    titulo varchar(200) not null,
    descricao text,
    nome_arquivo varchar(100),
    duracao int,
    thumbnail varchar(100),
    visualizacoes int default 0,
    curtidas int default 0,
    descurtidas int default 0,
    estado enum('publico', 'privado', 'oculto'),
    canal_id int,
    data_publicacao datetime,
    foreign key (canal_id) references canal(id)
        on delete cascade
        on update cascade
);

-- tabela de tags
-- serve para classificar os videos com palavras-chave
create table tag (
    id int auto_increment primary key,
    nome varchar(50) not null
);

-- tabela de relacao video-tag
-- uma tag pode ser usada em varios videos e vice-versa
create table video_tag (
    video_id int,
    tag_id int,
    marcado_por_id int,
    data_marcacao datetime,
    foreign key (video_id) references video(id),
    foreign key (tag_id) references tag(id),
    foreign key (marcado_por_id) references usuario(id)
);

-- tabela de inscricao
-- usuarios podem seguir canais
create table inscricao (
    usuario_id int,
    canal_id int,
    data_inscricao datetime,
    foreign key (usuario_id) references usuario(id),
    foreign key (canal_id) references canal(id)
);

-- comentarios feitos em videos
create table comentario (
    id int auto_increment primary key,
    texto text not null,
    data datetime,
    usuario_id int,
    video_id int,
    foreign key (usuario_id) references usuario(id),
    foreign key (video_id) references video(id)
);

-- curtidas e descurtidas em videos
create table curtida_video (
    usuario_id int,
    video_id int,
    tipo enum('like', 'dislike'),
    data datetime,
    foreign key (usuario_id) references usuario(id),
    foreign key (video_id) references video(id)
);

-- curtidas e descurtidas em comentarios
create table curtida_comentario (
    usuario_id int,
    comentario_id int,
    tipo enum('like', 'dislike'),
    data datetime,
    foreign key (usuario_id) references usuario(id),
    foreign key (comentario_id) references comentario(id)
);

-- playlists de videos feitas por usuarios
create table playlist (
    id int auto_increment primary key,
    nome varchar(100),
    publica boolean default true,
    data_criacao date,
    usuario_id int,
    foreign key (usuario_id) references usuario(id)
);

-- relacao n:n entre playlists e videos
create table playlist_video (
    playlist_id int,
    video_id int,
    foreign key (playlist_id) references playlist(id),
    foreign key (video_id) references video(id)
);
