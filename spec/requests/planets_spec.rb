require 'rails_helper'

RSpec.describe 'Planets', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:token) { Token[user] }
  let(:headers) { { 'Authorization' => "Bearer #{token}" } }
  describe 'GET index' do
    context 'when there are no planets' do
      it 'returns http success' do
        get(planets_path, headers:)
        expect(response).to have_http_status(:success)
      end
    end

    context 'when there are planets' do
      it 'returns the correct number of planets' do
        FactoryBot.create_list(:planet, 10)
        get(planets_path, headers:)

        expect(response.headers['Total-Count']).to eq('10')
      end
    end

    context 'when there are planets with a search term' do
      it 'returns the correct number of planets with a search term' do
        FactoryBot.create_list(:planet, 10)
        FactoryBot.create(:planet, name: 'Tatooine')

        get(planets_path, params: { q: 'Tatooine' }, headers:)

        expect(response.headers['Total-Count']).to eq('1')
      end
    end
  end

  # Write spec for all the other methods

  describe 'GET show' do
    context 'when the planet exists' do
      it 'returns http success' do
        planet = FactoryBot.create(:planet)
        get(planet_path(planet), headers:)
        expect(response).to have_http_status(:success)
      end

      it 'returns the correct planet' do
        name = 'Xandar'
        planet = FactoryBot.create(:planet, name:)
        get(planet_path(planet), headers:)

        expect(response.parsed_body['name']).to eq(name)
      end

      it 'returns the correct planet with residents' do
        planet = FactoryBot.create(:planet)
        character_name = 'Rocket Raccoon'
        FactoryBot.create_list(:character, 3, planet:, name: character_name)
        get(planet_path(planet), headers:)

        expect(response.parsed_body['residents'].first['name']).to eq(character_name)
      end

      it 'returns the correct planet with films' do
        planet = FactoryBot.create(:planet)
        film_title = 'Guardians of the Galaxy'
        films = FactoryBot.create_list(:film, 3, title: film_title)
        films.each do |film|
          FactoryBot.create(:scenario, film:, planet:)
        end

        get(planet_path(planet), headers:)

        expect(response.parsed_body['films'].first['title']).to eq(film_title)
      end
    end

    context 'when the planet does not exist' do
      it 'returns a 404 if the planet is not found' do
        get(planet_path(1), headers:)

        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message if the planet is not found' do
        get(planet_path(1), headers:)

        expect(response.body).to eq({ error: 'Planet not found' }.to_json)
      end
    end
  end

  describe 'POST create' do
    context 'when the planet is valid' do
      it 'returns http success' do
        post(planets_path, params: { planet: FactoryBot.attributes_for(:planet) }, headers:)
        expect(response).to have_http_status(:success)
      end

      it 'creates a new planet' do
        expect do
          post planets_path, params: { planet: FactoryBot.attributes_for(:planet) }, headers:
        end.to change(Planet, :count).by(1)
      end

      it 'returns the new planet' do
        name = 'Xandar'
        post(planets_path, params: { planet: FactoryBot.attributes_for(:planet, name:) }, headers:)

        expect(response.parsed_body['name']).to eq(name)
      end
    end

    context 'when the planet is invalid' do
      it 'returns a 422' do
        post(planets_path, params: { planet: FactoryBot.attributes_for(:planet, name: nil) }, headers:)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        post(planets_path, params: { planet: FactoryBot.attributes_for(:planet, name: nil) }, headers:)

        expect(response.body).to eq({ errors: ['Name can’t be blank'] }.to_json)
      end
    end
  end

  describe 'PUT update' do
    context 'when the planet is valid' do
      it 'returns http success' do
        planet = FactoryBot.create(:planet)
        put(planet_path(planet), params: { planet: FactoryBot.attributes_for(:planet) }, headers:)
        expect(response).to have_http_status(:success)
      end

      it 'updates the planet' do
        planet = FactoryBot.create(:planet)
        put(planet_path(planet), params: { planet: FactoryBot.attributes_for(:planet, name: 'Tatooine') },
                                 headers:)

        expect(planet.reload.name).to eq('Tatooine')
      end

      it 'returns the updated planet' do
        planet = FactoryBot.create(:planet)
        put(planet_path(planet), params: { planet: FactoryBot.attributes_for(:planet, name: 'Tatooine') },
                                 headers:)
        planet.reload

        expect(response.parsed_body['name']).to eq('Tatooine')
      end
    end

    context 'when the planet is invalid' do
      it 'returns a 422' do
        planet = FactoryBot.create(:planet)
        put(planet_path(planet), params: { planet: FactoryBot.attributes_for(:planet, name: nil) }, headers:)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        planet = FactoryBot.create(:planet)
        put(planet_path(planet), params: { planet: FactoryBot.attributes_for(:planet, name: nil) }, headers:)

        expect(response.body).to eq({ errors: ['Name can’t be blank'] }.to_json)
      end
    end

    context 'when the planet is not found' do
      it 'returns a 404' do
        put(planet_path(1), params: { planet: FactoryBot.attributes_for(:planet) }, headers:)

        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        put(planet_path(1), params: { planet: FactoryBot.attributes_for(:planet) }, headers:)

        expect(response.body).to eq({ error: 'Planet not found' }.to_json), headers:
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when the planet is valid' do
      it 'returns http no_content' do
        planet = FactoryBot.create(:planet)
        delete(planet_path(planet), headers:)
        expect(response).to have_http_status(:no_content)
      end

      it 'deletes the planet' do
        planet = FactoryBot.create(:planet)
        expect do
          delete planet_path(planet), headers:
        end.to change(Planet, :count).by(-1)
      end
    end

    context 'when the planet is not found' do
      it 'returns a 404' do
        delete(planet_path(1), headers:)

        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        delete(planet_path(1), headers:)

        expect(response.body).to eq({ error: 'Planet not found' }.to_json)
      end
    end
  end
end
