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