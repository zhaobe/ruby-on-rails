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

solution to scaffolding without changing any of the methods inside app/controllers
- had to use `rails g scaffold Recipe title:string instructions:text --force` to overwrite old scaffold
  - had to run mysql and `drop table recipes;` in order to `bin/rails db:migrate RAILS_ENV=development` 
  - run `rails server` and you should be able to see the correct scaffold

## Take Note Of...
- Always run mysql db before going to direct page.

# RoR with Ajax
- `rails new ponies` then `rails generate scaffold Pony name:string profession:string`
- `rake db:migrate` to run migrations for the current env, you can use `rake db:migrate:status` to check the status
- `rails s` to run the rails application, open browser to http://localhost:3000/ponies/new

# Testfile project
- `rails new testfile; cd testfile`
- Add two lines to Gemfile for carrierwave and bootstrap-sass then ran `bundle install`
  - gem 'carrierwave', '~> 0.9'
  - gem 'bootstrap-sass', '~> 2.3.2'
- `rails g model Resume name:string attachment:string` to generate model
  - if the `rails g` hangs during execution that would mean there are generated binstubs from the previous same name project
    - for more information about binstubs read (here) [https://github.com/rbenv/rbenv/wiki/Understanding-binstubs]
    - for rails 4 use this command, `bundle install --binstubs`
    - for rails 5 user this command, `rake app:update:bin` (our project used this one)
    - then run `rails g model Resume name:string attachment: string` and it should work
- `rake db:migrate`
- `rails g controller Resumes index new create destroy` generates the controllers needed
- `rails g uploader attachment` to create an uploader
- Files added/modified:
  - app/models/resume.rb
  - config/routes.rb
  - app/controllers/resumes_controller.rb:
  - app/assets/stylesheets/resumes.css.scss:
  - app/views/layouts/application.html.erb:
  - app/views/resumes/index.html.erb:
  - app/views/resumes/new.html.erb:
  - app/uploaders/attachment_uploader.rb
