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
    json_response = File.open("./spec/fixtures/stations_by_zip.json")
    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&location=80203&radius=6&status=E&fuel_type=ELEC,LPG&limit=10")
       .to_return(status: 200, body: json_response)
    visit "/"

    fill_in "q", with: "80203"
    click_on "Locate"

    expect(current_path).to eq("/search")
    expect(page).to have_content("results")
  end
end
