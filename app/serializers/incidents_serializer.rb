class IncidentsSerializer
  attr_reader :filtered_incidents

  def initialize(filtered_incidents)
    @filtered_incidents = filtered_incidents
  end

  def to_hash
    { incidents: serialized_incidents }
  end

  def serialized_incidents
    filtered_incidents.map do |inc|
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

end
