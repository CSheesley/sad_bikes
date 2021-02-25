class Api::V1::IncidentsController < ApplicationController

  def index
    search = find_or_create_search
    #filtered  = Service::SearchFilter(search).results
    #incidents = IncidentsSerializer(search).results

    # render status: :200, json: incidents
  end

  private

  def find_or_create_search
    Search.find_or_create_by(search_criteria) do |search|
      search.response_json = BikeWiseService.new(search_params).incidents_json
    end
  end

  def search_criteria
    {
      params: { zipcode: search_params[:zipcode].to_i },
      created_at: 48.hours.ago..0.hours.ago
    }
  end
  
  def search_params
    params.permit(:zipcode)
  end

end
