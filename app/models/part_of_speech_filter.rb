class PartOfSpeechFilter
  def initialize(possible_titles)
    @possible_titles = possible_titles.compact
    @classifier = PartOfSpeechClassifier.new
  end

  def filter
    tagged_titles.compact
  end

  private

  def tagged_titles
    @possible_titles.map do |title|
      if @classifier.adjective?(title.downcase)
        { word: title, type: "adjective" }
      elsif @classifier.noun?(title.downcase)
        { word: title, type: "noun" }
      else
        nil
      end
    end
  end

  def valid_title?(title)
    @classifier.adjective?(title.downcase) ||
      @classifier.noun?(title.downcase)
  end
end
