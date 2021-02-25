class IncidentsSerializer
  attr_reader :response_json

  def initialize(search)
    @response_json = search.response_json
  end

  def results
    { incidents: serialized_incidents }
  end

  def serialized_incidents
    parsed_json[:incidents].map do |inc|
      {
        id: inc[:id],
        type: inc[:type],
        title: inc[:title],
        description: inc[:description],
        address: inc[:address],
        occurred_at: inc[:occurred_at],
        date_and_time: Time.at(inc[:occurred_at]).strftime('%m-%d-%Y %H:%M'),
        url: inc[:url],
        image_url: inc[:media][:image_url]
      }
    end
  end

  def parsed_json
    JSON.parse(@response_json, symbolize_names: true)
  end

end
