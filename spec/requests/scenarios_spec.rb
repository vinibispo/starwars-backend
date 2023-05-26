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

  describe 'DELETE destroy' do
    it 'deletes a scenario' do
      planet = FactoryBot.create(:planet)
      film = FactoryBot.create(:film)
      scenario = FactoryBot.create(:scenario, film:, planet:)
      expect do
        delete scenario_path(scenario)
      end.to change(Film::Planet, :count).by(-1)
    end

    it 'returns a no content status code' do
      planet = FactoryBot.create(:planet)
      film = FactoryBot.create(:film)
      scenario = FactoryBot.create(:scenario, film:, planet:)
      delete scenario_path(scenario)
      expect(response).to have_http_status(:no_content)
    end

    it 'returns an empty response body' do
      planet = FactoryBot.create(:planet)
      film = FactoryBot.create(:film)
      scenario = FactoryBot.create(:scenario, film:, planet:)
      delete scenario_path(scenario)
      expect(response.body).to be_empty
    end

    it 'returns a not found status code with invalid id' do
      delete scenario_path(id: 0)
      expect(response).to have_http_status(:not_found)
    end

    it 'returns an error message with invalid id' do
      delete scenario_path(id: 0)
      expect(response.body).to eq({ error: 'Scenario not found' }.to_json)
    end
  end
end