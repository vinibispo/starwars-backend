module Film
  class Find < Micro::Case
    attributes :id

    def call!
      film = Record.find_by(id:)

      return Success result: { film: } if film

      Failure :not_found
    end
  end
end
