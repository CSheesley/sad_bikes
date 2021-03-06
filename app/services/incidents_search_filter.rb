class IncidentsSearchFilter
  attr_reader :params, :response_json, :sort_date_by, :type

  def initialize(search, search_params)
    @params = search_params
    @response_json = search.response_json
    @sort_date_by = search_params[:sort_date_by] || 'desc'
    @type = search_params[:type] || nil
  end

  def results
    incidents = base_incidents
    incidents = apply_date_ordering(incidents)
    incidents = apply_type_filtering(incidents)

    incidents
  end

  private

  def base_incidents
    parsed = JSON.parse(response_json, symbolize_names: true)
    parsed[:incidents]
  end

  def apply_date_ordering(incidents)
    case
    when sort_date_by.downcase == 'desc'
      sorted = incidents.sort_by { |inc| inc[:occurred_at] }.reverse
    when sort_date_by.downcase == 'asc'
      sorted = incidents.sort_by { |inc| inc[:occurred_at] }
    end

    sorted
  end

  def apply_type_filtering(incidents)
    return incidents unless type.present?

    case
    when type.downcase == 'hazard'
      filtered = incidents.select { |inc| inc[:type] == "Hazard" }
    when type.downcase == 'theft'
      filtered = incidents.select { |inc| inc[:type] == "Theft" }
    end

    filtered
  end

end
