require "rails_helper"

feature "User visits homepage" do
  scenario "and sees results of searching Twitter" do
    stub_matching_search(" the ", "Tyler the Creator")

    visit root_path

    expect(name).to have_content "Prince Leopold of the Creator"
  end

  scenario "and sees nouns with 'of' like 'of the speed'" do
    stub_matching_search(" the ", "the speed")

    visit root_path

    expect(name).to have_content "Prince Leopold of the Speed"
  end

  scenario "and sees adjectives like 'the speedy'" do
    stub_matching_search(" the ", "the speedy")

    visit root_path

    expect(name).to have_content "Prince Leopold the Speedy"
  end

  scenario "and does not see tweets without X the Y" do
    stub_matching_search(" the ", "hi there")

    visit root_path

    expect(page).not_to have_content "hi there"
  end

  scenario "and sees unescaped HTML" do
    stub_matching_search(" the ", "tyler the creator &amp; there")

    visit root_path

    expect(page).not_to have_content "&amp;"
  end

  scenario "and sees capitalized names with honorifics" do
    stub_matching_search(" the ", "hi there, I'm tyler the creator, hi")

    visit root_path

    expect(name).to eq "Prince Leopold of the Creator"
  end

  scenario "and sees tweets with newlines correctly stripped" do
    stub_matching_search(" the ", "foo\ntyler the creator\nbar")

    visit root_path

    expect(name).to eq "Prince Leopold of the Creator"
  end

  scenario "and does not see tweets with incorrect parts of speech" do
    stub_matching_search(" the ", "for the follow")

    visit root_path

    expect(page).not_to have_any_names
  end

  def have_any_names
    have_css("li")
  end

  def name
    page.find("li strong").text
  end
end
