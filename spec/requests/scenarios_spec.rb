# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Scenarios', type: :request do
  describe 'POST create' do
    it 'creates a new scenario' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      expect do
        post scenarios_path, params: { scenario: { film_id: film.id, planet_id: planet.id } }
      end.to change(Film::Planet, :count).by(1)
    end

    it 'returns a created status code' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      post scenarios_path, params: { scenario: { film_id: film.id, planet_id: planet.id } }
      expect(response).to have_http_status(:created)
    end

    it 'returns the created scenario' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      post scenarios_path, params: { scenario: { film_id: film.id, planet_id: planet.id } }
      expect(response.body).to eq(Film::Planet.last.to_json)
    end

    it 'returns an unprocessable entity status code with invalid params' do
      post scenarios_path, params: { scenario: { film_id: nil, planet_id: nil } }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error message with invalid params' do
      post scenarios_path, params: { scenario: { film_id: nil, planet_id: nil } }
      expect(response.body).to eq({ errors: ['Film must exist', 'Planet must exist'] }.to_json)
    end
  end
end
