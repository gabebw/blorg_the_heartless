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
end

