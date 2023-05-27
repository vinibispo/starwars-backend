# frozen_string_literal: true

module People
  Serializer = Micro::Struct[:readonly].new(
    required: %i[id name birth_year eye_color gender hair_color height mass skin_color homeworld],
    optional: %i[films created edited planet]
  ) do
    def films
      @films.map { |film| Film.new(id: film.id, title: film.title) }
    end

    def planet
      return nil if @planet.nil?

      Planet.new(
        id: @planet.id,
        name: @planet.name
      )
    end
  end

  Film = Micro::Struct[:readonly].new(
    :id,
    :title
  )

  Planet = Micro::Struct[:readonly].new(
    :id,
    :name
  )

  private_constant :Film, :Planet
end
