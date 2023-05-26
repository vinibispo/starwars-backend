# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Casts', type: :request do
  describe 'POST create' do
    it 'creates a new cast' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      person = FactoryBot.create(:person, homeworld: planet.id)

      expect do
        post casts_path, params: { cast: { film_id: film.id, person_id: person.id } }
      end.to change(Film::Person, :count).by(1)
    end

    it 'returns http success' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      person = FactoryBot.create(:person, homeworld: planet.id)

      post casts_path, params: { cast: { film_id: film.id, person_id: person.id } }

      expect(response).to have_http_status(:success)
    end

    it 'returns the created cast' do
      film = FactoryBot.create(:film)
      planet = FactoryBot.create(:planet)
      person = FactoryBot.create(:person, homeworld: planet.id)

      post casts_path, params: { cast: { film_id: film.id, person_id: person.id } }

      expect(response.body).to eq(Film::Person.last.to_json)
    end

    it 'returns http unprocessable entity' do
      post casts_path, params: { cast: { film_id: nil, person_id: nil } }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns the errors' do
      post casts_path, params: { cast: { film_id: nil, person_id: nil } }

      expect(response.body).to eq({ errors: ['Film must exist', 'Person must exist'] }.to_json)
    end

    it 'returns bad request' do
      post casts_path, params: { cast: {} }

      expect(response).to have_http_status(:bad_request)
    end
  end
end
