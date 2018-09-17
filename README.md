# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Running the server locally
`foreman start server`
`foreman run console`
`foreman run annotate`

* Ruby version

* System dependencies

* Configuration

* Database creation

User (Devise gem)
- has many Playlists

Playlist
- has one User (no joint owenership of playlists)
- has many Songs

Song
- can belong to one playlist

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
