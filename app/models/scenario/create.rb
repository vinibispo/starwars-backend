class Scenario::Create < Micro::Case
  attributes :film_id, :planet_id

  def call!
    scenario = Scenario.new(film_id:, planet_id:)

    return Success result: { scenario: } if scenario.save

    Failure :invalid, result: { errors: scenario.errors.full_messages }
  end
end
