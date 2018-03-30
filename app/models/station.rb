class Station

  attr_reader :name,
              :fuel_type,
              :distance,
              :access_times,
              :city,
              :state,
              :zip

  def initialize(parsed_json)
    @name = parsed_json[:station_name]
    @address = parsed_json[:street_address]
    @fuel_type = parsed_json[:fuel_type_code]
    @distance = parsed_json[:distance]
    @access_times = parsed_json[:access_days_time]
    @city = parsed_json[:city]
    @state = parsed_json[:state]
    @zip = parsed_json[:zip]
  end

  def full_address
    "#{@address}, #{@city}, #{@state} #{@zip}"
  end

end
