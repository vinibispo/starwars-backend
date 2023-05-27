module Casts
  Serializer = Micro::Struct.new(:id, :film_id, :character_id, :film, :character) do
    def film
      Film.new(id: @film.id, title: @film.title)
    end

    def character
      Character.new(id: @character.id, name: @character.name)
    end
  end

  Film = Micro::Struct.new(:id, :title)

  Character = Micro::Struct.new(:id, :name)

  private_constant :Film, :Character
end
