# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Casts', type: :request do
  describe 'POST create' do
    it 'creates a new cast' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)

      expect do
        post casts_path, params: { cast: { film_id: film.id, character_id: character.id } }
      end.to change(Film::Character, :count).by(1)
    end

    it 'returns http success' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)

      post casts_path, params: { cast: { film_id: film.id, character_id: character.id } }

      expect(response).to have_http_status(:success)
    end

    it 'returns the created cast' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)

      post casts_path, params: { cast: { film_id: film.id, character_id: character.id } }

      expect(response.body).to eq(Film::Character.last.to_json)
    end

    it 'returns http unprocessable entity' do
      post casts_path, params: { cast: { film_id: nil, character_id: nil } }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns the errors' do
      post casts_path, params: { cast: { film_id: nil, character_id: nil } }

      expect(response.body).to eq({ errors: ['Film must exist', 'Character must exist'] }.to_json)
    end

    it 'returns bad request' do
      post casts_path, params: { cast: {} }

      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a cast' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)
      cast = FactoryBot.create(:cast, film:, character:)

      expect do
        delete cast_path(cast)
      end.to change(Film::Character, :count).by(-1)
    end

    it 'returns http success' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      character = FactoryBot.create(:character, homeworld: planet.id)
      cast = FactoryBot.create(:cast, film:, character:)

      delete cast_path(cast)

      expect(response).to have_http_status(:success)
    end

    it 'returns http not found' do
      delete cast_path(id: 0)

      expect(response).to have_http_status(:not_found)
    end

    it 'returns errors' do
      delete cast_path(id: 0)

      expect(response.body).to eq({ error: 'Cast not found' }.to_json)
    end
  end
end
