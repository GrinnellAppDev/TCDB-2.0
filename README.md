# TCDB 2.0

## About

After 12 years, the award wining Tech Consultant Database: TCDB (originally UCDB) is due for an update.  This project aims to duplicate the functionality of TCDB using a modern web framework, [Ruby on Rails](http://rubyonrails.org/) while at the same time improving upon and expanding the original features and interface where prudent.

## Environment

We are using [Ruby 1.9.3](http://www.ruby-lang.org) and the Rails 3.2.8 gem (among others).  Once you have Ruby and Rails installed -- the Ruby enVironment Manager [RVM](http://rvm.io) is wonderful) -- to get started, simply clone this repository:

    $ git clone git@github.com:GrinnellAppDev/TCDB-2.0.git TCDB2

Then install and configure any gems you don't have:

    $ cd TCDB2
    $ bundle install

And start your test server:

    $ rails server

And you're good!  TCDB2 should now be available to explore on port 3000.  Just browse to:

    localhost:3000

in any modern, standards compliant, web browser.
