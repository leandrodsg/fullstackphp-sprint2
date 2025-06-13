use spotify;

-- 1. List all users
select * from usuario;

-- 2. Subscription details with payment type
select a.id, u.nome, a.tipo, a.valor, a.forma_pagamento
from assinatura a
join usuario u on a.usuario_id = u.id;

-- 3. Songs with album and artist
select m.titulo as song, m.duracao, al.titulo as album, ar.nome as artist
from musica m
join album al on m.album_id = al.id
join artista ar on al.artista_id = ar.id;

-- 4. Playlists and their owners
select p.titulo as playlist, u.nome as owner, p.compartilhada
from playlist p
join usuario u on p.usuario_id = u.id;

-- 5. Songs in playlists and who added
select pl.titulo as playlist, m.titulo as song, u.nome as added_by
from playlist_musica pm
join playlist pl on pm.playlist_id = pl.id
join musica m on pm.musica_id = m.id
join usuario u on pm.adicionado_por = u.id;

-- 6. Users following artists
select u.nome as user, a.nome as artist
from usuario_artista ua
join usuario u on ua.usuario_id = u.id
join artista a on ua.artista_id = a.id;

-- 7. Similar artists
select a.nome as artist, s.nome as similar
from artista_similar asi
join artista a on asi.artista_id = a.id
join artista s on asi.similar_id = s.id;

-- 8. Favorite songs by user
select u.nome as user, m.titulo as song
from favorito_musica fm
join usuario u on fm.usuario_id = u.id
join musica m on fm.musica_id = m.id;

-- 9. Favorite albums by user
select u.nome as user, a.titulo as album
from favorito_album fa
join usuario u on fa.usuario_id = u.id
join album a on fa.album_id = a.id;

-- 10. Number of songs in each playlist
select p.titulo as playlist, count(pm.musica_id) as total_songs
from playlist p
left join playlist_musica pm on p.id = pm.playlist_id
group by p.id;