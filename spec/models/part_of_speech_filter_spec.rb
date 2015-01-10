require "spec_helper"

describe PartOfSpeechFilter do
  context "#filter" do
    it "allows adjectives" do
      texts = ["amazing"]

      filter = PartOfSpeechFilter.new(texts)
      result = filter.filter

      expect(result).to eq([{ word: "amazing", type: "adjective" }])
    end

    it "allows other adjectives" do
      texts = ["Heartless"]

      filter = PartOfSpeechFilter.new(texts)
      result = filter.filter

      expect(result).to eq([{ word: "Heartless", type: "noun" }])
    end

    it "allows nouns" do
      texts = ["Creator"]

      filter = PartOfSpeechFilter.new(texts)
      result = filter.filter

      expect(result).to eq([{ word: "Creator", type: "noun" }])
    end

    it "allows adjective phrases" do
      texts = ["most precious"]

      filter = PartOfSpeechFilter.new(texts)
      result = filter.filter

      expect(result).to eq([{ word: "most precious", type: "adjective" }])
    end

    it "disallows some nouns" do
      texts = ["follow"]

      filter = PartOfSpeechFilter.new(texts)
      result = filter.filter

      expect(result).to be_empty
    end

    it "can handle nils" do
      texts = [nil]

      filter = PartOfSpeechFilter.new(texts)
      result = filter.filter

      expect(result).to be_empty
    end
  end
end
