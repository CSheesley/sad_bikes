require 'rails_helper'

RSpec.describe Api::V1::IncidentsController, type: :request do
  describe 'GET /api/v1/incidents' do

    context 'with valid parameters' do
      it 'returns a successful status, with formatted JSON response' do

        get '/api/v1/incidents', params: { zipcode: 80403 }

        parsed = JSON.parse(response.body)
        expected_json= {
          "incidents": [
            {
              id: 76603,
              title: "Stolen 2015 Giant Escape 1(black)",
              description: "",
              address: "Denver, CO, 80401",
              occurred_at: Time.at(1502690400).strftime('%m-%d-%Y %H:%M %Z'),
              url: "https://bikewise.org/api/v1/incidents/76603",
              image_url: "https://files.bikeindex.org/uploads/Pu/95863/large_IMG_6792.JPG",
              type: "Theft",
            }
          ]
        }

        expect(response).to have_http_status(200)
        expect(parsed).to eq(expected_json)
      end

      it 'can sorts the results from newest to oldest by default' do
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
