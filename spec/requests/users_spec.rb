require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe 'POST create' do
    context 'with valid parameters' do
      it 'returns created status' do
        name = 'John Doe'
        user_attributes = FactoryBot.attributes_for(:user, name:)
        post users_path, params: { user: user_attributes }

        expect(response).to have_http_status(:created)
      end

      it 'returns the user' do
        name = 'John Doe'
        user_attributes = FactoryBot.attributes_for(:user, name:)
        post users_path, params: { user: user_attributes }

        expect(response.parsed_body['name']).to eq(name)
      end

      it 'creates a user' do
        name = 'John Doe'
        user_attributes = FactoryBot.attributes_for(:user, name:)
        expect do
          post users_path, params: { user: user_attributes }
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'returns unprocessable entity status' do
        user_attributes = FactoryBot.attributes_for(:user, name: nil)
        post users_path, params: { user: user_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns the errors' do
        user_attributes = FactoryBot.attributes_for(:user, name: nil)
        post users_path, params: { user: user_attributes }

        expect(response.parsed_body['errors']).to be_present
      end

      it 'does not create a user' do
        user_attributes = FactoryBot.attributes_for(:user, name: nil)
        expect do
          post users_path, params: { user: user_attributes }
        end.not_to change(User, :count)
      end
    end
  end
end
