-- Datos de ejemplo para probar la funcionalidad del sistema

-- Insertar usuarios de prueba
insert into user (email, password, username, birth_date, gender, country, postal_code)
values 
('ana@email.com', '123456', 'ana_user', '1995-04-15', 'F', 'brazil', '01001-000'),
('joao@email.com', 'abcdef', 'joaovideo', '1990-09-10', 'M', 'portugal', '1000-001'),
('maria@email.com', 'senha123', 'mariax', '1988-01-20', 'F', 'spain', '08001');

-- Insertar canales de contenido
insert into channel (name, description, creation_date, user_id)
values 
('ana channel', 'tips and tutorials', '2025-06-01', 1),
('joao tech', 'technology and reviews', '2025-06-02', 2),
('maria channel', 'general content', '2025-06-03', 3);

-- Insertar videos de ejemplo
insert into video (title, description, file_name, file_size, duration, thumbnail, view_count, like_count, dislike_count, status, channel_id, publish_date)
values 
('how to use mysql', 'basic mysql tutorial', 'mysql_tutorial.mp4', 52428800, 600, 'thumb1.jpg', 150, 12, 1, 'public', 1, '2025-06-03 10:00:00'),
('unboxing smartphone x', 'full review of smartphone x', 'unboxing_x.mp4', 78643200, 720, 'thumb2.jpg', 89, 8, 0, 'public', 2, '2025-06-04 14:30:00');

-- Insertar etiquetas comunes
insert into tag (name) values ('mysql'), ('tutorial'), ('review'), ('technology');

-- Relacionar videos con etiquetas
insert into video_tag (video_id, tag_id, marked_by_user_id, marked_at)
values 
(1, 1, 1, now()),
(1, 2, 1, now()),
(2, 3, 2, now()),
(2, 4, 2, now());

-- Registrar suscripciones entre usuarios y canales
insert into subscription (user_id, channel_id, subscribed_at)
values 
(1, 2, now()),
(3, 1, now());

-- Agregar comentarios a los videos
insert into comment (text, created_at, user_id, video_id)
values 
('great tutorial!', now(), 3, 1),
('nice review!', now(), 1, 2);

-- Registrar likes en videos
insert into video_like (user_id, video_id, type, created_at)
values 
(3, 1, 'like', now()),
(1, 2, 'like', now());

-- Registrar likes en comentarios
insert into comment_like (user_id, comment_id, type, created_at)
values 
(2, 1, 'like', now()),
(3, 2, 'like', now());

-- Crear listas de reproducción
insert into playlist (name, is_public, created_at, user_id)
values 
('sql tutorials', true, now(), 1);

-- Agregar videos a las listas de reproducción
insert into playlist_video (playlist_id, video_id, added_at)
values 
(1, 1, now());