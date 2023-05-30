# frozen_string_literal: true

module Token
  class << self
    def decode(token)
      returned_payload, = JWT.decode(token, secret, true, algorithm: 'HS256')
      returned_payload['user_id']
    end

    def generate(user)
      JWT.encode({ user_id: user.id, exp: 24.hours.from_now.to_i }, secret, 'HS256')
    end

    alias [] generate

    private

    def secret
      Rails.application.credentials.secret_key_base
    end
  end
end
