# A Few Notes on This app

## Running the server locally

Foreman is used to manage the environment. There isn't much environment to manage at this time, but foreman is easy enough to work with. See the `Procfile` for command details.

`foreman run server` - runs the site at: http://localhost:4000/
`foreman run console` - rails console
`foreman run annotate` - annotates the models. see: https://github.com/ctran/annotate_models

## Deploying to Heroku
`git push heroku master` - deploys master to heroku
`heroku logs -t` - see what the server is doing

The app should be running at: https://protected-hollows-43986.herokuapp.com/

Application Notes:

Three Models:

User - generated using the Devise gem, and can have many playlists

Playlist - belongs to a user, and can have many tracks

Track - belongs to a Playlist

Database integrity (what there is of it, anyway) is managed using postgres foreign key constaints

The UI is generated using standard rails templates.

The 'add track' button uses a bit of JavaScript to extend the playlist form.

Basic styles courtesy of Materialize: https://materializecss.com/

When a user adds a track, if they fail to fill out all the fields the track data is ignored. Not a great user experience :)


