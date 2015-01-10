class PartOfSpeechFilter
  def initialize(possible_honorifics)
    @possible_honorifics = possible_honorifics
    @classifier = PartOfSpeechClassifier.new
  end

  def filter
    tagged_honorifics.compact
  end

  private

  def tagged_honorifics
    @possible_honorifics.map do |honorific|
      if @classifier.adjective?(honorific.word.downcase)
        honorific.part_of_speech = "adjective"
        honorific
      elsif @classifier.noun?(honorific.word.downcase)
        honorific.part_of_speech = "noun"
        honorific
      else
        nil
      end
    end
  end
end
