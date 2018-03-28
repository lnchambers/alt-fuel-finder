class Station

  attr_reader :name, :address, :fuel_type, :distance, :access_times

  def initialize(parsed_json)
    @name = parsed_json[:station_name]
    @address = parsed_json[:street_address]
    @fuel_type = parsed_json[:fuel_type_code]
    @distance = parsed_json[:distance]
    @access_times = parsed_json[:access_days_time]
  end

end
