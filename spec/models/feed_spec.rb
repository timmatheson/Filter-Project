require 'spec_helper'

describe Feed do
  it "should assign the body instance var" do
    Feed.new({"body" => "The Body"}).body.should == "The Body"
  end
  
  it "should assign the twitter id instance var" do
    Feed.new({"twitter_user_id" => 000000}).twitter_user_id.should == 000000
  end
  
  it "should return a json string for to_json" do
    json = JSON.parse(test_json_message).to_json
    Feed.new(test_json_message).to_json.should == json
  end
  
  it "should be spam when body matches url filter" do
    new_filter(:filter_type => "url", :filter_matcher => "http://google.com")
    Feed.new(test_json_message).spam?.should == true
  end
  
  it "should be spam when body matches word filter" do
    new_filter(:filter_type => "phrase_or_word", :filter_matcher => "WABC radio show re")
    Feed.new(test_json_message).spam?.should == true
  end
  
  it "should be spam when body matches twitter id filter" do
    new_filter(:filter_type => "twitter_id", :filter_matcher => "14078468")
    Feed.new(test_json_message).spam?.should == true
  end
  
end