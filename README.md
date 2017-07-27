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

## Library project
- `rails new library` to setup skeleton structure for library application
- navigate to the library directory and use `Rails server` to run

## Setup database with MySQL on OSX
- run `sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist` to start up mysql server
- once you login to mySQL, `create database library_development;`
- `grant all privileges on library_development.* to 'root'@'localhost' identified by 'password';`
- `FLUSH PRIVILEGES;`
- repeat for library_production and library test
