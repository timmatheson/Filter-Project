configure :development do
  DataMapper.setup(:default, :adapter => 'sqlite3', :database => "db/stocktwits_development.sqlite3")
  DataMapper::Logger.new(STDOUT, :debug)
end

configure :test do
  DataMapper.setup(:default, :adapter => 'sqlite3', :database => "db/stocktwits_test.sqlite3")
  DataMapper::Logger.new(STDOUT, :debug)
end
