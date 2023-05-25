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

  describe 'POST create' do
    it 'returns http success' do
      post planets_path, params: { planet: FactoryBot.attributes_for(:planet) }
      expect(response).to have_http_status(:success)
    end

    it 'creates a new planet' do
      expect do
        post planets_path, params: { planet: FactoryBot.attributes_for(:planet) }
      end.to change(Planet, :count).by(1)
    end

    it 'returns the new planet' do
      post planets_path, params: { planet: FactoryBot.attributes_for(:planet) }

      expect(response.body).to eq(Planet.last.to_json)
    end

    it 'returns a 422 if the planet is not valid' do
      post planets_path, params: { planet: FactoryBot.attributes_for(:planet, name: nil) }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error message if the planet is not valid' do
      post planets_path, params: { planet: FactoryBot.attributes_for(:planet, name: nil) }

      expect(response.body).to eq({ errors: ["Name can't be blank"] }.to_json)
    end
  end

  describe 'PUT update' do
    it 'returns http success' do
      planet = FactoryBot.create(:planet)
      put planet_path(planet), params: { planet: FactoryBot.attributes_for(:planet) }
      expect(response).to have_http_status(:success)
    end

    it 'updates the planet' do
      planet = FactoryBot.create(:planet)
      put planet_path(planet), params: { planet: FactoryBot.attributes_for(:planet, name: 'Tatooine') }

      expect(planet.reload.name).to eq('Tatooine')
    end

    it 'returns the updated planet' do
      planet = FactoryBot.create(:planet)
      put planet_path(planet), params: { planet: FactoryBot.attributes_for(:planet, name: 'Tatooine') }
      planet.reload

      expected = JSON.parse(planet.to_json)

      expect(response.parsed_body).to eq(expected)
    end

    it 'returns a 422 if the planet is not valid' do
      planet = FactoryBot.create(:planet)
      put planet_path(planet), params: { planet: FactoryBot.attributes_for(:planet, name: nil) }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error message if the planet is not valid' do
      planet = FactoryBot.create(:planet)
      put planet_path(planet), params: { planet: FactoryBot.attributes_for(:planet, name: nil) }

      expect(response.body).to eq({ errors: ["Name can't be blank"] }.to_json)
    end

    it 'returns a 404 if the planet is not found' do
      put planet_path(1), params: { planet: FactoryBot.attributes_for(:planet) }

      expect(response).to have_http_status(:not_found)
    end

    it 'returns an error message if the planet is not found' do
      put planet_path(1), params: { planet: FactoryBot.attributes_for(:planet) }

      expect(response.body).to eq({ error: 'Planet not found' }.to_json)
    end
  end

  describe 'DELETE destroy' do
    it 'returns http no_content' do
      planet = FactoryBot.create(:planet)
      delete planet_path(planet)
      expect(response).to have_http_status(:no_content)
    end

    it 'deletes the planet' do
      planet = FactoryBot.create(:planet)
      expect do
        delete planet_path(planet)
      end.to change(Planet, :count).by(-1)
    end

    it 'returns a 404 if the planet is not found' do
      delete planet_path(1)

      expect(response).to have_http_status(:not_found)
    end

    it 'returns an error message if the planet is not found' do
      delete planet_path(1)

      expect(response.body).to eq({ error: 'Planet not found' }.to_json)
    end
  end
end
