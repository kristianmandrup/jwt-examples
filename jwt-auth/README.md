# jwt-auth

Jwt-Auth is an authorization library for Ruby on Rails which restricts what resources a given user is allowed to access. All permissions are defined in single class and not duplicated across controllers, views, and database queries.


## Mission

Our mission is to keep JWT Web Tokens alive and moving forward, with maintenance fixes and new features. Pull Requests are welcome!

I am currently focusing on the 1.x branch for the immediate future, making sure it is up to date as well as ensuring compatibility with Rails 4+. I will take a look into the 2.x branch and try to see what improvements and go forward from there.

Any help is greatly appreciated, feel free to submit pull-requests or open issues.


## Installation

In **Rails 4**, add this to your Gemfile and run the `bundle install` command.

    gem 'jwt-auth'

## Getting Started

First, set up some authentication using JWT if you need different behavior.

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact
=======
Jwt Web Tokens
====================================

This application is using with JSON Web Token (JWT) is a compact URL-safe means of representing claims to be transferred between two parties. The claims in a JWT are encoded as a JSON object that is digitally signed using JSON Web Signature (JWS).

Setup rails application
------------------------------------

Steps to follow for Jwt Web Tokens:

* Get pull of this repository code. 
* bundle install
* Setup database settings into: 'config/database.yml' 
* Run: rake db:create db:migrate db:seed
* Start the rails server by command: rails s
* User will lands on login page.
* Credentials: email => 'jwt@example.com' & password => 'jwt123'
* After login user will be redirect to '/posts url'
* User will see some of the posts already created using seeds file and a form to create a new posts.
* User can perform all CRUD operations.

Ruby on Rails
---------------------------------------

Application's environment:

* Rails version => 4.2.0
* Ruby version  => 2.2.0-p0 (x86_64-linux)
* RubyGems version => 2.4.5
* Rack version => 1.5

Database
---------------------------------------

This application uses PostgreSQL with ActiveRecord.

Development
---------------------------------------

* Template Engine: ERB
* Testing Framework: RSpec and Factory Girl and Cucumber
* Front-end Framework: Twitter Bootstrap (Sass)
* Form Builder: SimpleForm
* Authentication: JWT 
* Authorization: JWT

Documentation and Support
---------------------------------------

This is the only documentation.
