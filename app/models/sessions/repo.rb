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
end
