namespace :db do
  namespace :admin do
    desc "Create an admin user"
    task :create => :environment do

      User.new(:username => 'spelving', :name => 'George Spelving', :rank => 'TCC', :password => 'foobar', :password_confirmation => 'foobar').save!
    end
  end
end