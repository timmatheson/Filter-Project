class Filter  
  include DataMapper::Resource
  Types = {
    "Blacklist Twitter ID" => "twitter_id", 
    "Black List Phrase or Words" => "phrase_or_word",
    "Black List URL" => "url"
  }

    property :id,               Serial
    property :name,             String
    property :filter_type,      String
    property :filter_matcher,   String
  
  def url?
    filter_type? "Black List URL"
  end
  
  def twitter?
    filter_type? "Blacklist Twitter ID"
  end
  
  def phrase_or_words?
    filter_type? "Black List Phrase or Words"
  end
  
  protected
  
  def filter_type?(key)
    filter_type == Types[key]
  end
end