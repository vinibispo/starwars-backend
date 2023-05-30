# frozen_string_literal: true

class UserMailer < ActionMailer::Base
  default from: 'starwars@factored.com'
  layout 'mailer'

  def forgot_password
    user = params[:user]

    mail(to: user.email, subject: 'Forgot Password', host: Rails.application.credentials.app_url) do |format|
      format.html { render 'user_mailer/forgot_password', locals: { user: } }
    end
  end
end
