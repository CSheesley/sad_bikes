class BikeWiseService
  attr_reader :zipcode, :square_area

  def initialize(search_params)
    @zipcode = search_params[:zipcode]
    @square_area = 1 # miles
  end

  def incidents_json
    get_incidents.body
  end

  private

  def get_incidents
    conn.get('incidents') do |req|
      req.params['proximity'] = @zipcode
      req.params['proximity_square'] = @square_area
    end
  end

  def conn
    Faraday.new('https://bikewise.org:443/api/v2/') do |f|
      f.adapter Faraday.default_adapter
    end
  end

end
