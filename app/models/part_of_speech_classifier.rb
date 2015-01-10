class PartOfSpeechClassifier
  def initialize
    @tagger = EngTagger.new
  end

  def noun?(word)
    nouns = @tagger.get_nouns(tagged(word)).keys

    nouns == [word]
  end

  def adjective?(word_or_phrase)
    with_tags = tagged(word_or_phrase)
    adjectives = @tagger.get_adjectives(with_tags).merge(
      @tagger.get_comparative_adjectives(with_tags).merge(
        @tagger.get_superlative_adjectives(with_tags)
      )
    ).keys

    adjectives.sort == word_or_phrase.split(" ").sort
  end

  private

  def tagged(word)
    @tagger.add_tags(word)
  end
end
