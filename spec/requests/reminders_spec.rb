require 'rails_helper'

RSpec.describe 'Reminders API', type: :request do
  # initialize test data
  let!(:reminders) { create_list(:reminder, 10) }
  let(:reminder_id) { reminders.first.id }

  # Test suite for GET /reminders
  describe 'GET /reminders' do
    before { get '/reminders' }

    it 'returns reminders' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /reminders/:id
  describe 'GET /reminders/:id' do
    before { get "/reminders/#{reminder_id}" }

    context 'when the record exists' do
      it 'returns the reminder' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(reminder_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:reminder_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Reminder/)
      end
    end
  end

  # Test suite for POST /reminders
  describe 'POST /reminders' do
    time = Faker::Time.forward(days: 364)
    city = Faker::Address.city
    location_coordinates = "#{Faker::Address.latitude}, #{Faker::Address.longitude}"
    # valid payload
    let(:valid_attributes) do
      {
        reminder: {
          description: 'Go pick up business cards',
          datetime: time,
          city: city,
          location_coordinates: location_coordinates
        }
      }
    end

    # invalid payload
    let(:invalid_attributes) do
      {
        reminder: {
          description: 'Go pick up business cards',
          datetime: time,
          location_coordinates: location_coordinates
        }
      }
    end

    context 'when the request is valid' do
      before { post '/reminders', params: valid_attributes }

      it 'creates a reminder' do
        expect(response.body)
          .to match(/created/)
        expect(json['description']).to eq('Go pick up business cards')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/reminders', params: invalid_attributes }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: City can't be blank/)
      end
    end
  end

  # Test suite for PUT /reminders/:id
  describe 'PUT /reminders/:id' do
    let(:valid_attributes) do
      {
        reminder: {
          description: 'Shop for a pair of winter skis for Billy'
        }
      }
    end

    context 'when the record exists' do
      before { put "/reminders/#{reminder_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /reminders/:id
  describe 'DELETE /reminders/:id' do
    context 'when reminder exists in db' do
      before { delete "/reminders/#{reminder_id}" }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when reminder doesn\'t exist in db' do
      before { delete "/reminders/#{reminder_id}" }
      before { delete "/reminders/#{reminder_id}" }

      it 'returns a message' do
        expect(json['message']).to eq("Couldn't find Reminder with 'id'=#{reminder_id}")
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
