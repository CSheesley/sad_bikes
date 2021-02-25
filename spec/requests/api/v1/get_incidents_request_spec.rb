require 'rails_helper'

RSpec.describe Api::V1::IncidentsController, type: :request do
  describe 'GET /api/v1/incidents' do

    context 'with valid parameters' do
      it 'returns a successful status, with formatted JSON response' do

        get '/api/v1/incidents', params: { zipcode: "80401" }

        parsed = JSON.parse(response.body, symbolize_names: true)
        expected_body = {
          incidents: [
            {
              id: 76603,
              type: "Theft",
              title: "Stolen 2015 Giant Escape 1(black)",
              description: "",
              address: "Denver, CO, 80401",
              occurred_at: 1502690400,
              date_and_time: Time.at(1502690400).strftime('%m-%d-%Y %H:%M'),
              url: "https://bikewise.org/api/v1/incidents/76603",
              image_url: "https://files.bikeindex.org/uploads/Pu/95863/large_IMG_6792.JPG"
            }
          ]
        }

        expect(response).to have_http_status(200)
        expect(parsed).to eq(expected_body)
      end

      it 'sorts the results from newest to oldest by default' do
        get '/api/v1/incidents', params: { zipcode: "80038" }

        parsed = JSON.parse(response.body, symbolize_names: true)
        expected_json = file_fixture('three_incidents.json').read.rstrip

        response_dates = parsed[:incidents].map { |inc| inc[:date_and_time] }
        expected_dates = date_strings_appearance_order(expected_json)

        expect(response).to have_http_status(200)
        expect(response_dates).to eq(expected_dates)
        expect(response_dates).to eq(["08-27-2020 16:13", "08-01-2020 15:00", "12-04-2017 23:00"])
      end

      it 'can sort the results from oldest to newest' do
        get '/api/v1/incidents', params: { zipcode: "80038", sort_date_by: 'asc' }

        parsed = JSON.parse(response.body, symbolize_names: true)
        expected_json = file_fixture('three_incidents.json').read.rstrip

        response_dates = parsed[:incidents].map { |inc| inc[:date_and_time] }
        expected_dates = date_strings_appearance_order(expected_json).reverse

        expect(response).to have_http_status(200)
        expect(response_dates).to eq(expected_dates)
        expect(response_dates).to eq(["12-04-2017 23:00", "08-01-2020 15:00", "08-27-2020 16:13"])
      end

      it 'can filter results based on the incident type' do
        # get '/api/v1/incidents', params: { zipcode: xxxxx, type: 'hazard' }
        # hazard, theft - use :some_incidents_json
      end

      context 'creating Search objects' do
        it 'creates a new Search object - with a :response_json attribute' do
          expect {
            get '/api/v1/incidents', params: { zipcode: "80401" }
          }.to change { Search.count }.by(1)

          search = Search.last
          expected_json = file_fixture('one_incident.json').read.rstrip

          expect(search.params[:zipcode]).to eq("80401")
          expect(search.response_json).to eq(expected_json)
        end

        it 'does not create a new Search object if an existing object with the same :zipcode was created in the last 48 hours' do
          search = create(:search, :one_incident, created_at: 47.hours.ago)

          expect {
            get '/api/v1/incidents', params: { zipcode: search.params[:zipcode] }
          }.to_not change { Search.count }

          expect(Search.last).to eq(search)
        end

        it 'creates a new Search object if an existing object with the same :zipcode was created more than 48 ago' do
          search = create(:search, :one_incident, created_at: 49.hours.ago)

          expect {
            get '/api/v1/incidents', params: { zipcode: search.params[:zipcode] }
          }.to change { Search.count }.by(1)

          expect(Search.last).to_not eq(search)
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

  # helpers
  def date_strings_appearance_order(raw_json)
    parsed = JSON.parse(raw_json, symbolize_names: true)

    parsed[:incidents].map do |inc|
      Time.at(inc[:occurred_at]).strftime('%m-%d-%Y %H:%M')
    end
  end

end
