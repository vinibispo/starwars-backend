# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Films', type: :request do
  describe 'GET index' do
    context 'when there are no films' do
      it 'returns http success' do
        get films_path
        expect(response).to have_http_status(:success)
      end
    end

    context 'when there are films' do
      it 'returns the correct number of films' do
        FactoryBot.create_list(:film, 10)
        get films_path

        expect(response.headers['Total-Count']).to eq('10')
      end
    end

    context 'when there are films and a search query' do
      it 'returns the correct number of films when searching' do
        FactoryBot.create_list(:film, 10)
        FactoryBot.create(:film, title: 'Star Wars My Custom Movie')
        get films_path, params: { q: 'Star Wars My Custom Movie' }

        expect(response.headers['Total-Count']).to eq('1')
      end
    end
  end

  describe 'GET show' do
    context 'when the film is found' do
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
    end


    context 'when the film is not found' do
      it 'returns a 404' do
        get film_path(1)

        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        get film_path(1)

        expect(response.body).to eq({ error: 'Film not found' }.to_json)
      end
    end
  end

  describe 'POST create' do
    context 'when the film is valid' do
      it 'returns http success' do
        post films_path, params: { film: FactoryBot.attributes_for(:film) }
        expect(response).to have_http_status(:success)
      end

      it 'creates a new film' do
        expect do
          post films_path, params: { film: FactoryBot.attributes_for(:film) }
        end.to change(Film, :count).by(1)
      end

      it 'returns the created film' do
        post films_path, params: { film: FactoryBot.attributes_for(:film) }

        expect(response.body).to include(Film.last.title)
      end
    end

    context 'when the film is invalid' do

      it 'returns a 422' do
        post films_path, params: { film: { title: '' } }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        post films_path, params: { film: FactoryBot.attributes_for(:film, title: '') }

        expect(response.body).to eq({ errors: ['Title can’t be blank'] }.to_json)
      end
    end
  end

  describe 'PUT update' do
    context 'when the film is valid' do
      it 'returns http success' do
        film = FactoryBot.create(:film)
        put film_path(film), params: { film: FactoryBot.attributes_for(:film) }
        expect(response).to have_http_status(:success)
      end

      it 'updates the film' do
        film = FactoryBot.create(:film)
        put film_path(film), params: { film: FactoryBot.attributes_for(:film, title: 'New Title') }

        expect(film.reload.title).to eq('New Title')
      end

      it 'returns the updated film' do
        film = FactoryBot.create(:film)
        put film_path(film), params: { film: FactoryBot.attributes_for(:film, title: 'New Title') }

        expect(response.body).to include('New Title')
      end
    end

    context 'when the film is invalid' do
      it 'returns a 422' do
        film = FactoryBot.create(:film)
        put film_path(film), params: { film: { title: '' } }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        film = FactoryBot.create(:film)
        put film_path(film), params: { film: FactoryBot.attributes_for(:film, title: '') }

        expect(response.body).to eq({ errors: ['Title can’t be blank'] }.to_json)
      end
    end

    context 'when the film is not found' do
      it 'returns a 404 when the film is not found' do
        put film_path(1), params: { film: FactoryBot.attributes_for(:film) }

        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message when the film is not found' do
        put film_path(1), params: { film: FactoryBot.attributes_for(:film) }

        expect(response.body).to eq({ error: 'Film not found' }.to_json)
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when the film is found' do
      it 'returns http success' do
        film = FactoryBot.create(:film)
        delete film_path(film)
        expect(response).to have_http_status(:success)
      end

      it 'deletes the film' do
        film = FactoryBot.create(:film)
        expect do
          delete film_path(film)
        end.to change(Film, :count).by(-1)
      end
    end

    context 'when the film is not found' do
      it 'returns a 404' do
        delete film_path(1)

        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        delete film_path(1)

        expect(response.body).to eq({ error: 'Film not found' }.to_json)
      end
    end
  end
end
