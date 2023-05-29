module Films
  Serializer = Data.define(
    :id, :title, :episode_id, :opening_crawl, :director, :producer, :release_date, :characters, :planets
  ) do
    def parsed_characters
      characters.map { |character| Character.new(id: character.id, name: character.name) }
    end

    def parsed_planets
      planets.map { |planet| Planet.new(id: planet.id, name: planet.name) }
    end

    def to_h
      super.merge(planets: parsed_planets, characters: parsed_characters)
    end
  end

  Character = Data.define(:id, :name)

  Planet = Data.define(:id, :name)

  private_constant :Character, :Planet
end
