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
  
  it "should respond to /filters/:id/update" do
    get "/filters/#{new_filter.id}/update", :filter => {:name => "My Filter"}
    last_response.should be_redirect
  end
  
  it "should respond to /filters/:id/delete" do
    get "/filters/#{new_filter.id}/delete"
    last_response.should be_redirect
  end
end