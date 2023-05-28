module Casts::Repo
  class Add < Micro::Case
    attributes :film_id, :character_id

    def call!
      cast = Cast.includes(:film, :character).new(film_id:, people_id: character_id)

      return Failure :invalid, result: { errors: cast.errors.full_messages } if cast.invalid?

      cast.save

      Success(result: { cast: })
    end
  end

  class Remove < Micro::Case
    attributes :id

    def call!
      cast = Cast.find_by(id:)

      return Failure(:not_found) if cast.nil?

      cast.destroy

      Success(:ok)
    end
  end
end
