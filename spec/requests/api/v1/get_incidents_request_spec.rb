require 'rails_helper'

RSpec.describe Api::V1::IncidentsController, type: :request do
  describe 'GET /api/v1/incidents' do

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

    context 'Sorting' do
      # move these into IncidentsSearchFilter - unit tests
      it 'sorts the results from newest to oldest by default' do
        get '/api/v1/incidents', params: { zipcode: "80038" }

        parsed = JSON.parse(response.body, symbolize_names: true)
        bikewise_json = file_fixture('three_incidents.json').read.rstrip

        response_dates = parsed[:incidents].map { |inc| inc[:date_and_time] }
        expected_dates = date_strings_appearance_order(bikewise_json)

        expect(response).to have_http_status(200)
        expect(response_dates).to eq(expected_dates)
        expect(response_dates).to eq(["08-27-2020 16:13", "08-01-2020 15:00", "12-04-2017 23:00"])
      end

      it 'can sort the results from oldest to newest' do
        get '/api/v1/incidents', params: { zipcode: "80038", sort_date_by: "asc" }

        parsed = JSON.parse(response.body, symbolize_names: true)
        bikewise_json = file_fixture('three_incidents.json').read.rstrip

        response_dates = parsed[:incidents].map { |inc| inc[:date_and_time] }
        expected_dates = date_strings_appearance_order(bikewise_json).reverse

        expect(response).to have_http_status(200)
        expect(response_dates).to eq(expected_dates)
        expect(response_dates).to eq(["12-04-2017 23:00", "08-01-2020 15:00", "08-27-2020 16:13"])
      end

      it 'can handle when the :sort_date_by param is not lowercased' do
        get '/api/v1/incidents', params: { zipcode: "80038", sort_date_by: "AsC" }

        parsed = JSON.parse(response.body, symbolize_names: true)
        bikewise_json = file_fixture('three_incidents.json').read.rstrip

        response_dates = parsed[:incidents].map { |inc| inc[:date_and_time] }
        expected_dates = date_strings_appearance_order(bikewise_json).reverse

        expect(response).to have_http_status(200)
        expect(response_dates).to eq(expected_dates)
        expect(response_dates).to eq(["12-04-2017 23:00", "08-01-2020 15:00", "08-27-2020 16:13"])
      end
    end

    context 'Filtering' do
      it 'can filter results based on the incident type - :hazard' do
        get '/api/v1/incidents', params: { zipcode: "80402", type: "hazard" }

        parsed = JSON.parse(response.body, symbolize_names: true)
        response_types = parsed[:incidents].map { |inc| inc[:type] }

        expect(response).to have_http_status(200)
        expect(parsed[:incidents].count).to eq(3)
        expect(response_types).to eq(["Hazard", "Hazard", "Hazard"])
      end

      it 'can filter results based on the incident type - :theft' do
        get '/api/v1/incidents', params: { zipcode: "80402", type: "theft" }

        parsed = JSON.parse(response.body, symbolize_names: true)
        response_types = parsed[:incidents].map { |inc| inc[:type] }

        expect(response).to have_http_status(200)
        expect(parsed[:incidents].count).to eq(2)
        expect(response_types).to eq(["Theft", "Theft"])
      end

      it 'can handle when the :type param is not lowercased' do
        get '/api/v1/incidents', params: { zipcode: "80402", type: "HaZArD" }

        parsed = JSON.parse(response.body, symbolize_names: true)
        response_types = parsed[:incidents].map { |inc| inc[:type] }

        expect(response).to have_http_status(200)
        expect(parsed[:incidents].count).to eq(3)
        expect(response_types).to eq(["Hazard", "Hazard", "Hazard"])
      end
    end

    context 'With invalid params' do
      it 'returns an error status and message - invalid :zipcode' do
        # too short
        get '/api/v1/incidents', params: { zipcode: "20" }
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(parsed[:errors]).to match_array([":zipcode param must be 5 digits, and only include numbers"])

        # too long
        get '/api/v1/incidents', params: { zipcode: "123456789" }
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(parsed[:errors]).to match_array([":zipcode param must be 5 digits, and only include numbers"])

        # those aren't numbers
        get '/api/v1/incidents', params: { zipcode: "bananas" }
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(parsed[:errors]).to match_array([":zipcode param must be 5 digits, and only include numbers"])

        # missing altogether
        get '/api/v1/incidents', params: { }
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(parsed[:errors]).to match_array([":zipcode param must be 5 digits, and only include numbers"])
      end

      it 'returns an error status and message - invalid :sort_date_by' do
        # is not 'asc' or 'desc'
        get '/api/v1/incidents', params: { zipcode: "80038", sort_date_by: "abc" }
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(parsed[:errors]).to match_array([":sort_date_by param must be either 'asc' or 'desc'"])

        # also is not 'asc' or 'desc'
        get '/api/v1/incidents', params: { zipcode: "80038", sort_date_by: "123" }
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(parsed[:errors]).to match_array([":sort_date_by param must be either 'asc' or 'desc'"])
      end

      it 'returns an error status and message - invalid :type' do
        # is not 'hazard' or 'theft'
        get '/api/v1/incidents', params: { zipcode: "80038", type: "sale" }
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(parsed[:errors]).to match_array([":type param must be either 'hazard' or 'theft'"])

        # also is not 'hazard' or 'theft'
        get '/api/v1/incidents', params: { zipcode: "80038", type: "parade" }
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(422)
        expect(parsed[:errors]).to match_array([":type param must be either 'hazard' or 'theft'"])
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
