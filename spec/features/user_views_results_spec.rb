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

    expect(page.find("li").text).to eq "Tyler the Creator"
  end

  scenario "and can deal with newlines" do
    stub_matching_search(" the ", "foo\ntyler the creator\nbar")

    visit root_path

    expect(page.find("li").text).to eq "Tyler the Creator"
  end
end
