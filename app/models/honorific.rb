class Honorific
  def initialize(text, word)
    @text = text
    @word = word
  end

  attr_accessor :part_of_speech
  attr_reader :text, :word
end
