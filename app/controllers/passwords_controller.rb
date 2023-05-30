class PasswordsController < ApplicationController
  def forgot
    Users::Repo::ForgotPassword
      .call(email: params[:email])
      .on_failure(:not_found) { render json: { error: 'User not found' }, status: :not_found }
      .on_success { render json: { message: 'Password reset email sent' } }
  end

  def reset
    Users::Repo::ResetPassword
      .call(password_reset_token: params[:password_reset_token], password: params[:password])
      .on_failure(:not_found) { render json: { error: 'Invalid token' }, status: :not_found }
      .on_success { render json: { message: 'Password reset' } }
  end
end
