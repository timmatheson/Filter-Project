require 'spec_helper'

describe Filter do
  it "should be a url filter given filter_type url" do
    Filter.new(:filter_type => "url").url?.should == true
  end
  
  it "should be a twitter filter given filter_type twitter" do
    Filter.new(:filter_type => "twitter_id").twitter?.should == true
  end
  
  it "should be a phrase_or_words filter given filter_type phrase_or_word" do
    Filter.new(:filter_type => "phrase_or_word").phrase_or_words?.should == true
  end
end