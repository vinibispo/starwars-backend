module Film
  class Update < Micro::Case
    attributes :id, :input

    def call!
      film = Record.find_by(id:)

      return Failure(:not_found) unless film

      film.update(input)

      return Success result: { film: } if film.valid?

      Failure(:invalid, result: { error: film.errors.full_messages })
    end
  end
end
