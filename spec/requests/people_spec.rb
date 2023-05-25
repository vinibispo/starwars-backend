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

  describe 'POST create' do
    it 'returns http success' do
      planet = FactoryBot.create(:planet)

      params = { person: FactoryBot.attributes_for(:person, homeworld: planet.id) }
      post(people_path, params:)

      expect(response).to have_http_status(:success)
    end

    it 'returns the correct person' do
      planet = FactoryBot.create(:planet)
      params = { person: FactoryBot.attributes_for(:person, homeworld: planet.id) }

      post(people_path, params:)

      expect(response.body).to eq(Person.last.to_json)
    end

    it 'returns a 422 when the person is invalid' do
      person = FactoryBot.build(:person)

      post people_path, params: { person: person.attributes }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error message when the person is invalid' do
      person = FactoryBot.build(:person)

      post people_path, params: { person: person.attributes }

      expect(response.body).to eq({ errors: ["Homeworld can't be blank"] }.to_json)
    end
  end

  describe 'PUT update' do
    it 'returns http success' do
      planet = FactoryBot.create(:planet)
      person = FactoryBot.create(:person, homeworld: planet.id)

      params = { person: { name: 'New Name' } }
      put(person_path(person), params:)

      expect(response).to have_http_status(:success)
    end

    it 'returns the correct person' do
      planet = FactoryBot.create(:planet)
      person = FactoryBot.create(:person, homeworld: planet.id)

      params = { person: { name: 'New Name' } }
      put(person_path(person), params:)

      expect(response.body).to include('New Name')
    end

    it 'returns a 422 when the person is invalid' do
      planet = FactoryBot.create(:planet)
      person = FactoryBot.create(:person, homeworld: planet.id)

      params = { person: { name: '' } }
      put(person_path(person), params:)

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error message when the person is invalid' do
      planet = FactoryBot.create(:planet)
      person = FactoryBot.create(:person, homeworld: planet.id)

      params = { person: FactoryBot.attributes_for(:person) }
      put(person_path(person), params:)

      expect(response.body).to eq({ errors: ["Homeworld can't be blank"] }.to_json)
    end

    it 'returns a 404 when the person does not exist' do
      params = { person: { name: 'New Name' } }
      put(person_path(1), params:)

      expect(response).to have_http_status(:not_found)
    end
  end
end
