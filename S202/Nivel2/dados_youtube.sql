-- dados_youtube.sql

-- usuarios simulados
-- base para canais, comentarios e curtidas
insert into usuario (email, senha, nome_usuario, data_nascimento, sexo, pais, codigo_postal)
values 
('ana@email.com', '123456', 'ana_user', '1995-04-15', 'F', 'brasil', '01001-000'),
('joao@email.com', 'abcdef', 'joaovideo', '1990-09-10', 'M', 'portugal', '1000-001'),
('maria@email.com', 'senha123', 'mariax', '1988-01-20', 'F', 'espanha', '08001');

-- canais criados pelos usuarios
insert into canal (nome, descricao, data_criacao, usuario_id)
values 
('canal da ana', 'dicas e tutoriais', '2025-06-01', 1),
('joao tech', 'tecnologia e reviews', '2025-06-02', 2);

-- videos publicados nos canais
insert into video (titulo, descricao, nome_arquivo, duracao, thumbnail, estado, canal_id, data_publicacao)
values 
('como usar mysql', 'tutorial basico de mysql', 'mysql_tutorial.mp4', 600, 'thumb1.jpg', 'publico', 1, '2025-06-03 10:00:00'),
('unboxing smartphone x', 'review completo do smartphone x', 'unboxing_x.mp4', 720, 'thumb2.jpg', 'publico', 2, '2025-06-04 14:30:00');

-- tags disponiveis para marcar os videos
insert into tag (nome) values ('mysql'), ('tutorial'), ('review'), ('tecnologia');

-- associacoes entre videos e tags
-- usuario tambem eh registrado para sabermos quem marcou
insert into video_tag (video_id, tag_id, marcado_por_id, data_marcacao)
values 
(1, 1, 1, now()),  -- ana marcou mysql no video 1
(1, 2, 1, now()),  -- ana marcou tutorial
(2, 3, 2, now()),  -- joao marcou review
(2, 4, 2, now());  -- joao marcou tecnologia

-- inscricoes feitas por usuarios em canais
insert into inscricao (usuario_id, canal_id, data_inscricao)
values 
(1, 2, now()),  -- ana se inscreveu no canal do joao
(3, 1, now());  -- maria se inscreveu no canal da ana

-- comentarios feitos nos videos
insert into comentario (texto, data, usuario_id, video_id)
values 
('muito bom o tutorial!', now(), 3, 1),  -- maria comentou no video da ana
('gostei do review!', now(), 1, 2);      -- ana comentou no video do joao

-- curtidas em videos
insert into curtida_video (usuario_id, video_id, tipo, data)
values 
(3, 1, 'like', now()),  -- maria curtiu video 1
(1, 2, 'like', now());  -- ana curtiu video 2

-- curtidas em comentarios
insert into curtida_comentario (usuario_id, comentario_id, tipo, data)
values 
(2, 1, 'like', now()),  -- joao curtiu comentario da maria
(3, 2, 'like', now());  -- maria curtiu comentario da ana

-- playlist criada por ana
insert into playlist (nome, publica, data_criacao, usuario_id)
values 
('tutoriais sql', true, '2025-06-05', 1);

-- video adicionado na playlist
insert into playlist_video (playlist_id, video_id)
values 
(1, 1);  -- video de mysql adicionado na playlist da ana
