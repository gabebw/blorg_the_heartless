class NameTransformer
  REGEX = /.*\b([a-z][^ ]+) the \b([a-z][^ ]+)\b.*/i

  def initialize(tweet_texts)
    @tweet_texts = tweet_texts
  end

  def transform
    @tweet_texts.map do |text|
      text.gsub(/\s+/, " ").gsub(REGEX) do
        name = $1
        title = $2
        "#{name.capitalize} the #{title.capitalize}"
      end
    end
  end
end