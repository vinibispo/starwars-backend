# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'People', type: :request do
  describe 'GET index' do
    it 'returns http success' do
      get people_path
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct number of people' do
      planet = FactoryBot.create(:planet)
      FactoryBot.create_list(:character, 10, homeworld: planet.id)
      get people_path

      expect(response.headers['Total-Count']).to eq('10')
    end

    it 'returns the correct number of people with search' do
      planet = FactoryBot.create(:planet)
      FactoryBot.create_list(:character, 10, homeworld: planet.id)
      FactoryBot.create(:character, name: 'Luke Skywalker', homeworld: planet.id)
      get people_path, params: { q: 'Luke' }

      expect(response.headers['Total-Count']).to eq('1')
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)

      get person_path(character)

      expect(response).to have_http_status(:success)
    end

    it 'returns the correct character' do
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)

      get person_path(character)

      expect(response.body).to eq(character.to_json)
    end

    it 'returns a 404 when the character does not exist' do
      get person_path(1)

      expect(response).to have_http_status(:not_found)
    end

    it 'returns an error message when the character does not exist' do
      get person_path(1)

      expect(response.body).to eq({ error: 'Character not found' }.to_json)
    end
  end

  describe 'POST create' do
    it 'returns http success' do
      planet = FactoryBot.create(:planet)

      params = { character: FactoryBot.attributes_for(:character, homeworld: planet.id) }
      post(people_path, params:)

      expect(response).to have_http_status(:success)
    end

    it 'returns the correct character' do
      planet = FactoryBot.create(:planet)
      params = { character: FactoryBot.attributes_for(:character, homeworld: planet.id) }

      post(people_path, params:)

      expect(response.body).to eq(Character.last.to_json)
    end

    it 'returns a 422 when the character is invalid' do
      character = FactoryBot.build(:character)

      post people_path, params: { character: character.attributes }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error message when the character is invalid' do
      character = FactoryBot.build(:character)

      post people_path, params: { character: character.attributes }

      expect(response.body).to eq({ errors: ["Homeworld can’t be blank", 'Planet must exist'] }.to_json)
    end
  end

  describe 'PUT update' do
    it 'returns http success' do
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)

      params = { character: { name: 'New Name' } }
      put(person_path(character), params:)

      expect(response).to have_http_status(:success)
    end

    it 'returns the correct character' do
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)

      params = { character: { name: 'New Name' } }
      put(person_path(character), params:)

      expect(response.body).to include('New Name')
    end

    it 'returns a 422 when the character is invalid' do
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)

      params = { character: { name: '' } }
      put(person_path(character), params:)

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error message when the character is invalid' do
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)

      params = { character: FactoryBot.attributes_for(:character) }
      put(person_path(character), params:)

      expect(response.body).to eq({ errors: ["Homeworld can’t be blank", 'Planet must exist'] }.to_json)
    end

    it 'returns a 404 when the character does not exist' do
      params = { character: { name: 'New Name' } }
      put(person_path(1), params:)

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'DELETE destroy' do
    it 'returns http no_content' do
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)

      delete person_path(character)

      expect(response).to have_http_status(:no_content)
    end

    it 'returns a 404 when the character does not exist' do
      delete person_path(1)

      expect(response).to have_http_status(:not_found)
    end

    it 'returns an error message when the character does not exist' do
      delete person_path(1)

      expect(response.body).to eq({ error: 'Character not found' }.to_json)
    end
  end
end
