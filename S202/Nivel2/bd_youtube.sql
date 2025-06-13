-- Database and tables

create database if not exists youtube;
use youtube;

-- Users table
create table user (
    id int auto_increment primary key,
    email varchar(100) not null unique,
    password varchar(100) not null,
    username varchar(50) not null,
    birth_date date,
    gender enum('M', 'F', 'Other'),
    country varchar(50),
    postal_code varchar(15)
);

-- Channels table
create table channel (
    id int auto_increment primary key,
    name varchar(100),
    description text,
    creation_date date,
    user_id int,
    foreign key (user_id) references user(id)
        on delete cascade
        on update cascade
);

-- Videos table
create table video (
    id int auto_increment primary key,
    title varchar(200) not null,
    description text,
    file_name varchar(100),
    duration int,
    thumbnail varchar(100),
    views int default 0,
    likes int default 0,
    dislikes int default 0,
    status enum('public', 'private', 'unlisted'),
    channel_id int,
    publish_date datetime,
    foreign key (channel_id) references channel(id)
        on delete cascade
        on update cascade
);

-- Tags table
create table tag (
    id int auto_increment primary key,
    name varchar(50) not null
);

-- Tags linked to videos
create table video_tag (
    video_id int,
    tag_id int,
    marked_by_user_id int,
    marked_at datetime,
    foreign key (video_id) references video(id),
    foreign key (tag_id) references tag(id),
    foreign key (marked_by_user_id) references user(id)
);

-- Subscriptions table
create table subscription (
    user_id int,
    channel_id int,
    subscribed_at datetime,
    foreign key (user_id) references user(id),
    foreign key (channel_id) references channel(id)
);

-- Comments table
create table comment (
    id int auto_increment primary key,
    text text not null,
    created_at datetime,
    user_id int,
    video_id int,
    foreign key (user_id) references user(id),
    foreign key (video_id) references video(id)
);

-- Video likes and dislikes
create table video_like (
    user_id int,
    video_id int,
    type enum('like', 'dislike'),
    created_at datetime,
    foreign key (user_id) references user(id),
    foreign key (video_id) references video(id)
);

-- Comment likes and dislikes
create table comment_like (
    user_id int,
    comment_id int,
    type enum('like', 'dislike'),
    created_at datetime,
    foreign key (user_id) references user(id),
    foreign key (comment_id) references comment(id)
);

-- Playlists table
create table playlist (
    id int auto_increment primary key,
    name varchar(100),
    is_public boolean default true,
    created_at date,
    user_id int,
    foreign key (user_id) references user(id)
);

-- Playlist videos link
create table playlist_video (
    playlist_id int,
    video_id int,
    foreign key (playlist_id) references playlist(id),
    foreign key (video_id) references video(id)
);