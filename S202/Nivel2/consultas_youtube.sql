-- consultas_youtube.sql

-- 1
-- todos os usuarios cadastrados
-- valida se a tabela usuario foi criada e populada
select * from usuario;

-- 2
-- todos os canais com o nome do dono
-- join entre canal e usuario pelo usuario_id
select c.id, c.nome as canal, u.nome_usuario as dono
from canal c
join usuario u on c.usuario_id = u.id;

-- 3
-- todos os videos com nome do canal e numero de visualizacoes
-- join entre video e canal
select v.id, v.titulo, v.visualizacoes, c.nome as canal
from video v
join canal c on v.canal_id = c.id;

-- 4
-- lista os comentarios feitos nos videos
-- mostra quem comentou e em qual video
select cm.texto, u.nome_usuario as autor, v.titulo as video
from comentario cm
join usuario u on cm.usuario_id = u.id
join video v on cm.video_id = v.id;

-- 5
-- quem esta inscrito em qual canal
-- join entre inscricao, usuario e canal
select u.nome_usuario as inscrito, c.nome as canal
from inscricao i
join usuario u on i.usuario_id = u.id
join canal c on i.canal_id = c.id;

-- 6
-- tags associadas aos videos
-- join entre video_tag tag e video
select v.titulo, t.nome as tag
from video_tag vt
join video v on vt.video_id = v.id
join tag t on vt.tag_id = t.id;

-- 7
-- playlists com seus respectivos videos
-- join entre playlist_video playlist e video
select p.nome as playlist, v.titulo as video
from playlist_video pv
join playlist p on pv.playlist_id = p.id
join video v on pv.video_id = v.id;

-- 8
-- numero de curtidas e descurtidas por video
-- case para contar separadamente
select v.titulo,
    sum(case when cv.tipo = 'like' then 1 else 0 end) as curtidas,
    sum(case when cv.tipo = 'dislike' then 1 else 0 end) as descurtidas
from video v
left join curtida_video cv on v.id = cv.video_id
group by v.id;

-- 9
-- quem curtiu cada comentario
-- join entre curtida_comentario usuario e comentario
select u.nome_usuario, c.texto as comentario
from curtida_comentario cc
join usuario u on cc.usuario_id = u.id
join comentario c on cc.comentario_id = c.id;

-- 10
-- numero total de videos por canal
-- conta quantos videos cada canal tem
select c.nome as canal, count(v.id) as total_videos
from canal c
left join video v on v.canal_id = c.id
group by c.id;
