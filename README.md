# README

## prepare for install
- Ubuntu or Linux system, WSL on windows
- Ruby version 3.0.0
- Postgres DB
- libpq-dev
- Rails 6
- Node version > 12.15
## Install
1, run command
```sh
bundle install
```

2, config database: access `config/database.yml` and change config variable of database connect to development and production section, like below:
```yml
# SQLite. Versions 3.8.0 and up are supported.
#   gem install sqlite3
#
#   Ensure the SQLite 3 gem is defined in your Gemfile
#   gem 'sqlite3'
#
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  port: 5432

development:
  <<: *default
  database: rails_react
  password: 123456
  username: postgres
  host: 127.0.0.1

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  adapter: sqlite3
  database: db/test.sqlite3

production:
  <<: *default
  database: rails_react_prod
  password: 123456
  username: postgres
  host: 127.0.0.1
```
3, database install
```sh
rake db:create
rake db:migrate
```
4, webpack install
```sh
npm install -g yarn
bundle exec rake webpacker:install
bundle exec rake webpacker:install:react
yarn install
```
5, Run serve in local
```sh
rails s
```