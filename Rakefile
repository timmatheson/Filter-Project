require 'app'

namespace :db do
  desc "Migrate the database"
  task :migrate do
    DataMapper.auto_upgrade!
  end
  
  desc "Resets the db to its original state"
  task :reset do
    DataMapper.auto_migrate!
  end
  
  desc "Loads some default data into the db"
  task :bootstrap do
    filter = Filter.new
    filter.attributes = {
      :name => "Test", 
      :filter_type => "url", 
      :filter_matcher => "http://bit.ly/silly" }
    filter.save
    filter
  end
end
