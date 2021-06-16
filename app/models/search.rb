class Search < ApplicationRecord
  validates :zipcode, presence: true
  validates :response_json, presence: true


  def self.find_or_create_by_recent_zip(search_params)
    find_or_create_by(criteria(search_params)) do |search|
      search.zipcode = search_params[:zipcode]
      search.response_json = BikeWiseService.new(search_params).incidents_json
    end
  end

  def self.criteria(search_params)
    {
      zipcode: search_params[:zipcode],
      created_at: 48.hours.ago..0.hours.ago
    }
  end

end
