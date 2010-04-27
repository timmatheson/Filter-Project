require 'spec_helper'

describe "StockTwits Filter App" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  it "should respond to /" do
    get '/'
    last_response.should be_ok
    last_response.headers["Content-type"].should == "application/json"
  end
  
  it "should respond to /filters" do
    get '/filters'
    last_response.should be_ok
    last_response.headers["Content-type"].should == "text/html"
  end
  
  it "should respond to /filters/new" do
    get '/filters/new'
    last_response.should be_ok
    last_response.headers["Content-type"].should == "text/html"
  end
  
  it "should respond to /filters/create" do
    post '/filters/create', :filter => {:name => "My Filter"}
    last_response.should be_redirect
  end
  
  it "should respond to /filters/update/id" do
    put '/filters/update', :id => new_filter.id, :filter => {:name => "My Filter"}
    last_response.should be_redirect
  end
  
  it "should respond to /filters/destroy/id" do
    delete '/filters/destroy', :id => new_filter.id
    last_response.should be_redirect
  end
end