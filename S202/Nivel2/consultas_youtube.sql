use youtube;

-- Listar todos los usuarios registrados
select * from user;

-- Mostrar canales con sus propietarios
select c.name as channel_name, u.username as owner
from channel c
join user u on c.user_id = u.id;

-- Obtener estadísticas de videos
select 
    v.title,
    v.view_count as reproduccions,
    v.like_count as likes,
    v.dislike_count as dislikes,
    concat(round(v.file_size / 1024 / 1024, 2), ' MB') as file_size,
    v.duration as duration_seconds
from video v
order by v.view_count desc;

-- Mostrar comentarios con autores y videos
select 
    c.text, 
    u.username as author, 
    v.title as video,
    count(cl.user_id) as comment_likes
from comment c
join user u on c.user_id = u.id
join video v on c.video_id = v.id
left join comment_like cl on c.id = cl.comment_id
group by c.id;

-- Listar suscripciones activas
select 
    u.username as subscriber, 
    c.name as channel,
    s.subscribed_at
from subscription s
join user u on s.user_id = u.id
join channel c on s.channel_id = c.id;

-- Mostrar videos con sus etiquetas
select 
    v.title,
    group_concat(t.name) as tags
from video v
join video_tag vt on v.id = vt.video_id
join tag t on vt.tag_id = t.id
group by v.id;

-- Listar contenido de listas de reproducción
select 
    p.name as playlist,
    u.username as creator,
    v.title as video,
    pv.added_at
from playlist_video pv
join playlist p on pv.playlist_id = p.id
join video v on pv.video_id = v.id
join user u on p.user_id = u.id
order by p.name, pv.added_at;

-- Videos más populares por reproduccions
select 
    v.title,
    c.name as channel,
    v.view_count as reproduccions,
    v.like_count as likes,
    v.dislike_count as dislikes,
    concat(round(v.file_size / 1024 / 1024, 2), ' MB') as tamaño_archivo
from video v
join channel c on v.channel_id = c.id
order by v.view_count desc;

-- Videos con mejor ratio likes/dislikes
select 
    v.title,
    v.like_count,
    v.dislike_count,
    case 
        when v.dislike_count = 0 then v.like_count
        else round(v.like_count / v.dislike_count, 2)
    end as ratio_likes_dislikes
from video v
where v.like_count > 0 or v.dislike_count > 0
order by ratio_likes_dislikes desc;