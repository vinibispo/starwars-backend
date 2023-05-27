module Planet
  class Find < Micro::Case
    attributes :id

    def call!
      planet = Record.includes(:residents).find_by(id:)

      return Success result: { planet: } if planet

      Failure :not_found
    end
  end
end
