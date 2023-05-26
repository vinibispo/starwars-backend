class Planet::Remove < Micro::Case
  attribute :id

  def call!
    planet = Planet.find_by(id:)

    return Failure(:not_found) unless planet

    planet.destroy
    Success()
  end
end
