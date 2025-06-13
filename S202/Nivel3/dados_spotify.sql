-- Insert users
insert into usuario (email, senha, nome, data_nascimento, sexo, pais, codigo_postal, tipo) values
('ana@email.com', '123456', 'ana', '1995-04-10', 'f', 'brasil', '01000-000', 'premium'),
('joao@email.com', 'abcdef', 'joao', '1990-08-22', 'm', 'portugal', '1000-100', 'gratis');

-- Insert subscriptions
insert into assinatura (usuario_id, data_assinatura, tipo, valor, forma_pagamento) values
(1, '2025-06-01', 'mensal', 19.90, 'cartao');

-- Insert credit card
insert into cartao (assinatura_id, numero_cartao, validade, codigo_seguranca) values
(1, '1234567890123456', '2026-12-01', '123');

-- Insert artists
insert into artista (nome) values
('banda alpha'),
('dj beta');

-- Insert similar artists
insert into artista_similar (artista_id, similar_id) values
(1, 2),
(2, 1);

-- Insert albums
insert into album (titulo, data_lancamento, imagem, artista_id) values
('primeiro som', '2024-01-01', 'alpha.jpg', 1),
('ritmo beta', '2023-10-15', 'beta.jpg', 2);

-- Insert songs
insert into musica (titulo, duracao, album_id) values
('intro alpha', 180, 1),
('batida beta', 210, 2),
('alpha remix', 200, 1);

-- Insert followed artists
insert into usuario_artista (usuario_id, artista_id, data_seguimento) values
(1, 1, now()),
(2, 2, now());

-- Insert favorite songs
insert into favorito_musica (usuario_id, musica_id, data_favorito) values
(1, 1, now()),
(2, 2, now());

-- Insert favorite albums
insert into favorito_album (usuario_id, album_id, data_favorito) values
(1, 1, now());

-- Insert playlists
insert into playlist (usuario_id, titulo, numero_musicas, data_criacao, ativa, compartilhada) values
(1, 'favoritas da ana', 2, '2025-06-05', true, false),
(2, 'top beta', 1, '2025-06-06', true, true);

-- Insert songs in playlists
insert into playlist_musica (playlist_id, musica_id, adicionado_por, data_adicao) values
(1, 1, 1, now()),
(1, 3, 1, now()),
(2, 2, 2, now());