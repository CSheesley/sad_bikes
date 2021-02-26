class Api::V1::IncidentsController < ApplicationController

  def index
    incidents_api_search = ApiIncidentsSearch.new(search_params)

    if incidents_api_search.valid?
      render status: 200, json: incidents_api_search.results
    else
      render status: 422, json: { errors: incidents_api_search.errors }
    end

  end

  private

  # def find_or_create_search
  #   Search.find_or_create_by(search_criteria) do |search|
  #     search.zipcode = search_params[:zipcode]
  #     search.response_json = BikeWiseService.new(search_params).incidents_json
  #   end
  # end

  def search_params
    params.permit(:zipcode, :sort_date_by, :type)
  end

end
