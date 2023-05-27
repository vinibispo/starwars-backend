module Film
  class Create < Micro::Case
    attributes :input

    def call!
      film = Record.new(input)

      film.save
      return Success result: { film: } if film.valid?

      Failure :invalid, result: { error: film.errors.full_messages }
    end
  end
end
