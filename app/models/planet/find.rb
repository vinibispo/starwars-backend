module Planet
  class Find < Micro::Case
    attributes :id

    def call!
      planet = Record.find_by(id:)

      return Success result: { planet: } if planet

      Failure :not_found
    end
  end
end
