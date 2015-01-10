class NameFilter
  MATCHING_FILTER = /\w+ the \w+/i

  def initialize(tweet_texts)
    @tweet_texts = tweet_texts
  end

  def filter
    @tweet_texts.select do |text|
      text =~ MATCHING_FILTER &&
        text !~ /@[a-z]\S+ the/
    end
  end
end
