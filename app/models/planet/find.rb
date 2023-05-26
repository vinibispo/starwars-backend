class Planet::Find < Micro::Case
  attributes :id

  def call!
    planet = Planet.find_by(id:)

    return Success result: { planet: } if planet

    Failure :not_found
  end
end
