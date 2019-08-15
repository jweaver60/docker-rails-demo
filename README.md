# Docker Rails development

This is just a demo app for using `docker` as a development environment for
Rails projects. The environment includes Postgres, Redis, Sidekiq, Webpacker,
Mailcatcher and Rails without needing any of those installed on the local
machine.

## How To

- Make sure (Docker for Mac)[https://docs.docker.com/docker-for-mac/install/] is
  installed.
- Run `docker-compose build` to build the images for the first time.
= Run `docker-compose run web yarn install` to install JS assets.
= Run `docker-compose run web rake db:create` to create the database.
= Run `docker-compose run web rake db:migrate` to migrate the database.
= Run `docker-compose up` to start the app.
- Run `docker-compose down` from another terminal tab (or Ctrl-C) to quit.
- For subsequent runs just use `docker-compose up`.

To run ruby commands (if you don't have/want ruby installed locally) you can
run them through a container. For example, to create a new model you can use
`docker-compose run web rails g model User` to create a container that will
have access to the ruby environment. You can also use this to get into the rails
console: `docker-compose run web rails console`.
