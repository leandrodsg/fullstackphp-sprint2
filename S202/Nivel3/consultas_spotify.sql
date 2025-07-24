use spotify;

-- list all users showing their account types and countries
select username, account_type, country 
from users;

-- show premium users with their subscription and payment details
select u.username, s.payment_method, s.amount, s.renewed_at, p.order_number, p.paid_at
from users u
join subscriptions s on u.id = s.user_id
join payments p on s.id = p.subscription_id
where u.account_type = 'premium';

-- show credit card users
select u.username, 'Credit Card' as payment_type, cc.card_number
from users u
join credit_cards cc on u.id = cc.user_id
where u.account_type = 'premium';

-- show paypal users
select u.username, 'PayPal' as payment_type, pa.paypal_username
from users u
join paypal_accounts pa on u.id = pa.user_id
where u.account_type = 'premium';

-- display songs with their artists, albums and play count
select s.title as song, ar.name as artist, al.title as album, s.play_count
from songs s
join albums al on s.album_id = al.id
join artists ar on al.artist_id = ar.id
order by s.play_count desc;

-- show most played songs
select s.title, ar.name as artist, s.play_count
from songs s
join albums al on s.album_id = al.id
join artists ar on al.artist_id = ar.id
order by s.play_count desc
limit 5;

-- show active playlists with their creators and song count
select p.title as playlist, u.username as created_by, p.song_count, p.is_shared
from playlists p
join users u on p.user_id = u.id
where p.deleted_at is null;

-- list deleted playlists with their deletion dates
select p.title, u.username as owner, p.created_at, p.deleted_at
from playlists p
join users u on p.user_id = u.id
where p.deleted_at is not null;

-- list songs in each playlist with who added them
select p.title as playlist, s.title as song, u.username as added_by, ps.added_at
from playlist_songs ps
join playlists p on ps.playlist_id = p.id
join songs s on ps.song_id = s.id
join users u on ps.added_by = u.id;

-- count active playlists per user
select u.username, count(p.id) as total_playlists
from users u
left join playlists p on u.id = p.user_id and p.deleted_at is null
group by u.username;

-- show similar artists relationships
select a1.name as artist, a2.name as similar_artist
from similar_artists sa
join artists a1 on sa.artist_id = a1.id
join artists a2 on sa.similar_artist_id = a2.id;

-- show artists each user follows with follow date
select u.username as follower, ar.name as artist, ua.followed_at
from user_artists ua
join users u on ua.user_id = u.id
join artists ar on ua.artist_id = ar.id;

-- display users favorite songs with dates
select u.username, s.title as favorite_song, fs.added_at
from favorite_songs fs
join users u on fs.user_id = u.id
join songs s on fs.song_id = s.id;

-- display users favorite albums with dates
select u.username, al.title as favorite_album, fa.added_at
from favorite_albums fa
join users u on fa.user_id = u.id
join albums al on fa.album_id = al.id;

-- show number of songs in each playlist
select p.title as playlist, p.song_count as total_songs
from playlists p;