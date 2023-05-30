module Users::Repo
  class Register < Micro::Case
    attributes :name, :email, :password

    def call!
      user = User.new(attributes)
      return Success result: { user:, token: Token[user] } if user.save

      Failure :invalid, result: { errors: user.errors.full_messages }
    end
  end
end
