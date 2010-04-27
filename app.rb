#!/usr/bin/ruby

require 'rubygems'
require 'sinatra'
require 'json'
require 'haml'

require 'lib/barking_iguana'
require 'config'
require 'models/filter'
require 'models/feed'

FEED_URL = 'http://api.stocktwits.com/api/streams/public.json'

set :logging, :true

get "/" do
  @feed = Feed.new(test_json_message) # for testing
  content_type :json
  if @feed.spam?
    {:spam => true}.to_json
  else
    @feed.to_json
  end
end

get "/filters" do
  haml :index
end

get "/filters/new" do
  @filter = Filter.new
  haml :new
end

get "/filters/show/:id" do |id|
  redirect "/filters/edit/#{id}"
end

get "/filters/edit/:id" do |id|
  @filter = Filter.get(id)
  haml :edit
end

post "/filters/create" do
  @filter = Filter.new
  @filter.attributes = params[:filter]
  if @filter.save
    # success
    redirect "/filters"
  else
    # fail
    haml :new
  end
end

put "/filters/update/:id" do |id|
  @filter = Filter.get(id)
  if @filter.update(params[:filter])
    # success
    redirect "/filters/edit/#{params[:id]}"
  else
    # fail
    haml :edit
  end
end

delete "/filters/destroy/:id" do |id|
  @filter = Filter.get(id)
  if @filter.destroy
    redirect "/filters"
  else
    haml :index
  end
end

private

def test_json_message
  @test_json_message ||= File.read(File.dirname(__FILE__) + "/json/test_feed.json")
end

__END__
@@ layout
%html
  %head
    %title StokTwits.com Filter App
    %body
      %ul(id='navigation')
        %li
          %a(href='/') Home
        %li 
          %a(href='/filters/new') New Filter
        %li 
          %a(href='/filters') All Filters
      =yield