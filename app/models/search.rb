class Search < ApplicationRecord
  serialize :params

  validates :zipcode, presence: true
  validates :response_json, presence: true

end
