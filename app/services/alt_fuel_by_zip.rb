class AltFuelByZip

  def initialize(zip)
    @zip = zip
  end

  def conn
    Faraday.new(api_url)
  end

  def parsed_json_response
    JSON.parse(conn.get.body, symbolize_names: true)
  end

  private

    def api_url
      "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&location=#{@zip}&radius=6&status=E&fuel_type=ELEC,LPG&limit=10"
    end

end
