require 'rails_helper'

RSpec.describe Search, type: :model do

  describe 'validations' do
    it { should validate_presence_of :zipcode }
    it { should validate_presence_of :response_json }
  end


  it 'has a working factories' do
    expect {
      search1 = create(:search, :no_incidents)
      search2 = create(:search, :one_incident)
      search3 = create(:search, :some_incidents)
      search4 = create(:search, :many_incidents)
    }.to change{ Search.count }.by(4)
  end

end
