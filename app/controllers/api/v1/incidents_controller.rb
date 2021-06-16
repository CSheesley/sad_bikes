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

  def search_params
    params.permit(:zipcode, :sort_date_by, :type)
  end

end
