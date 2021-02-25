require 'rails_helper'

RSpec.describe Api::V1::IncidentsController, type: :request do
  describe 'GET /api/v1/incidents' do

    context 'with valid parameters' do
      it 'returns a successful status, with formatted JSON response' do
      end

      it 'can sort the results from newest to oldest' do
      end

      it 'can sort the results from oldest to newest' do
      end

      it 'can filter results based on the incident type' do
        # hazard, theft - use :some_incidents_json
      end

      context 'creating Search objects' do
        it 'creates a new Search object - with a :response_json attribute' do
        end

        it 'does not create a new Search object if an existing object with the same :zipcode was recently created (last 2 days)' do
        end
      end
    end

    context 'with invalid params' do
      it 'returns an error status and message' do
        # likely a 422
      end
    end

    context 'when the external API errors' do
      it '' do
      end
    end
  end

end
