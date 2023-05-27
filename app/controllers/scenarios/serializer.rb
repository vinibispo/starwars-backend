module Scenarios
  Serializer = Micro::Struct[:readonly].new(:id, :film_id, :planet_id, :film, :planet) do
    def film
      Film.new(id: @film.id, title: @film.title)
    end

    def planet
      Planet.new(id: @planet.id, name: @planet.name)
    end
  end

  Film = Micro::Struct[:readonly].new(:id, :title)

  Planet = Micro::Struct[:readonly].new(:id, :name)

  private_constant :Film, :Planet
end
