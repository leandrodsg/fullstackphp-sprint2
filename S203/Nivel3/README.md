
# YouTube-Like Platform Database

This project models the database for a simplified video-sharing platform.

---

## Model Overview

The data is organized into seven collections:
- Users: Stores all personal and authentication information for each user.
- Channels: Represents the channels created by users to publish content.
- Videos: Contains all metadata for the uploaded videos.
- Subscriptions: Tracks which users are subscribed to which channels.
- Comments: Stores user comments on videos, including support for nested replies.
- Reactions: A polymorphic collection to handle likes and dislikes for both videos and comments.
- Playlists: Allows users to group videos into custom lists.

---

## The structure

- From a single `videos` document:
  - Display the core video details (title, description, tags).
  - Retrieve channel details from the `channels` collection using `channel_id`.
  - From the channel, get the author's details from the `users` collection using `created_by`.
  - Calculate the total number of subscribers for the channel by querying `subscriptions.json`.
  - Aggregate likes and dislikes for the video by querying `reactions.json` where `content_type` is "video" and `content_id` matches the video's ID.
  - Retrieve all top-level comments from `comments.json` where `video_id` matches and `parent_comment_id` is `null`.
  - For each comment, retrieve its replies by querying `comments.json` where the `parent_comment_id` matches the top-level comment's ID.
  - For each comment (and its replies), aggregate its likes and dislikes from `reactions.json`.

---

## Example Query Flows

- To display the full video page with all interactions:
  1. Find the video by its `_id` in `videos.json`.
  2. Get the channel details from `channels.json` using the `channel_id` from the video.
  3. Get the user (author) details from `users.json` using the `created_by` field from the channel.
  4. Get all comments for the video from `comments.json` using the `video_id`.
  5. Get all reactions related to the video and its comments from `reactions.json`.
  6. In the application logic, process the comments to build the nested reply structure.
  7. Process the reactions to calculate the like/dislike counts for the video and for each individual comment.

---

## Files

- `users.json` – User account data
- `channels.json` – User channel data
- `subscriptions.json` – Channel subscription data
- `videos.json` – Video metadata
- `comments.json` – Video comments and replies
- `reactions.json` – Likes and dislikes for videos and comments
- `playlists.json` – User-created video playlists