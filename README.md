# TCDB 2.0

## About

After 12 years, the award wining Tech Consultant Database: TCDB (originally UCDB) is due for an update.  This project aims to duplicate the functionality of TCDB using a modern web framework, [Ruby on Rails](http://rubyonrails.org/) while at the same time improving upon and expanding the original features and interface where prudent.

## Environment

### Setup

We are using [Ruby 1.9.3](http://www.ruby-lang.org) and the Rails 3.2.8 gem (among others).  Once you have Ruby and Rails installed -- the Ruby enVironment Manager [RVM](http://rvm.io) is wonderful) -- to get started, simply clone this repository:

    $ git clone git@github.com:GrinnellAppDev/TCDB-2.0.git tcdb2

Then install and configure any gems you don't have:

    $ cd tcdb2
    $ bundle install

Migrate the databases and prepare the test database:

	$ rake db:migrate
	$ rake db:test:prepare

### Test

You can view the status of the tests by running [rspec](http://rubygems.org/gems/rspec-rails):

	$ rspec spec/

### Run

Start your development server..

    $ rails server

And you're good!  TCDB2 should now be available to explore on port 3000.  Just browse to:

    localhost:3000

in any modern, standards compliant, web browser.

## Resources

### Release

Stable versions of TCDB2 are available on [Heroku](http://www.heroku.com/) at:

    [http://tcdb2.herokuapp.com](http://tcdb2.herokuapp.com)

### Planning

We use [Trello](http://trello.com) to plan each iteration and track our progress.  You can view the current status of the project on [our TCDB2 Trello board](https://trello.com/board/tcdb-2-0-development/5063d611b2c095dd52060af1).  

### Continuous Integration

We are experimenting with the [Travis-CI](http://travis-ci.org) continuous integration server.  You can view the status of TCDB2 at anytime by visiting:

    [https://travis-ci.org/#!/GrinnellAppDev/TCDB-2.0](https://travis-ci.org/#!/GrinnellAppDev/TCDB-2.0)

### Version Control

[Obviously], we use [git](http://git-scm.com/) to manage our code.  This project can be found on [Github](http://github.com) at:
    
    [https://github.com/GrinnellAppDev/TCDB-2.0](https://github.com/GrinnellAppDev/TCDB-2.0)

If you are compelled to contribute, shoot us a pull request!


