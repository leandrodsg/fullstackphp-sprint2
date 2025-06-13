
# Exercise 1 - Simplified Spotify

This project models and implements the database of a streaming platform inspired by Spotify.
The goal is to simulate essential features of a digital music system, exploring relational modeling and SQL queries.

---

## Modeled Entities

* usuario: email, password, name, date of birth, gender, country, postal code, type (free or premium)
* assinatura: premium subscription data, value, payment method
* cartao / paypal: specific details for payment methods
* playlist: title, owner user, creation date, active and shared status
* artista: artist name
* album: belongs to an artist, title, release date, image
* musica: belongs to an album, title, duration
* playlist_musica: links songs and playlists, including who added and when
* usuario_artista: many-to-many relationship of users following artists
* artista_similar: artists related as similar
* favorito_musica / favorito_album: users who marked songs and albums as favorites

---

## Relationships and Functional Requirements Covered

* **"Un usuari/ària pot ser gràtis o premium..."**
  Each user is classified as 'free' or 'premium'. The `usuario` table has the `tipo` field.

* **"Els usuaris premium tenen una subscripció activa..."**
  The `assinatura` table stores active subscription data. It can be linked to `cartao` or `paypal`.

* **"Un usuari/ària pot crear llistes de reproducció..."**
  Playlists are modeled with active/inactive status and sharing option.

* **"Una cançó pot ser afegida a uma llista per altres usuaris..."**
  The `playlist_musica` table records who added each song and when.

* **"Un álbum pertany a un artista..."**
  The artist → album → song hierarchy is modeled using direct foreign keys.

* **"Un usuari/ària pot seguir diversos artistes..."**
  The many-to-many relationship is implemented in the `usuario_artista` table.

* **"Els artistes poden estar relacionats com a similars..."**
  The `artista_similar` table models self-relationships between artists.

* **"Els usuaris poden marcar àlbums i cançons com a preferits..."**
  The `favorito_musica` and `favorito_album` tables register favorites with timestamps.

---

## Project File Structure

* `bd_spotify.sql`
  Creates the database and all tables with appropriate primary/foreign keys and data types.

* `dados_spotify.sql`
  Inserts fictional data covering users, artists, playlists, songs, favorites, and relationships.

* `consultas_spotify.sql`
  SQL queries to validate the relational model and test features like favorites, follows, and playlists.

* `der_spotify.png` *(optional)*
  Entity-relationship diagram exported from MySQL Workbench.

---

## How to Generate the ERD in MySQL Workbench

1. Open MySQL Workbench
2. Click `File > New Model`
3. Go to `Database > Reverse Engineer`
4. Select the `spotify` database connection
5. Choose the tables and finish
6. In the sidebar, open `EER Diagram`
7. Organize the entities and export via `File > Export > PNG`

---
