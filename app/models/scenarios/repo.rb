module Scenarios::Repo
  class Create < Micro::Case
    attributes :film_id, :planet_id

    def call!
      scenario = Scenario.includes(:film, :planet).new(film_id:, planet_id:)

      return Success result: { scenario: } if scenario.save

      Failure :invalid, result: { errors: scenario.errors.full_messages }
    end
  end

  class Remove < Micro::Case
    attributes :id

    def call!
      scenario = Scenario.find_by(id:)

      return Failure(:not_found) if scenario.nil?

      scenario.destroy

      Success(:removed)
    end
  end
end
