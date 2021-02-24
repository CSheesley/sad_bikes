class Search < ApplicationRecord
  serialize :params

  validates :params, presence: true
  validates :response_json, presence: true

end
