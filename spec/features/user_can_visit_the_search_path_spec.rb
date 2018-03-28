require "rails_helper"

describe "As a user" do
  before :all do
    json_response = File.open("./spec/fixtures/stations_by_zip.json")
    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&location=80203&radius=6&status=E&fuel_type=ELEC,LPG&limit=10")
       .to_return(status: 200, body: json_response)
  end
  describe "when I visit the search page" do
    it "I see the attributes of each station" do
      visit "/"

      fill_in "q", with: "80203"
      click_on "Locate"

      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Types")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Access Times")
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    end

    it "I can see a list of the 10 closest stations to 80203" do
      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    end

    it "I see stations limited to electric and propane" do
      # And the stations should be limited to Electric and Propane
    end
  end
end
