module Scenarios
  Serializer = Data.define(:id, :film_id, :planet_id, :film, :planet) do
    def parsed_film
      Film.new(id: film.id, title: film.title)
    end

    def parsed_planet
      Planet.new(id: planet.id, name: planet.name)
    end

    def to_h
      super.merge(planet: parsed_planet, film: parsed_film)
    end
  end

  Film = Data.define(:id, :title)
  Planet = Data.define(:id, :name)

  private_constant :Film, :Planet
end
