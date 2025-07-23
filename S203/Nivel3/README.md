
# YouTube-Like Platform Database

This project models the database for a simplified video-sharing platform, using JSON files to simulate NoSQL database collections.

---

## Model Overview

The data is organized into the following collections:
- Users: Stores all personal and authentication information for each user.
- Channels: Represents the channels created by users, including a pre-calculated `subscriber_count`.
- Videos: The main collection. Contains all video metadata, plus embedded author details, view/reaction stats, and a full, nested comment tree.
- Subscriptions: A log to record when a user subscribes to a channel.
- Reactions: A log to track likes and dislikes on videos and comments.
- Playlists: Allows users to group videos into custom lists.

---

## How The Model Supports The Interface

The structure is designed to easily support the video page UI.

- From a single `videos` document, the interface has access to:
  - The core video details (title, description, tags).
  - The author's username and channel name from the embedded `author_details` object.
  - The total views, likes, and dislikes from the embedded `stats` object.
  - The entire comment section, including nested replies, from the embedded `comments` array. Each comment and reply also includes its own like/dislike counts.

---

## Files

- `users.json` – User account data.
- `channels.json` – User channel data, including subscriber counts.
- `videos.json` – Main collection with video metadata and embedded comments/stats.
- `subscriptions.json` – Log of channel subscription events.
- `reactions.json` – Log of like/dislike events for videos and comments.
- `playlists.json` – User-created video playlists.