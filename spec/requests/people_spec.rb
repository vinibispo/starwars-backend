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

  describe 'GET show' do
    it 'returns http success' do
      planet = FactoryBot.create(:planet)
      person = FactoryBot.create(:person, homeworld: planet.id)

      get person_path(person)

      expect(response).to have_http_status(:success)
    end

    it 'returns the correct person' do
      planet = FactoryBot.create(:planet)
      person = FactoryBot.create(:person, homeworld: planet.id)

      get person_path(person)

      expect(response.body).to eq(person.to_json)
    end

    it 'returns a 404 when the person does not exist' do
      get person_path(1)

      expect(response).to have_http_status(:not_found)
    end

    it 'returns an error message when the person does not exist' do
      get person_path(1)

      expect(response.body).to eq({ error: 'Person not found' }.to_json)
    end
  end
end
