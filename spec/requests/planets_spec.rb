require 'rails_helper'

RSpec.describe 'Planets', type: :request do
  describe 'GET index' do
    it 'returns http success' do
      get planets_path
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct number of planets' do
      FactoryBot.create_list(:planet, 10)
      get planets_path

      expect(response.headers['Total-Count']).to eq('10')
    end

    it 'returns the correct number of planets with a search term' do
      FactoryBot.create_list(:planet, 10)
      FactoryBot.create(:planet, name: 'Tatooine')
      get planets_path, params: { q: 'Tatooine' }

      expect(response.headers['Total-Count']).to eq('1')
    end
  end

  # Write spec for all the other methods

  describe 'GET show' do
    it 'returns http success' do
      planet = FactoryBot.create(:planet)
      get planet_path(planet)
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct planet' do
      planet = FactoryBot.create(:planet)
      get planet_path(planet)

      expect(response.body).to eq(planet.to_json)
    end

    it 'returns a 404 if the planet is not found' do
      get planet_path(1)

      expect(response).to have_http_status(:not_found)
    end

    it 'returns an error message if the planet is not found' do
      get planet_path(1)

      expect(response.body).to eq({ error: 'Planet not found' }.to_json)
    end
  end
end
