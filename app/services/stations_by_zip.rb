class StationsByZip

  def initialize(zip = 00000)
    @zip = zip
  end

  def stations
    AltFuelByZip.new(@zip).parsed_json[:fuel_stations].each do |station|
      Station.new(station)
    end
  end
end
