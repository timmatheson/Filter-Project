class Feed
  require 'net/http'
  require 'uri'
  
  attr_reader :twitter_user_id, :body
  
  def initialize(json_message)
    @message         = json_message.is_a?(Hash) ? json_message : JSON.parse(json_message)
    @twitter_user_id = @message["twitter_user_id"]
    @body            = @message["body"] || ""
    @spam            = detect_spam
  end
  
  def spam?
    @spam
  end
  
  def to_json
    @message.to_json
  end
  
  private
  
  def detect_spam
    Filter.all.each do |filter|
      pattern = /#{filter.filter_matcher}/i
      if filter.twitter? and @twitter_user_id == filter.filter_matcher
        return true
      elsif filter.phrase_or_words? and !@body.scan(pattern).empty?
        return true
      elsif filter.url?
        return check_body_for_blacklisted_urls(pattern)
      end
    end
    return false
  end
  
  # Expands URL, even when nested
  def check_body_for_blacklisted_urls(pattern)
    @body.expand_urls.expand_urls.split(" ").collect{|url| true if url =~ pattern }.any?
  end
end