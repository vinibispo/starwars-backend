class Cast::Add < Micro::Case
  attributes :film_id, :character_id

  def call!
    cast = Cast.new(film_id:, people_id: character_id)

    return Failure :invalid, result: { errors: cast.errors.full_messages } if cast.invalid?

    cast.save

    Success(result: { cast: })
  end
end
