class NameTransformer
  REGEX = /\s*the ((?:most )?\b(?:\w\S+))\b/i

  def initialize(tweet_texts)
    @tweet_texts = tweet_texts
  end

  def transform
    @tweet_texts.map do |text|
      word = honorific_only(text.gsub(/\s+/, " "))
      if word.present?
        Honorific.new(text, word)
      end
    end.compact
  end

  private

  def honorific_only(text)
    honorific = nil
    text.gsub(REGEX) do
      word = $1
      honorific = word.downcase
    end
    honorific
  end
end
