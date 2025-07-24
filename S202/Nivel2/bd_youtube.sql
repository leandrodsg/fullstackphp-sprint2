-- Database structure for YouTube-like video platform

create database if not exists youtube;
use youtube;

-- User table with basic personal information
create table user (
    id int auto_increment primary key,
    email varchar(100) not null unique,
    password varchar(100) not null,
    username varchar(50) not null unique,
    birth_date date,
    gender enum('M', 'F', 'Other'),
    country varchar(50),
    postal_code varchar(15)
);

-- Channel table where users publish videos
create table channel (
    id int auto_increment primary key,
    name varchar(100) not null unique,
    description text,
    creation_date date not null,
    user_id int,
    foreign key (user_id) references user(id)
        on delete cascade
        on update cascade
);

-- Main video table
create table video (
    id int auto_increment primary key,
    title varchar(200) not null,
    description text,
    file_name varchar(100) not null,
    file_size bigint not null, -- grandària del archivo en bytes
    duration int not null,
    thumbnail varchar(100),
    view_count int default 0, -- nombre de reproduccions
    like_count int default 0, -- número de likes
    dislike_count int default 0, -- número de dislikes
    status enum('public', 'private', 'unlisted') default 'public',
    channel_id int,
    publish_date datetime not null,
    foreign key (channel_id) references channel(id)
        on delete cascade
        on update cascade
);

-- Table de etiquetas para categorizar videos
create table tag (
    id int auto_increment primary key,
    name varchar(50) not null unique
);

-- Tabla de relación entre videos y etiquetas
create table video_tag (
    video_id int,
    tag_id int,
    marked_by_user_id int,
    marked_at datetime not null,
    primary key (video_id, tag_id),
    foreign key (video_id) references video(id),
    foreign key (tag_id) references tag(id),
    foreign key (marked_by_user_id) references user(id)
);

-- Tabla de suscripciones a canales
create table subscription (
    user_id int,
    channel_id int,
    subscribed_at datetime not null,
    primary key (user_id, channel_id),
    foreign key (user_id) references user(id),
    foreign key (channel_id) references channel(id)
);

-- Tabla de comentarios en videos
create table comment (
    id int auto_increment primary key,
    text text not null,
    created_at datetime not null,
    user_id int,
    video_id int,
    foreign key (user_id) references user(id),
    foreign key (video_id) references video(id)
);

-- Tabla de likes/dislikes en videos
create table video_like (
    user_id int,
    video_id int,
    type enum('like', 'dislike') not null,
    created_at datetime not null,
    primary key (user_id, video_id),
    foreign key (user_id) references user(id),
    foreign key (video_id) references video(id)
);

-- Tabla de likes/dislikes en comentarios
create table comment_like (
    user_id int,
    comment_id int,
    type enum('like', 'dislike') not null,
    created_at datetime not null,
    primary key (user_id, comment_id),
    foreign key (user_id) references user(id),
    foreign key (comment_id) references comment(id)
);

-- Tabla de listas de reproducción
create table playlist (
    id int auto_increment primary key,
    name varchar(100) not null,
    is_public boolean default true,
    created_at datetime not null,
    user_id int,
    foreign key (user_id) references user(id)
);

-- Tabla de videos en listas de reproducción
create table playlist_video (
    playlist_id int,
    video_id int,
    added_at datetime not null,
    primary key (playlist_id, video_id),
    foreign key (playlist_id) references playlist(id),
    foreign key (video_id) references video(id)
);