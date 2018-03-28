require 'rails_helper'

feature "User can visit root page" do
  scenario "and view navbar contents" do
    visit "/"
    within(".navbar") do
      expect(page).to have_content("AltFuelFinder")
      expect(page).to have_selector("input[value='Search by zip...']")
    end
  end

  it "I can search by zip code" do
    # When I visit "/"
    visit "/"
    # And I fill in the search form with 80203
    fill_in "q", with: "80203"
    # And I click "Locate"
    click_on "Locate"
    # Then I should be on page "/search" with parameters visible in the url
    expect(current_path).to eq("/search")
  end
end
