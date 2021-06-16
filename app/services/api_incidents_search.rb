class ApiIncidentsSearch
  attr_reader :search_params, :errors

  def initialize(search_params)
    @search_params = search_params
    @errors = []
    validate_params
  end

  def results
    search = Search.find_or_create_by_recent_zip(search_params)
    filtered_incidents = IncidentsSearchFilter.new(search, search_params).results
    IncidentsSerializer.new(filtered_incidents).to_hash
  end

  def valid?
    errors.empty?
  end

  def validate_params
    validate_zipcode
    validate_sort_date_by
    validate_type
  end

  def validate_zipcode
    return if zipcode_is_valid?
    errors << ":zipcode param must be 5 digits, and only include numbers"
  end

  def zipcode_is_valid?
    zipcode = search_params[:zipcode]
    (zipcode.to_i).between?(00501, 99950)
  end

  def validate_sort_date_by
    return if (search_params[:sort_date_by].nil? || sort_date_by_is_valid?)
    errors << ":sort_date_by param must be either 'asc' or 'desc'"
  end

  def sort_date_by_is_valid?
    sort_param = search_params[:sort_date_by]
    ["asc", "desc"].include?(sort_param.downcase)
  end

  def validate_type
    return if(search_params[:type].nil? || type_valid?)
    errors << ":type param must be either 'hazard' or 'theft'"
  end

  def type_valid?
    type_param = search_params[:type]
    ["hazard", "theft"].include?(type_param.downcase)
  end

end
