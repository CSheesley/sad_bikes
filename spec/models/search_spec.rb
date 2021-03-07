require 'rails_helper'

RSpec.describe Search, type: :model do

  describe 'validations' do
    it { should validate_presence_of :zipcode }
    it { should validate_presence_of :response_json }
  end

  describe 'factories' do
    it 'has a working factories' do
      expect {
        search1 = create(:search, :no_incidents)
        search2 = create(:search, :one_incident)
        search3 = create(:search, :some_incidents)
        search4 = create(:search, :many_incidents)
      }.to change{ Search.count }.by(4)
    end
  end

  describe 'class methods' do
    context '::find_or_create_by_recent_zip' do
      let!(:search_params) { ActionController::Parameters.new(zipcode: "80401") }
      let!(:response_json) { file_fixture('one_incident.json').read.rstrip }

      it 'creates a new Search object' do
        expect {
          Search.find_or_create_by_recent_zip(search_params)
        }.to change{ Search.count }.by(1)
      end

      it 'does not create a new Search object, if one with the same zipcode exists and is less than 48 hours old' do
        search = create(:search, zipcode: "80401", response_json: response_json ,created_at: 47.hours.ago)

        expect {
          Search.find_or_create_by_recent_zip(search_params)
        }.to_not change{ Search.count }

        expect(Search.where(zipcode: search_params[:zipcode]).count).to eq(1)
      end

      it 'creates a new Search object, if one with the same zipcode exists and is more than 48 hours old' do
        search = create(:search, zipcode: "80401", response_json: response_json ,created_at: 49.hours.ago)

        expect {
          Search.find_or_create_by_recent_zip(search_params)
        }.to change{ Search.count }.by(1)

        expect(Search.where(zipcode: search_params[:zipcode]).count).to eq(2)
      end
    end
  end



end
