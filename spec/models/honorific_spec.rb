require "spec_helper"

describe Honorific do
  it "has a reader for the text of the tweet" do
    honorific = Honorific.new("text", "word")

    expect(honorific.text).to eq "text"
  end

  it "has a reader for the actual honorific word" do
    honorific = Honorific.new("text", "word")

    expect(honorific.word).to eq "word"
  end

  it "has an accessor for part_of_speech" do
    honorific = Honorific.new("text", "word")

    honorific.part_of_speech = "noun"

    expect(honorific.part_of_speech).to eq "noun"
  end
end
