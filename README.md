# ruby-on-rails
Explore ruby on rails

# Setup
## Install Ruby/Gem
- use `ruby -v` to check your if you have ruby installed already
- make sure to have ruby version 2.2.2 or higher
- use `gem --version` to check the gem version

## Install Rails
- use `gem install rails` to install rails
- check the rails version with `rails -v`

## Demo project
- use `rails new demo` to create a new demo project, and `cd demo` to move into demo
- `rails server` should start the server and you may access it at localhost:3000
- you should see a Yay! You're on Rails! webpage

# Library project
- `rails new library` to setup skeleton structure for library application
- navigate to the library directory and use `Rails server` to run

## Setup database with MySQL on OSX
- run `sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist` to start up mysql server
- once you login to mySQL, `create database library_development;`
- `grant all privileges on library_development.* to 'root'@'localhost' identified by 'password';`
- `FLUSH PRIVILEGES;`
- repeat for library_production and library test
- after creating the three databases, you will need to configure /library/config/database.yml

```ruby
development:
   adapter: mysql
   database: library_development
   username: root
   password:
   host: localhost

test:
   adapter: mysql
   database: library_test
   username: root
   password:
   host: localhost

production:
   adapter: mysql
   database: library_production
   username: root
   password:
   host: localhost
```
- had to add `gem 'mysql2'` to library/Gemfile, then run `bundle install` to install missing gems

## Setup database with PostgreSQL via Homebrew on OSX
- if you already have PostgreSQL installed through Homebrew run:
  - `brew services start postgresql` to start postgres
  - `brew services stop postgresql` to stop postgres
  - `brew services restart postgresql` to restart postgres

## Creating Active Records
- `cd library; rails generate model Book`
- `rails generate model Subject`
- These commands generate the model file which holds all the methods

## Creating Migrations
- `cd library; rails generate migration books`
- `rails generate migration subjects`
- The commands above generate the rails migration, it keeps the db schema sync between developers.

## Creating Controllers
- run `rails generate controller Book` to create files for Book controller.

## Creating Routes
- edit library/config/routes.rb
- run `rake routes` to list all the defined routes 

## Creating Views
- run `rails server` to start the server and go to localhost:3000/book/list to see list.html.erb
  - created a view file for the listing (list method)
  - created a view file for adding a new book (new method)
  - created a view file for showing the book in the system (show method)
  - created a view file for editing a book (edit method)

## Creating Layouts
- added a library/app/views/layouts/standard.html.erb to handle layout
- then added a line of code in library/app/controllers/book_controller.rb in order to use new standard.html.erb layout
- style not in pipeline error solution: stylesheets should be in library/app/assets/stylesheets/style.css

## Take Note Of...
- The library/db/migrate/*_subjects.rb and library/db/migrate/*_books.rb file have drop_table first and then creation of the tables in self.up. Should remove the drop_table line of code.
- There are specific syntax that are updated. Such as the confirmation deletion prompt takes in a `data {}` in Rails v5.

## Issues
- Encountered an error with running `rake db:migrate`, ran `gem install bundler; bundle install` but did not resolve error.

# Cookbook project
- `rails new cookbook` and `create database cookbook;` in mysql
- passwords in database.yml should be empty with no spaces as the value, and changed the adapter to 'mysql2'
- `cd cookbook` and add `gem 'mysql'` to cookbook/Gemfile before you run `rails generate scaffold recipe`

## Cookbook controller
- the controller is in cookbook/app/controllers/recipes_controller.rb
- ran `rake db:migrate RAILS_ENV=development` and successfully migrated tables
- cd into /cookbook and then run `rails server` and new localhost:3000/recipes should direct to cookbook
TODO: need to fix the form rendering for recipe/new
