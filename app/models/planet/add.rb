class Planet::Add < Micro::Case
  attributes :input

  def call!
    planet = Planet.new(input)
    return Success result: { planet: } if planet.save

    Failure :invalid, result: { error: planet.errors.full_messages }
  end
end