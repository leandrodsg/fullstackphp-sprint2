-- Insert users
insert into user (email, password, username, birth_date, gender, country, postal_code)
values 
('ana@email.com', '123456', 'ana_user', '1995-04-15', 'F', 'brazil', '01001-000'),
('joao@email.com', 'abcdef', 'joaovideo', '1990-09-10', 'M', 'portugal', '1000-001'),
('maria@email.com', 'senha123', 'mariax', '1988-01-20', 'F', 'spain', '08001');

-- Insert channels
insert into channel (name, description, creation_date, user_id)
values 
('ana channel', 'tips and tutorials', '2025-06-01', 1),
('joao tech', 'technology and reviews', '2025-06-02', 2);

-- Insert videos
insert into video (title, description, file_name, duration, thumbnail, status, channel_id, publish_date)
values 
('how to use mysql', 'basic mysql tutorial', 'mysql_tutorial.mp4', 600, 'thumb1.jpg', 'public', 1, '2025-06-03 10:00:00'),
('unboxing smartphone x', 'full review of smartphone x', 'unboxing_x.mp4', 720, 'thumb2.jpg', 'public', 2, '2025-06-04 14:30:00');

-- Insert tags
insert into tag (name) values ('mysql'), ('tutorial'), ('review'), ('technology');

-- Link videos with tags
insert into video_tag (video_id, tag_id, marked_by_user_id, marked_at)
values 
(1, 1, 1, now()),
(1, 2, 1, now()),
(2, 3, 2, now()),
(2, 4, 2, now());

-- Insert subscriptions
insert into subscription (user_id, channel_id, subscribed_at)
values 
(1, 2, now()),
(3, 1, now());

-- Insert comments
insert into comment (text, created_at, user_id, video_id)
values 
('great tutorial!', now(), 3, 1),
('nice review!', now(), 1, 2);

-- Insert video likes
insert into video_like (user_id, video_id, type, created_at)
values 
(3, 1, 'like', now()),
(1, 2, 'like', now());

-- Insert comment likes
insert into comment_like (user_id, comment_id, type, created_at)
values 
(2, 1, 'like', now()),
(3, 2, 'like', now());

-- Insert playlists
insert into playlist (name, is_public, created_at, user_id)
values 
('sql tutorials', true, '2025-06-05', 1);

-- Link videos to playlist
insert into playlist_video (playlist_id, video_id)
values 
(1, 1);