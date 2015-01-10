require "spec_helper"

describe NameTransformer do
  context "#filter" do
    it "transforms a text containing X the Y into just X the Y" do
      tweet_texts = [
        "hello i am the Creator, hi",
      ]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results).to eq [
        "creator",
      ]
    end

    it "allows 'the X'" do
      tweet_texts = ["the speed"]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results).to eq ["speed"]
    end

    it "capitalizes X and Y in 'X the Y'" do
      tweet_texts = [
        "hello i am tyler the creator, hi",
      ]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results).to eq [
        "creator",
      ]
    end

    it "allows 'the most X'" do
      tweet_texts = ["you're the most precious"]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results).to eq ["most precious"]
    end

    it "can filter better" do
      tweet_texts = [
        "Daniel tosh is the 3rd harbaugh brother"
      ]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results).to eq ["3rd"]
    end
  end
end
