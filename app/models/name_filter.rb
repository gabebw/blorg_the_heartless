class NameFilter
  MATCHING_FILTER = /[a-z].+ the [a-z].+/i

  def initialize(tweet_texts)
    @tweet_texts = tweet_texts
  end

  def filter
    @tweet_texts.select do |text|
      text =~ MATCHING_FILTER
    end
  end
end
