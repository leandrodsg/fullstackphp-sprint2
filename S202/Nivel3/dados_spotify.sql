use spotify;

-- insert test users with different account types
insert into users (email, password, username, birth_date, gender, country, postal_code, account_type) values
('john.doe@mail.com', 'hash123', 'johndoe', '1990-01-01', 'm', 'spain', '08001', 'premium'),
('jane.smith@mail.com', 'hash456', 'janesmith', '1995-05-15', 'f', 'france', '75001', 'free');

-- insert premium user subscription details
insert into subscriptions (user_id, started_at, renewed_at, payment_method, amount, status) values
(1, '2025-01-01 00:00:00', '2025-02-01 00:00:00', 'credit_card', 9.99, 'active');

-- insert payment methods for premium user
insert into credit_cards (user_id, card_number, expiry_date, security_code) values
(1, '4532789456123456', '2026-12-01', '123');

insert into paypal_accounts (user_id, paypal_username) values
(1, 'johndoe_paypal');

-- insert subscription payment history
insert into payments (subscription_id, order_number, amount, paid_at) values
(1, 'ORD001', 9.99, '2025-01-01 00:00:00'),
(1, 'ORD002', 9.99, '2025-02-01 00:00:00');

-- insert artists with their profile images
insert into artists (name, image_url) values
('The Developers', 'developers.jpg'),
('Code Masters', 'codemasters.jpg'),
('Bug Hunters', 'hunters.jpg');

-- insert similar artists relationships
insert into similar_artists (artist_id, similar_artist_id) values
(1, 2),
(2, 3),
(3, 1);

-- insert albums with release information
insert into albums (artist_id, title, release_date, cover_url) values
(1, 'Debug Sessions', '2024-01-01', 'debug_sessions.jpg'),
(2, 'Clean Code Anthology', '2024-02-01', 'clean_code.jpg'),
(3, 'Testing Grounds', '2024-03-01', 'testing.jpg');

-- insert songs with duration and play count
insert into songs (album_id, title, duration_seconds, play_count) values
(1, 'Hello World', 180, 1000),
(1, 'Fatal Error', 200, 850),
(2, 'Null Pointer', 190, 750),
(3, 'Unit Test', 210, 500);

-- insert user playlists with song count and sharing settings
insert into playlists (user_id, title, created_at, song_count, is_shared, deleted_at) values
(1, 'Coding Sessions', '2025-01-01 10:00:00', 2, true, null),
(2, 'Debug Mix', '2025-01-02 10:00:00', 1, false, null),
(1, 'Old Playlist', '2025-01-03 10:00:00', 0, false, '2025-01-04 10:00:00');

-- insert songs into playlists with user tracking
insert into playlist_songs (playlist_id, song_id, added_by, added_at) values
(1, 1, 1, '2025-01-01 10:01:00'),
(1, 2, 2, '2025-01-01 10:02:00'),
(2, 3, 2, '2025-01-02 10:01:00');

-- insert user-artist following relationships
insert into user_artists (user_id, artist_id, followed_at) values
(1, 1, '2025-01-01 10:00:00'),
(2, 2, '2025-01-01 11:00:00'),
(1, 3, '2025-01-01 12:00:00');

-- insert user favorite songs with timestamps
insert into favorite_songs (user_id, song_id, added_at) values
(1, 1, '2025-01-01 12:00:00'),
(1, 3, '2025-01-01 12:30:00'),
(2, 2, '2025-01-01 13:00:00');

-- insert user favorite albums with timestamps
insert into favorite_albums (user_id, album_id, added_at) values
(1, 1, '2025-01-01 12:00:00'),
(2, 2, '2025-01-01 13:00:00');