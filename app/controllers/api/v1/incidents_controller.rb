class Api::V1::IncidentsController < ApplicationController

  def index
    search = find_or_create_search
    #filtered  = Service::SearchFilter(search).results
    #incidents = IncidentsSerializer(search).results

    # render status: :200, json: incidents
  end

  private

  def search_params
    params.permit(:zipcode)
  end

  def find_or_create_search
    criteria = {
      params: { zipcode: search_params[:zipcode].to_i }
    }

    Search.find_or_create_by(criteria) do |search|
      search.response_json = BikeWiseService.new(search_params).to_json
    end
  end
end
