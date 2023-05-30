require 'rails_helper'
RSpec.describe 'Passwords', type: :request do
  describe 'POST forgot' do
    context 'with valid params' do
      it 'returns http status success' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }

        expect(response).to have_http_status(:success)
      end

      it 'sends an email' do
        user = FactoryBot.create(:user)
        expect do
          post passwords_forgot_path, params: { email: user.email }
        end.to have_enqueued_job(ActionMailer::MailDeliveryJob)
      end

      it 'returns a success message' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }

        expect(JSON.parse(response.body)['message']).to eq('Password reset email sent')
      end

      it 'changes the password_reset_token' do
        user = FactoryBot.create(:user)
        expect do
          post passwords_forgot_path, params: { email: user.email }
        end.to change { user.reload.password_reset_token }
      end

      it 'changes the password_reset_sent_at' do
        user = FactoryBot.create(:user)
        expect do
          post passwords_forgot_path, params: { email: user.email }
        end.to change { user.reload.password_reset_sent_at }
      end
    end

    context 'with invalid params' do
      it 'returns http status not found' do
        post passwords_forgot_path, params: { email: 'john@doe.com' }
      end

      it 'returns a not found error message' do
        post passwords_forgot_path, params: { email: 'john@doe.com' }

        expect(response.parsed_body['error']).to eq('User not found')
      end

      it 'does not send an email' do
        expect do
          post passwords_forgot_path, params: { email: 'john@doe.com' }
        end.not_to have_enqueued_job(ActionMailer::MailDeliveryJob)
      end

      it 'does not change the password_reset_token' do
        user = FactoryBot.create(:user)
        expect do
          post passwords_forgot_path, params: { email: 'john@doe.com' }
        end.not_to change { user.reload.password_reset_token }
      end

      it 'does not change the password_reset_sent_at' do
        user = FactoryBot.create(:user)
        expect do
          post passwords_forgot_path, params: { email: 'john@doe.com' }
        end.not_to change { user.reload.password_reset_sent_at }
      end
    end
  end

  describe 'POST reset' do
    context 'with valid params' do
      it 'returns http status success' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }
        post passwords_reset_path, params: { password_reset_token: user.reload.password_reset_token, password: 'new_password' }

        expect(response).to have_http_status(:success)
      end

      it 'returns a success message' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }
        post passwords_reset_path, params: { password_reset_token: user.reload.password_reset_token, password: 'new_password' }

        expect(JSON.parse(response.body)['message']).to eq('Password reset')
      end

      it 'changes the password' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }
        expect do
          post passwords_reset_path, params: { password_reset_token: user.reload.password_reset_token, password: 'new_password' }
        end.to change { user.reload.password_digest }
      end

      it 'changes the password_reset_token' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }
        expect do
          post passwords_reset_path, params: { password_reset_token: user.reload.password_reset_token, password: 'new_password' }
        end.to change { user.reload.password_reset_token }
      end

      it 'changes the password_reset_sent_at' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }
        expect do
          post passwords_reset_path, params: { password_reset_token: user.reload.password_reset_token, password: 'new_password' }
        end.to change { user.reload.password_reset_sent_at }
      end
    end

    context 'with invalid params' do
      it 'returns http status not found' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }
        post passwords_reset_path, params: { password_reset_token: 'invalid_token', password: 'new_password' }

        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found error message' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }
        post passwords_reset_path, params: { password_reset_token: 'invalid_token', password: 'new_password' }

        expect(response.parsed_body['error']).to eq('Invalid token')
      end

      it 'does not change the password' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }
        expect do
          post passwords_reset_path, params: { password_reset_token: 'invalid_token', password: 'new_password' }
        end.not_to change { user.reload.password_digest }
      end

      it 'does not change the password_reset_token' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }
        expect do
          post passwords_reset_path, params: { password_reset_token: 'invalid_token', password: 'new_password' }
        end.not_to change { user.reload.password_reset_token }
      end

      it 'does not change the password_reset_sent_at' do
        user = FactoryBot.create(:user)
        post passwords_forgot_path, params: { email: user.email }
        expect do
          post passwords_reset_path, params: { password_reset_token: 'invalid_token', password: 'new_password' }
        end.not_to change { user.reload.password_reset_sent_at }
      end
    end
  end
end
