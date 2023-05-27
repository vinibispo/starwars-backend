class Film::Create < Micro::Case
  attributes :input

  def call!
    film = Film.new(input)

    film.save
    return Success result: { film: } if film.valid?

    Failure :invalid, result: { error: film.errors.full_messages }
  end
end
