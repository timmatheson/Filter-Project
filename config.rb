require 'dm-core'
DataMapper.setup(:default, :adapter => 'sqlite3', :database => "db/stocktwits_development.sqlite3")