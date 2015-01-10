require "rails_helper"

feature "User visits homepage" do
  scenario "and sees results of searching Twitter" do
    stub_matching_search(" the ", "Tyler the Creator")

    visit root_path

    expect(page).to have_content "Tyler the Creator"
  end
end

