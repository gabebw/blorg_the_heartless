require "spec_helper"

describe TwitterClient do
  context "#search" do
    it "finds recent English-language tweets matching ' the '" do
      stub_matching_search(" the ", "Tyler the Creator", lang: "en", result_type: "recent")
      client = TwitterClient.new

      results = client.search

      expect(results.first).to include " the "
    end

    it "excludes retweets" do
      stub_matching_search(" the ", "Tyler the Creator", exclude: "retweets")
      client = TwitterClient.new

      results = client.search

      expect(results).not_to be_empty
    end

    it "takes at most 200 items" do
      stub_matching_search(" the ", "Tyler the Creator", count: 201)
      client = TwitterClient.new

      results = client.search

      expect(results.size).to eq ENV.fetch("NUMBER_OF_TWEETS_TO_FETCH").to_i
    end
  end
end
