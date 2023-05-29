# frozen_string_literal: true

module People
  Serializer = Data.define(
    :id,
    :name,
    :birth_year,
    :eye_color,
    :homeworld,
    :gender,
    :hair_color,
    :height,
    :mass,
    :skin_color, :films, :planet
  ) do
    def parsed_films
      films.map { |film| Film.new(id: film.id, title: film.title) }
    end

    def parsed_planet
      Planet.new(
        id: planet.id,
        name: planet.name
      )
    end

    def to_h
      super.merge(planet: parsed_planet, films: parsed_films)
    end
  end

  Film = Data.define(:id, :title)

  Planet = Data.define(:id, :name)

  private_constant :Film, :Planet
end
