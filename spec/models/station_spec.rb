require "rails_helper"

describe Station, type: :model do
  it "initializes with correct attributes" do
    station = Station.new(
      {
        :station_name=>"Opakawagalaga Eupanifahorious",
        :street_address=>"Yep, got one",
        :fuel_type_code=>"Pikachu!",
        :distance=>0.31422,
        :access_days_time=>"Do you feel lucky?"
        }
      )

    expect(station.name).to eq("Opakawagalaga Eupanifahorious")
    expect(station.address).to eq("Yep, got one")
    expect(station.fuel_type).to eq("Pikachu!")
    expect(station.distance).to eq(0.31422)
    expect(station.access_times).to eq("Do you feel lucky?")
  end
end
