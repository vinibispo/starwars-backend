# frozen_string_literal: true

module Planets
  Serializer = Data.define(
    :name,
    :rotation_period,
    :orbital_period,
    :diameter,
    :climate,
    :gravity,
    :terrain,
    :surface_water,
    :population,
    :id,
    :residents,
    :films
  ) do
    def parsed_films
      films.map { |film| Film.new(title: film.title, id: film.id) }
    end

    def parsed_residents
      residents.map { |resident| Resident.new(name: resident.name, id: resident.id) }
    end

    def to_h
      super.merge(films: parsed_films, residents: parsed_residents)
    end
  end

  Resident = Data.define(:name, :id)

  Film = Data.define(:title, :id)

  private_constant :Resident, :Film
end
