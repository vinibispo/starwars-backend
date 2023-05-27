module Films
  Serializer = Micro::Struct[:readonly].new(
    required: %i[id title episode_id opening_crawl director producer release_date],
    optional: %i[characters planets]
  ) do
    def characters
      @characters ||= []
      @characters.map { |character| Character.new(id: character.id, name: character.name) }
    end

    def planets
      @planets ||= []
      @planets.map { |planet| Planet.new(id: planet.id, name: planet.name) }
    end
  end

  Character = Micro::Struct[:readonly].new(
    :id,
    :name
  )

  Planet = Micro::Struct[:readonly].new(
    :id,
    :name
  )

  private_constant :Character, :Planet
end
