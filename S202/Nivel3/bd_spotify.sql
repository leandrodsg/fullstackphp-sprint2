-- initialize spotify database
create database if not exists spotify;
use spotify;

-- create users table with authentication and profile information
create table users (
    id int auto_increment primary key,
    email varchar(100) not null unique,
    password varchar(255) not null,
    username varchar(50) not null unique,
    birth_date date not null,
    gender char(1),
    country varchar(50),
    postal_code varchar(10),
    account_type enum('free', 'premium') default 'free'
);

-- create premium subscriptions table with payment tracking
create table subscriptions (
    id int auto_increment primary key,
    user_id int not null,
    started_at datetime not null,
    renewed_at datetime not null,
    payment_method enum('credit_card', 'paypal') not null,
    amount decimal(10,2) not null,
    status enum('active', 'cancelled') default 'active',
    foreign key (user_id) references users(id)
);

-- create credit cards table for subscription payments
create table credit_cards (
    id int auto_increment primary key,
    user_id int not null,
    card_number varchar(16) not null,
    expiry_date date not null,
    security_code varchar(3) not null,
    foreign key (user_id) references users(id)
);

-- create paypal accounts table for subscription payments
create table paypal_accounts (
    id int auto_increment primary key,
    user_id int not null,
    paypal_username varchar(100) not null,
    foreign key (user_id) references users(id)
);

-- create payments history table for subscription tracking
create table payments (
    id int auto_increment primary key,
    subscription_id int not null,
    order_number varchar(50) not null unique,
    amount decimal(10,2) not null,
    paid_at datetime not null,
    payment_method enum('credit_card', 'paypal') not null,
    foreign key (subscription_id) references subscriptions(id)
);

-- create artists table with basic profile information
create table artists (
    id int auto_increment primary key,
    name varchar(100) not null,
    image_url varchar(255)
);

-- create similar artists table for music recommendations
create table similar_artists (
    artist_id int not null,
    similar_artist_id int not null,
    primary key (artist_id, similar_artist_id),
    foreign key (artist_id) references artists(id),
    foreign key (similar_artist_id) references artists(id)
);

-- create albums table with release information and artist relationship
create table albums (
    id int auto_increment primary key,
    artist_id int not null,
    title varchar(100) not null,
    release_date date not null,
    cover_url varchar(255),
    foreign key (artist_id) references artists(id)
);

-- create songs table with duration and play count tracking
create table songs (
    id int auto_increment primary key,
    album_id int not null,
    title varchar(100) not null,
    duration_seconds int not null,
    play_count int default 0,
    foreign key (album_id) references albums(id)
);

-- create playlists table with sharing and active status
create table playlists (
    id int auto_increment primary key,
    user_id int not null,
    title varchar(100) not null,
    created_at datetime not null,
    song_count int not null default 0,
    is_shared boolean default false,
    deleted_at datetime,
    foreign key (user_id) references users(id)
);

-- create playlist songs table tracking who adds each song
create table playlist_songs (
    playlist_id int not null,
    song_id int not null,
    added_by int not null,
    added_at datetime not null,
    primary key (playlist_id, song_id),
    foreign key (playlist_id) references playlists(id),
    foreign key (song_id) references songs(id),
    foreign key (added_by) references users(id)
);

-- create user artists table for following relationships
create table user_artists (
    user_id int not null,
    artist_id int not null,
    followed_at datetime not null,
    primary key (user_id, artist_id),
    foreign key (user_id) references users(id),
    foreign key (artist_id) references artists(id)
);

-- create favorite songs table for user music preferences
create table favorite_songs (
    user_id int not null,
    song_id int not null,
    added_at datetime not null,
    primary key (user_id, song_id),
    foreign key (user_id) references users(id),
    foreign key (song_id) references songs(id)
);

-- create favorite albums table for user album preferences
create table favorite_albums (
    user_id int not null,
    album_id int not null,
    added_at datetime not null,
    primary key (user_id, album_id),
    foreign key (user_id) references users(id),
    foreign key (album_id) references albums(id)
);