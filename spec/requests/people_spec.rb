require 'rails_helper'

RSpec.describe 'People', type: :request do
  describe 'GET index' do
    it 'returns http success' do
      get people_path
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct number of people' do
      planet = FactoryBot.create(:planet)
      FactoryBot.create_list(:person, 10, homeworld: planet.id)
      get people_path

      expect(response.headers['Total-Count']).to eq('10')
    end

    it 'returns the correct number of people with search' do
      planet = FactoryBot.create(:planet)
      FactoryBot.create_list(:person, 10, homeworld: planet.id)
      FactoryBot.create(:person, name: 'Luke Skywalker', homeworld: planet.id)
      get people_path, params: { q: 'Luke' }

      expect(response.headers['Total-Count']).to eq('1')
    end
  end
end
