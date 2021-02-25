class Api::V1::IncidentsController < ApplicationController
  before_action :validate_params, only: [:index]

  def index
    search = find_or_create_search
    filtered_incidents = IncidentsSearchFilter.new(search).results

    render status: 200, json: IncidentsSerializer.new(filtered_incidents).to_hash
  end

  private

  def validate_params
    @errors = []

    validate_zipcode
    validate_sort_date_by
    validate_type

    render_errors
  end

  def validate_zipcode
    return if zipcode_is_valid?
    @errors << ":zipcode param must be 5 digits, and only include numbers"
  end

  def zipcode_is_valid?
    zipcode = search_params[:zipcode]
    (00501..99950).include?(zipcode.to_i)
  end

  def validate_sort_date_by
    return if (search_params[:sort_date_by].nil? || sort_date_by_is_valid?)
    @errors << ":sort_date_by param must be either 'asc' or 'desc'"
  end

  def sort_date_by_is_valid?
    sort_param = search_params[:sort_date_by]
    ["asc", "desc"].include?(sort_param.downcase)
  end

  def validate_type
    return if(search_params[:type].nil? || type_valid?)
    @errors << ":type param must be either 'hazard' or 'theft'"
  end

  def type_valid?
    type_param = search_params[:type]
    ["hazard", "theft"].include?(type_param.downcase)
  end

  def render_errors
    return unless @errors.present?
    render status: 422, json: { errors: @errors }
  end

  def find_or_create_search
    Search.find_or_create_by(search_criteria) do |search|
      search.zipcode = search_params[:zipcode]
      search.response_json = BikeWiseService.new(search_params).incidents_json
    end
  end

  def search_criteria
    {
      zipcode: search_params[:zipcode],
      created_at: 48.hours.ago..0.hours.ago
    }
  end

  def search_params
    params.permit(:zipcode, :sort_date_by, :type)
  end

end
