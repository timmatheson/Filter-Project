require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'
require 'lib/barking_iguana'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

DataMapper.auto_migrate!

def new_filter(options = {})
  filter = Filter.new
  filter.attributes = options
  filter.save!
  filter
end