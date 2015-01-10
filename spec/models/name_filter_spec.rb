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

    it "allows @names in the tweet" do
      tweet_texts = [
        "This is something tyler the creator @gabebw",
      ]

      name_filter = NameFilter.new(tweet_texts)
      results = name_filter.filter

      expect(results).to eq [
        "This is something tyler the creator @gabebw",
      ]
    end

    it "does not match punctuation" do
      tweet_texts = [
        "@kyunghyuncrs my pleasure !1 the name's joy or you can all me your happiness !"
      ]

      name_filter = NameFilter.new(tweet_texts)
      results = name_filter.filter

      expect(results).to be_empty
    end

    it "does not allow usernames as part of the title" do
      tweet_texts = ["@gabebw the one"]

      name_filter = NameFilter.new(tweet_texts)
      results = name_filter.filter

      expect(results).to be_empty
    end
  end
end
