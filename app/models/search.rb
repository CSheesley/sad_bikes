class Search < ApplicationRecord

  validates :zipcode, presence: true
  validates :response_json, presence: true

end
