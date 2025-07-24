# Spotify Clone - Music Streaming System

This project implements a relational database for a music streaming platform inspired by Spotify.

## How to Run

1. Execute `bd_spotify.sql` to create the database structure
2. Execute `dados_spotify.sql` to populate with sample data
3. Execute queries from `consultas_spotify.sql` to test the system

## Project Structure

### Main Entities

User (users)
- Account and profile management (email, username, password)
- Personal data (birth date, gender, country, postal code)
- Account type tracking (free/premium)
- Unique constraints on email and username

Subscription (subscriptions)
- Premium account management (payment method, amount)
- Payment history tracking (order numbers, dates)
- Active/cancelled status control
- Credit card and PayPal support

Artist (artists)
- Basic profile information
- Image URL storage
- Similar artists relationships
- Follower tracking capability

### Content Structure

Albums (albums)
- Direct artist attribution
- Release date tracking
- Cover image URL storage
- Content organization

Songs (songs)
- Duration tracking in seconds
- Play count monitoring
- Album relationship management
- Unique song identification

### User Interactions

Playlists (playlists)
- Public/private sharing options
- Creation and deletion date tracking (a null deletion date means the playlist is active)
- Song count tracking
- Playlist contributions tracking

User Relations
- Artist following with timestamps (user_artists)
- Song favorites with tracking (favorite_songs)
- Album favorites with tracking (favorite_albums)
- Playlist contributions with user attribution (playlist_songs)