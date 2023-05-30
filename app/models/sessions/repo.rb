module Sessions::Repo
  class Create < Micro::Case
    attributes :email, :password

    def call!
      user = User.find_by(email:)
      if user&.authenticate(password)
        token = Token[user]
        Success result: { user:, token: }
      else
        Failure :invalid, result: { error: 'Invalid credentials' }
      end
    end
  end

  class Authenticate < Micro::Case
    attributes :token

    def call!
      return Failure :invalid, result: { errors: 'Invalid token' } unless token

      token_without_bearer = token.gsub('Bearer ', '')
      decoded_token = Token.decode(token_without_bearer)
      user = User.find_by(id: decoded_token)
      return Success result: { user: } if user

      Failure :invalid, result: { errors: 'Invalid token' }
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      Failure :invalid, result: { errors: 'Invalid token' }
    end
  end
end
