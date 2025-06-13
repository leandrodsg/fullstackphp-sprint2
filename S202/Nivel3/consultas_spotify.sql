-- consultas_spotify.sql

-- 1. listar todos os usuarios cadastrados
select * from usuario;

-- 2. mostrar as assinaturas dos usuarios
-- relacionamento 1:N entre usuario e ass. e visualizar a forma de pagamento
select a.id, u.nome, a.tipo, a.valor, a.forma_pagamento
from assinatura a
join usuario u on a.usuario_id = u.id;

-- 3. listar musicas com seus albuns e artistas
-- joins de musica para album com artista
-- testar os relacionamentos entre as 3 entidades ok
select m.titulo as musica, m.duracao, al.titulo as album, ar.nome as artista
from musica m
join album al on m.album_id = al.id
join artista ar on al.artista_id = ar.id;

-- 4. playlists e seus respectivos donos
-- ver se o campo de compartilhamento esta registrado ok
select p.titulo as playlist, u.nome as dono, p.compartilhada
from playlist p
join usuario u on p.usuario_id = u.id;

-- 5. musicas adicionadas em playlists, com quem as adicionou
-- tabela associativa playlist_musica
-- usuario que adicionou e data de adicao ok
select pl.titulo as playlist, m.titulo as musica, u.nome as quem_adicionou
from playlist_musica pm
join playlist pl on pm.playlist_id = pl.id
join musica m on pm.musica_id = m.id
join usuario u on pm.adicionado_por = u.id;

-- 6. usuarios que seguem artistas
-- N:N entre usuario e artista
-- valida se a tabela usuario_artista registra corretamente o seguimento
select u.nome as usuario, a.nome as artista
from usuario_artista ua
join usuario u on ua.usuario_id = u.id
join artista a on ua.artista_id = a.id;

-- 7. artistas similares entre si
-- auto-relacionamento da entidade artista
-- mostra quais artistas estao relacionados como similares
select a.nome as artista, s.nome as similar
from artista_similar asi
join artista a on asi.artista_id = a.id
join artista s on asi.similar_id = s.id;

-- 8. musicas favoritas por usuario
-- tabela favorito_musica com usuario e musica
-- permite ver as preferencias musicais cadastradas
select u.nome as usuario, m.titulo as musica
from favorito_musica fm
join usuario u on fm.usuario_id = u.id
join musica m on fm.musica_id = m.id;

-- 9. albuns favoritos por usuario
-- mesma coisa que o 8, mas agora com album
-- importante para validar integridade entre usuario e album
select u.nome as usuario, a.titulo as album
from favorito_album fa
join usuario u on fa.usuario_id = u.id
join album a on fa.album_id = a.id;

-- 10. contar quantas musicas existem em cada playlist
-- LEFT JOIN para incluir playlists vazias
-- GROUP BY para contagem agrupada por playlist
select p.titulo as playlist, count(pm.musica_id) as total_musicas
from playlist p
left join playlist_musica pm on p.id = pm.playlist_id
group by p.id;
