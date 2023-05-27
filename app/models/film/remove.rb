module Film
  class Remove < Micro::Case
    attributes :id

    def call!
      film = Record.find_by(id:)

      return Failure(:not_found) unless film

      film.destroy
      Success(:ok)
    end
  end
end
