require "spec_helper"

describe PartOfSpeechClassifier do
  it "can determine if a word is a noun" do
    classifier = PartOfSpeechClassifier.new

    result = classifier.noun?("creator")

    expect(result).to be true
  end

  it "can determine if a word is a noun" do
    classifier = PartOfSpeechClassifier.new

    result = classifier.noun?("Is")

    expect(result).to be false
  end

  it "can determine if a word is an adjective" do
    classifier = PartOfSpeechClassifier.new

    result = classifier.adjective?("precious")

    expect(result).to be true
  end

  it "can determine if a phrase is an adjective" do
    classifier = PartOfSpeechClassifier.new

    result = classifier.adjective?("most precious")

    expect(result).to be true
  end
end
