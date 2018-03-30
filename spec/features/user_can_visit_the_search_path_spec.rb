require "rails_helper"

describe "As a user" do
  describe "when I visit the search page" do
    it "I see the attributes of each station sorted by distance" do
      json_response = File.open("./spec/fixtures/stations_by_zip.json")
      stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&location=80203&radius=6&status=E&fuel_type=ELEC,LPG&limit=10")
         .to_return(status: 200, body: json_response)
      visit "/"

      fill_in "q", with: "80203"
      click_on "Locate"

      within(first(".station")) do
        expect(page).to have_content("Name: UDR")
        expect(page).to have_content("Address: 800 Acoma St")
        expect(page).to have_content("Fuel Type(s): ELEC")
        expect(page).to have_content("Distance: 0.31 miles")
        expect(page).to have_content("Access Times: 24 hours daily")
      end
      expect(page).to_not have_content("LNG")
      expect(page).to_not have_content("HY")
      expect(page).to_not have_content("E85")
      expect(page).to_not have_content("CNG")
      expect(page).to_not have_content("BD")
    end
  end
end
