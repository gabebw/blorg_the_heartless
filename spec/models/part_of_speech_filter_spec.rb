require "spec_helper"

describe PartOfSpeechFilter do
  context "#filter" do
    it "allows adjectives" do
      honorifics = generate_honorifics("amazing")

      filter = PartOfSpeechFilter.new(honorifics)
      result = filter.filter

      expect(result).to eq honorifics
    end

    it "allows other adjectives" do
      honorifics = generate_honorifics("Heartless")

      filter = PartOfSpeechFilter.new(honorifics)
      result = filter.filter

      expect(result).to eq honorifics
    end

    it "sets the part of speech for adjectives" do
      honorifics = generate_honorifics("speedy")

      filter = PartOfSpeechFilter.new(honorifics)
      result = filter.filter

      expect(result.first.part_of_speech).to eq "adjective"
    end

    it "sets the part of speech for nouns" do
      honorifics = generate_honorifics("wood")

      filter = PartOfSpeechFilter.new(honorifics)
      result = filter.filter

      expect(result.first.part_of_speech).to eq "noun"
    end

    it "allows nouns" do
      honorifics = generate_honorifics("Creator")

      filter = PartOfSpeechFilter.new(honorifics)
      result = filter.filter

      expect(result).to eq honorifics
    end

    it "allows adjective phrases" do
      honorifics = generate_honorifics("most precious")

      filter = PartOfSpeechFilter.new(honorifics)
      result = filter.filter

      expect(result).to eq honorifics
    end

    it "disallows some nouns" do
      honorifics = generate_honorifics("follow")

      filter = PartOfSpeechFilter.new(honorifics)
      result = filter.filter

      expect(result).to be_empty
    end
  end

  def generate_honorifics(word)
    [Honorific.new("the #{word}", word)]
  end
end
