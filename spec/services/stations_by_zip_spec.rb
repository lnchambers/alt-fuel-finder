require "rails_helper"

describe StationsByZip do
  it "returns an array of Station objects" do
    json_response = File.open("./spec/fixtures/stations_by_zip.json")
    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&fuel_type=ELEC,LPG&limit=10&location=80903&radius=6&status=E")
       .to_return(status: 200, body: json_response)

    collection = StationsByZip.new(80903).stations

    expect(collection.class).to eq(Array)
    expect(collection.first.class).to eq(Station)
    expect(collection.count).to eq(10)
  end
end
