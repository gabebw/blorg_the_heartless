require "rails_helper"

feature "User visits homepage" do
  scenario "and sees results of searching Twitter" do
    stub_matching_search(" the ", "Tyler the Creator")

    visit root_path

    expect(page).to have_content "Tyler the Creator"
  end

  scenario "and does not see tweets without X the Y" do
    stub_matching_search(" the ", "hi there")

    visit root_path

    expect(page).not_to have_content "hi there"
  end

  scenario "and sees capitalized names with titles" do
    stub_matching_search(" the ", "hi there, I'm tyler the creator, hi")

    visit root_path

    expect(page.find("li strong").text).to eq "Tyler the Creator"
  end

  scenario "and sees tweets with newlines correctly stripped" do
    stub_matching_search(" the ", "foo\ntyler the creator\nbar")

    visit root_path

    expect(page.find("li strong").text).to eq "Tyler the Creator"
  end

  scenario "and sees tweets with their original tweets" do
    original_tweet = "Hello, I am tyler the Creator"
    stub_matching_search(" the ", original_tweet)

    visit root_path

    expected = %<Tyler the Creator (from "#{original_tweet}")>
    expect(page.find("li").text).to eq expected
  end
end
