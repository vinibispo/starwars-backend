require 'rails_helper'
RSpec.describe 'Sessions', type: :request do
  describe 'POST /sessions' do
    context 'with valid credentials' do
      it 'returns status success' do
        password = 'password'
        user = FactoryBot.create(:user, password:)
        params = { email: user.email, password: }

        post sessions_path, params: { session: params }

        expect(response).to have_http_status(:created)
      end

      it 'returns a new session' do
        password = 'password'
        user = FactoryBot.create(:user, password:)
        params = { email: user.email, password: }

        post sessions_path, params: { session: params }

        expect(response.parsed_body['token']).to be_present
      end

      it 'returns the user' do
        password = 'password'
        email = 'john@doe.com'

        params = { email:, password: }

        user = FactoryBot.create(:user, email:, password:)

        post sessions_path, params: { session: params }

        expect(response.parsed_body['email']).to eq(user.email)
      end

      it 'returns the user name' do
        password = 'password'
        name = 'John Doe'

        user = FactoryBot.create(:user, password:, name:)

        params = { email: user.email, password: }

        post sessions_path, params: { session: params }

        expect(response.parsed_body['name']).to eq(user.name)
      end
    end

    context 'with invalid credentials' do
      it 'returns status unauthorized' do
        params = { email: 'john@doe.com', password: 'password' }

        post sessions_path, params: { session: params }

        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error message' do
        params = { email: 'john@doe.com', password: 'password' }

        post sessions_path, params: { session: params }

        expect(response.parsed_body['error']).to be_present
      end

      it 'returns an error message when email is missing' do
        params = { password: 'password' }

        post sessions_path, params: { session: params }

        expect(response.parsed_body['error']).to eq('Invalid credentials')
      end
    end
  end
end
