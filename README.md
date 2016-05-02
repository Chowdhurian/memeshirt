Sinatra
=============

Brought to you by Lighthouse Labs

## Getting Started

1. `bundle install`
2. `shotgun -p 3000 -o 0.0.0.0`
3. Visit `http://localhost:3000/` in your browser


## Deployment

Via [Dokku](http://dokku.viewdocs.io/dokku/)

### Setup

1. Get your ssh key added to dokku
2. Add a new remote git `git remote add dokku dokku@memeshirt-dokku.broodtech.com:memeshirt/memeshirt`

### Pushing a new build

1. From `master` branch, do a pull to get everything up to date.
2. `git push dokku master`

### Setup ENV

1. Make a copy of `example.env` and rename it to `.env`.
2. Replace the values with keys appropriate to your system.
3. Put `.env` into .gitignore
