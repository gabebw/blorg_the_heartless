class TwitterClient
  SEARCH_OPTIONS = {
    exclude: "retweets",
    lang: "en",
    result_type: "recent",
  }
  NUMBER_OF_RESULTS = 200

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV.fetch("TWITTER_CONSUMER_KEY")
      config.consumer_secret = ENV.fetch("TWITTER_CONSUMER_SECRET")
      config.access_token = ENV.fetch("TWITTER_ACCESS_TOKEN")
      config.access_token_secret = ENV.fetch("TWITTER_ACCESS_TOKEN_SECRET")
    end
  end

  def search
    @client.search(" the ", SEARCH_OPTIONS).take(NUMBER_OF_RESULTS).map(&:text)
  end
end
