class PartOfSpeechFilter
  def initialize(possible_honorifics)
    @possible_honorifics = possible_honorifics.compact
    @classifier = PartOfSpeechClassifier.new
  end

  def filter
    tagged_honorifics.compact
  end

  private

  def tagged_honorifics
    @possible_honorifics.map do |honorific|
      if @classifier.adjective?(honorific.downcase)
        { word: honorific, type: "adjective" }
      elsif @classifier.noun?(honorific.downcase)
        { word: honorific, type: "noun" }
      else
        nil
      end
    end
  end

  def valid_honorific?(honorific)
    @classifier.adjective?(honorific.downcase) ||
      @classifier.noun?(honorific.downcase)
  end
end
