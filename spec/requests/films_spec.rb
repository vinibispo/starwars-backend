# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Films', type: :request do
  describe 'GET index' do
    it 'returns http success' do
      get films_path
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct number of films' do
      FactoryBot.create_list(:film, 10)
      get films_path

      expect(response.headers['Total-Count']).to eq('10')
    end

    it 'returns the correct number of films when searching' do
      FactoryBot.create_list(:film, 10)
      FactoryBot.create(:film, title: 'Star Wars My Custom Movie')
      get films_path, params: { q: 'Star Wars My Custom Movie' }

      expect(response.headers['Total-Count']).to eq('1')
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      film = FactoryBot.create(:film)
      get film_path(film)
      expect(response).to have_http_status(:success)
    end

    it 'returns the correct film' do
      film = FactoryBot.create(:film)
      get film_path(film)

      expect(response.body).to include(film.title)
    end

    it 'returns a 404 when the film is not found' do
      get film_path(1)

      expect(response).to have_http_status(:not_found)
    end

    it 'returns an error message when the film is not found' do
      get film_path(1)

      expect(response.body).to eq({ error: 'Film not found' }.to_json)
    end
  end
end
