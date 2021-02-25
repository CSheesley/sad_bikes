class Api::V1::IncidentsController < ApplicationController

  def index
    search = find_or_create_search
    filtered_incidents = IncidentsSearchFilter.new(search).results

    render status: 200, json: IncidentsSerializer.new(filtered_incidents).to_hash
  end

  private

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
