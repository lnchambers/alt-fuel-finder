require "rails_helper"

describe AltFuelByZip do
  it "makes the API call and returns a parsed json response" do
    json_response = File.open("./spec/fixtures/stations_by_zip.json")
    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&fuel_type=ELEC,LPG&limit=10&location=80903&radius=6&status=E")
       .to_return(status: 200, body: json_response)

    search = AltFuelByZip.new(80903).parsed_json_response

    expect(search[:fuel_stations].class).to eq(Array)
    expect(search[:latitude]).to eq(39.731179)
    expect(search[:longitude]).to eq(-104.982637)
  end
end
