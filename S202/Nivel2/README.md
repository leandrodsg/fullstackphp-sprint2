# YouTube Clone - Video Management System

This project implements a complete relational database for a video platform inspired by YouTube, strictly following all requirements specified in the assignment.

## Project Structure

### Main Entities

User (user)
- Unique identifier: email, password, username
- Personal data: birth date, gender, country, postal code
- Unique constraints on email and username

Channel (channel)
- Unique name
- Description and creation date
- Linked to an owner user

Video (video)
- Unique identifier with title and description
- File size in bytes
- Video file name and duration
- Thumbnail for preview
- Integrated counters:
  - view_count - number of reproductions
  - like_count - number of likes
  - dislike_count - number of dislikes
- States: public, private, unlisted
- Publication date/time

### Reactions and Comments

Likes/Dislikes on Videos (video_like)
- Like/dislike record per user
- Single vote per user per video
- Interaction date/time

Likes/Dislikes on Comments (comment_like)
- Similar system for comments
- Allows marking comments as liked/disliked
- Marking date/time

Comments (comment)
- Comment text on specific videos
- Author identification
- Creation date/time

### Organization System

Tags (tag)
- Video categorization
- Unique identifier and tag name
- Many-to-many relationship with videos through video_tag
- Tracking of which user applied the tag
- Application date/time

Playlists (playlist)
- Organized video collections
- Can be public or private
- Unique identifier and name
- Creation date
- Order management through playlist_video

Subscriptions (subscription)
- Relationship between users and channels
- Subscription date/time
- Unique user/channel pairs

### Requirements Implemented:

1. User: Unique email, password, username, personal data
2. Video: Title, description, grandària (file_size), file name, duration, thumbnail
3. Counters: Number of reproductions, likes and dislikes as direct attributes
4. Video states: Public, private, unlisted
5. Tags: Unique identifier, name, marking user, date/time
6. Channel: Unique identifier, name, description, creation date
7. Subscriptions: User can subscribe to channels with date/time
8. Playlists: Unique identifier, name, public/private, creation date
9. Comments: Unique identifier, text, date/time
10. Comment likes: Like/dislike marking with date/time