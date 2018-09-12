# AdQuick Challenge

## Setup the App

Create a copy of config/database.yml and fill in username and database.

  `cp config/database.example.yml config/database.yml`

Install gems/packages

  `bundle install`

Create database

  `rake db:create`

Run migrations

  `rake db:migrate`

Create seed data

 `rake db:seed`

## Starting the App

Run the server

  `rails s`


## Specs

Setup test database

  `rake db:test:prepare`

Run tests

  `bundle exec rspec


## TODOS/Outstanding Issues

1. Needs a lot of styling
2. Notification shows up at the top of the page but should float and scroll
3. Refresh/reorder list after voting
4. Time decay on score
5. Add content to landing page
