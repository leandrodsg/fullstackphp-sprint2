# Exercise 2 - Simplified YouTube

This project models and implements the database of a video platform inspired by YouTube.
The goal is to simulate essential functionalities of a video network, exploring relational modeling and SQL queries.

---

## Modeled Entities

- user: email, password, username, birth_date, gender, country, postal_code
- channel: name, description, creation_date, associated with a user
- video: title, description, file_name, duration, thumbnail, status (public/private/unlisted), channel, statistics
- tag: tag name
- video_tag: N:M relationship between videos and tags, including who tagged and when
- subscription: users subscribed to channels (N:M relationship)
- comment: text, author, related video, created_at
- video_like: users who liked or disliked videos
- comment_like: users who liked or disliked comments
- playlist: name, public status, creation date, owner (user)
- playlist_video: N:M relationship between playlists and videos

---

## Relationships and Functional Requirements Met

- **"Un usuari/ària publica vídeos..."**  
  A user publishes videos on their channel.  
  The modeling includes the tables `user`, `channel` and `video`, with foreign keys connecting the video to the channel and the channel to the user.

- **"Un vídeo pot tenir tres estats diferents..."**  
  A video can be public, private or unlisted.  
  The `status` field was created as an `enum` within the `video` table.

- **"Un vídeo pot tenir moltes etiquetes..."**  
  A video can have several tags.  
  The `video_tag` table was created to represent the N:M relationship between `video` and `tag`.

- **"Un usuari/ària pot subscriure’s als canals..."**  
  Users can subscribe to channels.  
  The `subscription` table represents the N:M relationship between `user` and `channel`.

- **"Un usuari/ària pot donar-li un like o un dislike a un vídeo una única vegada..."**  
  Users can like or dislike videos.  
  The `video_like` table stores the type of interaction (`like` or `dislike`) with the date.

- **"Un usuari/ària pot escriure comentaris..."**  
  Users can comment on videos.  
  The `comment` table stores who commented, the text, and the related video.

- **"Un usuari/ària pot marcar un comentari com m’agrada o no m’agrada..."**  
  Likes and dislikes on comments were modeled in the `comment_like` table.

- **"Un usuari/ària pot crear playlists..."**  
  Public or private playlists were modeled with the `playlist` table and its relationship to videos in `playlist_video`.

---

## Project File Structure

- `bd_youtube_en.sql`  
  Contains the database creation and all tables with primary keys, foreign keys, and appropriate data types.

- `dados_youtube_en.sql`  
  Populates the database with fictional data, including users, channels, videos, comments, likes, and playlists.

- `consultas_youtube_en.sql`  
  A set of SQL queries to validate relationships and extract relevant data such as interactions, popularity, and playlist structure.

- `der_youtube.png` *(optional)*  
  Entity-relationship diagram exported from MySQL Workbench.

---

## How to Generate the DER in MySQL Workbench

1. Open MySQL Workbench
2. Go to `File > New Model`
3. Access `Database > Reverse Engineer`
4. Select the connection with the `youtube` database
5. Choose the tables and finish
6. On the side menu, open `EER Diagram`
7. Visually organize the entities and export via `File > Export > PNG`

---
