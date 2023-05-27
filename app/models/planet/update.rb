module Planet
  class Update < Micro::Case
    attribute :id
    attribute :input

    def call!
      planet = Record.includes(:residents, :films).find_by(id:)
      return Failure(:not_found) unless planet

      planet.update(input)
      return Success result: { planet: } if planet.valid?

      Failure(:invalid, result: { error: planet.errors.full_messages })
    end
  end
end
