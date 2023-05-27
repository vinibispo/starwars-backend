module Planet
  class Find < Micro::Case
    attributes :id

    def call!
      record = Record.includes(:residents).find_by(id:)

      return Failure(:not_found) if record.nil?

      planet = Struct.new(
        name: record.name,
        rotation_period: record.rotation_period,
        orbital_period: record.orbital_period,
        diameter: record.diameter,
        climate: record.climate,
        gravity: record.gravity,
        terrain: record.terrain,
        surface_water: record.surface_water,
        population: record.population,
        residents: record.residents,
        films: record.films,
        created: record.created,
        edited: record.edited,
        id: record.id
      )

      Success result: { planet: }
    end
  end
end
