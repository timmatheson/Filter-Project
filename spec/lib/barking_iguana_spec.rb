require 'spec_helper'

describe String do
  it "should expand a url path" do
    "http://bit.ly/silly".expand_urls.should == "http://google.com"
  end
end
