module Users::Repo
  class Register < Micro::Case
    attributes :name, :email, :password

    def call!
      user = User.new(attributes)
      return Success result: { user:, token: Token[user] } if user.save

      Failure :invalid, result: { errors: user.errors.full_messages }
    end
  end

  class ForgotPassword < Micro::Case
    attributes :email

    def call!
      user = User.find_by(email:)
      return Failure :not_found if user.nil?

      user.password_reset_token = SecureRandom.hex(10)
      user.password_reset_sent_at = Time.zone.now
      user.save!
      UserMailer.with(user:).forgot_password.deliver_later
      Success result: { user: }
    end
  end

  class ResetPassword < Micro::Case
    attributes :password_reset_token, :password

    def call!
      user = User.find_by(password_reset_token:)
      return Failure :not_found if user.nil?

      user.password_reset_token = nil
      user.password_reset_sent_at = nil
      user.password = password
      user.save
      Success result: { user: }
    end
  end
end
