module Planet
  class Remove < Micro::Case
    attribute :id

    def call!
      planet = Record.find_by(id:)

      return Failure(:not_found) unless planet

      planet.destroy
      Success()
    end
  end
end
