require "spec_helper"

describe NameTransformer do
  context "#filter" do
    it "transforms a text containing X the Y into just X the Y" do
      tweet_texts = ["hello i am the Creator, hi"]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results.map(&:word)).to eq %w(creator)
    end

    it "associates the original tweet text with the Honorific" do
      tweet_texts = ["hi i'm the speedy one"]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results.map(&:text)).to eq tweet_texts
    end

    it "allows 'the X'" do
      tweet_texts = ["the speed"]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results.map(&:word)).to eq %w(speed)
    end

    it "capitalizes X and Y in 'X the Y'" do
      tweet_texts = [
        "hello i am tyler the creator, hi",
      ]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results.map(&:word)).to eq %w(creator)
    end

    it "allows 'the most X'" do
      tweet_texts = ["you're the most precious"]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results.map(&:word)).to eq ["most precious"]
    end

    it "can filter better" do
      tweet_texts = [
        "Daniel tosh is the 3rd harbaugh brother"
      ]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results.map(&:word)).to eq ["3rd"]
    end

    it "can handle this" do
      tweet_texts = [
        "20 bucks I'll give you the 7 points"
      ]

      name_transformer = NameTransformer.new(tweet_texts)
      results = name_transformer.transform

      expect(results).to be_empty
    end
  end
end
