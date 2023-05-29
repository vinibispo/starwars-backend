module Casts
  Serializer = Data.define(:id, :film_id, :character_id, :film, :character) do
    def parsed_film
      Film.new(id: film.id, title: film.title)
    end

    def parsed_character
      Character.new(id: character.id, name: character.name)
    end

    def to_h
      super.merge(character: parsed_character, film: parsed_film)
    end
  end

  Film = Data.define(:id, :title)

  Character = Data.define(:id, :name)

  private_constant :Film, :Character
end
