class StationsByZip

  def initialize(zip)
    @zip = zip
  end

  def stations
    AltFuelByZip.new(@zip).parsed_json_response[:fuel_stations].map do |station|
      Station.new(station)
    end
  end
end
