require "spec_helper"

describe NameFilter do
  context "#filter" do
    it "filters out tweets that do not match 'X the Y'" do
      tweet_texts = [
        "This is lowercase tyler the creator",
        "This is uppercase Tyler the Creator",
        "This is all one word: OnetheWord",
        "BLORG THE HEARTLESS",
      ]

      name_filter = NameFilter.new(tweet_texts)
      results = name_filter.filter

      expect(results).to eq [
        "This is lowercase tyler the creator",
        "This is uppercase Tyler the Creator",
        "BLORG THE HEARTLESS",
      ]
    end
  end
end
