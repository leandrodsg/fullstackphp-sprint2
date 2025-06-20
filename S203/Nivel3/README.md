# S204 - YouTube Mini System (MongoDB)

This project implements Sprint S204 focused on modeling a mini YouTube-like system using MongoDB.  
The goal is to create a simple and consistent database structure to manage users, channels, videos, comments, subscriptions, reactions, and playlists.

---

## Modeled Collections

- **users**  
  Stores basic user information.  
  Includes: email, username, password, full_name, birth_date, gender, country, zip

- **channels**  
  Represents user-created channels.  
  Includes: name, description, created_by (user), created_at

- **videos**  
  Stores video data uploaded to a channel.  
  Includes: title, description, url, thumbnail, resolution, duration, size, views, likes, dislikes, visibility, tags, channel_id, uploaded_at

- **comments**  
  Stores user comments on videos.  
  Includes: text, video_id, author_id, date

- **subscriptions**  
  Represents subscriptions of users to channels.  
  Includes: user_id, channel_id, subscribed_at

- **reactions**  
  Stores user reactions (like/dislike) to videos.  
  Includes: user_id, video_id, type, reacted_at

- **playlists**  
  Represents video playlists created by users.  
  Includes: name, created_by, created_at, visibility, videos (list)

---

## Model Rules

- Each channel is owned by one user
- A channel can have multiple videos
- Videos are linked to channels (not directly to users)
- Users can comment on any video
- Users can subscribe to channels (excluding their own)
- Reactions are limited to one per user per video
- Playlists can contain multiple videos and be public or private

---

## File Structure

- `users.json`  
  Contains two users with basic info

- `channels.json`  
  Contains two channels, each created by one user

- `videos.json`  
  Contains two videos, each linked to a channel

- `comments.json`  
  Contains two comments, one per video, made by the opposite user

- `subscriptions.json`  
  Contains two subscriptions, users subscribing to each other's channels

- `reactions.json`  
  Contains two likes, each user liking the other user's video

- `playlists.json`  
  One playlist with both videos included