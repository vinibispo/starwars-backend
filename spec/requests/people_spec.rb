# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'People', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:token) { Token[user] }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }
  describe 'GET index' do
    context 'when there are no people' do
      it 'returns http success' do
        get(people_path, headers:)
        expect(response).to have_http_status(:success)
      end
    end

    context 'when there are people' do
      it 'returns the correct number of people' do
        planet = FactoryBot.create(:planet)
        FactoryBot.create_list(:character, 10, homeworld: planet.id)
        get(people_path, headers:)

        expect(response.headers['Total-Count']).to eq('10')
      end
    end

    context 'when there are people with search' do
      it 'returns the correct number of people with search' do
        planet = FactoryBot.create(:planet)
        FactoryBot.create_list(:character, 10, homeworld: planet.id)
        FactoryBot.create(:character, name: 'XXDXX', homeworld: planet.id)
        get(people_path, params: { q: 'XXD' }, headers:)

        expect(response.headers['Total-Count']).to eq('1')
      end
    end
  end

  describe 'GET show' do
    context 'when the character exists' do
      it 'returns http success' do
        planet = FactoryBot.create(:planet)
        character = FactoryBot.create(:character, homeworld: planet.id)

        get(person_path(character), headers:)

        expect(response).to have_http_status(:success)
      end

      it 'returns the correct character' do
        planet = FactoryBot.create(:planet)
        name = 'R2-D2'
        character = FactoryBot.create(:character, homeworld: planet.id, name:)

        get(person_path(character), headers:)

        expect(response.parsed_body['name']).to eq(name)
      end

      it 'returns the correct planet' do
        name = 'Bespin'
        planet = FactoryBot.create(:planet, name:)
        character = FactoryBot.create(:character, homeworld: planet.id)

        get(person_path(character), headers:)

        expect(response.parsed_body['planet']['name']).to eq(name)
      end

      it 'returns the correct films' do
        title = 'A New Hope'
        film = FactoryBot.create(:film, title:)
        planet = FactoryBot.create(:planet)
        character = FactoryBot.create(:character, homeworld: planet.id)
        FactoryBot.create(:cast, film:, character:)

        get(person_path(character), headers:)

        expect(response.parsed_body['films'].first['title']).to eq(title)
      end
    end

    context 'when the character does not exist' do
      it 'returns a 404' do
        get(person_path(1), headers:)

        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        get(person_path(1), headers:)

        expect(response.body).to eq({ error: 'Character not found' }.to_json)
      end
    end
  end

  describe 'POST create' do
    context 'when the character is valid' do
      it 'returns http success' do
        planet = FactoryBot.create(:planet)

        params = { character: FactoryBot.attributes_for(:character, homeworld: planet.id) }
        post(people_path, params:, headers:)

        expect(response).to have_http_status(:success)
      end

      it 'creates a new character' do
        planet = FactoryBot.create(:planet)
        params = { character: FactoryBot.attributes_for(:character, homeworld: planet.id) }

        expect { post(people_path, params:, headers:) }.to change(Character, :count).by(1)
      end

      it 'returns the correct character' do
        planet = FactoryBot.create(:planet)
        name = 'BB-8'
        params = { character: FactoryBot.attributes_for(:character, homeworld: planet.id, name:) }

        post(people_path, params:, headers:)

        expect(response.parsed_body['name']).to eq(name)
      end
    end

    context 'when the character is invalid' do
      it 'returns a 422' do
        character = FactoryBot.build(:character)

        post(people_path, params: { character: character.attributes }, headers:)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        character = FactoryBot.build(:character)

        post(people_path, params: { character: character.attributes }, headers:)

        expect(response.body).to eq({ errors: ['Homeworld can’t be blank', 'Planet must exist'] }.to_json)
      end
    end
  end

  describe 'PUT update' do
    context 'when the character is valid' do
      it 'returns http success' do
        planet = FactoryBot.create(:planet)
        character = FactoryBot.create(:character, homeworld: planet.id)

        params = { character: { name: 'New Name' } }
        put(person_path(character), params:, headers:)

        expect(response).to have_http_status(:success)
      end

      it 'returns the correct character' do
        planet = FactoryBot.create(:planet)
        character = FactoryBot.create(:character, homeworld: planet.id)

        params = { character: { name: 'New Name' } }
        put(person_path(character), params:, headers:)

        expect(response.body).to include('New Name')
      end
    end

    context 'when the character is invalid' do
      it 'returns a 422' do
        planet = FactoryBot.create(:planet)
        character = FactoryBot.create(:character, homeworld: planet.id)

        params = { character: { name: '' } }
        put(person_path(character), params:, headers:)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        planet = FactoryBot.create(:planet)
        character = FactoryBot.create(:character, homeworld: planet.id)

        params = { character: FactoryBot.attributes_for(:character) }
        put(person_path(character), params:, headers:)

        expect(response.body).to eq({ errors: ['Homeworld can’t be blank', 'Planet must exist'] }.to_json)
      end
    end

    context 'when the character does not exist' do
      it 'returns a 404' do
        params = { character: { name: 'New Name' } }
        put(person_path(1), params:, headers:)

        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        params = { character: { name: 'New Name' } }
        put(person_path(1), params:, headers:)

        expect(response.body).to eq({ error: 'Character not found' }.to_json)
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when the character exists' do
      it 'returns http no_content' do
        planet = FactoryBot.create(:planet)
        character = FactoryBot.create(:character, homeworld: planet.id)

        delete(person_path(character), headers:)

        expect(response).to have_http_status(:no_content)
      end

      it 'deletes the character' do
        planet = FactoryBot.create(:planet)
        character = FactoryBot.create(:character, homeworld: planet.id)

        expect do
          delete person_path(character), headers:
        end.to change(Character, :count).by(-1)
      end
    end

    context 'when the character does not exist' do
      it 'returns a 404 when the character does not exist' do
        delete(person_path(1), headers:)

        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message when the character does not exist' do
        delete(person_path(1), headers:)

        expect(response.body).to eq({ error: 'Character not found' }.to_json)
      end
    end
  end
end
