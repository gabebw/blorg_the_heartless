class NameTransformer
  REGEX = /\s*the ((?:most )?\b(?:\w\S+))\b/i

  def initialize(tweet_texts)
    @tweet_texts = tweet_texts
  end

  def transform
    @tweet_texts.map do |text|
      title_only(text.gsub(/\s+/, " "))
    end
  end

  private

  def title_only(text)
    title = nil
    text.gsub(REGEX) do
      word = $1
      title = word.downcase
    end
    title
  end
end
