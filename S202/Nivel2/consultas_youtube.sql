use youtube;

-- 1. List all users
select * from user;

-- 2. Channels and their owners
select c.id, c.name as channel, u.username as owner
from channel c
join user u on c.user_id = u.id;

-- 3. Videos and their channels
select v.id, v.title, v.views, c.name as channel
from video v
join channel c on v.channel_id = c.id;

-- 4. Comments with author and video
select cmt.text, u.username as author, v.title as video
from comment cmt
join user u on cmt.user_id = u.id
join video v on cmt.video_id = v.id;

-- 5. Subscriptions
select u.username as subscriber, c.name as channel
from subscription s
join user u on s.user_id = u.id
join channel c on s.channel_id = c.id;

-- 6. Tags linked to videos
select v.title, t.name as tag
from video_tag vt
join video v on vt.video_id = v.id
join tag t on vt.tag_id = t.id;

-- 7. Playlists and videos
select p.name as playlist, v.title as video
from playlist_video pv
join playlist p on pv.playlist_id = p.id
join video v on pv.video_id = v.id;

-- 8. Video likes and dislikes
select v.title,
    sum(case when vl.type = 'like' then 1 else 0 end) as likes,
    sum(case when vl.type = 'dislike' then 1 else 0 end) as dislikes
from video v
left join video_like vl on v.id = vl.video_id
group by v.id;

-- 9. Comment likes
select u.username, c.text as comment
from comment_like cl
join user u on cl.user_id = u.id
join comment c on cl.comment_id = c.id;

-- 10. Total videos per channel
select c.name as channel, count(v.id) as total_videos
from channel c
left join video v on v.channel_id = c.id
group by c.id;