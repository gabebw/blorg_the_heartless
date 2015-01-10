class NameTransformer
  REGEX = /(\w\S+) the ((?:most )?\b(?:\w\S+))\b/i

  def initialize(tweet_texts)
    @tweet_texts = tweet_texts
  end

  def transform
    @tweet_texts.map do |text|
      name_and_title_only(text.gsub(/\s+/, " "))
    end
  end

  private

  def name_and_title_only(text)
    name_and_title = nil
    text.gsub(REGEX) do
      name = $1
      title = $2
      name_and_title = "#{name.capitalize} the #{title.capitalize}"
    end

    name_and_title
  end
end
