class Api::V1::IncidentsController < ApplicationController
  before_action :validate_params, only: [:index]

  def index
    search = find_or_create_search
    filtered_incidents = IncidentsSearchFilter.new(search).results

    render status: 200, json: IncidentsSerializer.new(filtered_incidents).to_hash
  end

  private

  def validate_params
    validate_zipcode
  end

  def validate_zipcode
    return if zipcode_is_valid?
    render status: 422, json: { errors: ":zipcode param must be 5 digits, and only include numbers"}
  end

  def zipcode_is_valid?
    zipcode = search_params[:zipcode]
    (00501..99950).include?(zipcode.to_i)
  end

  def find_or_create_search
    Search.find_or_create_by(search_criteria) do |search|
      search.params = search_params
      search.response_json = BikeWiseService.new(search_params).incidents_json
    end
  end

  def search_criteria
    {
      params: { zipcode: search_params[:zipcode] },
      created_at: 48.hours.ago..0.hours.ago
    }
  end

  def search_params
    params.permit(:zipcode, :sort_date_by, :type)
  end

end
