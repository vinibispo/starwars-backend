# frozen_string_literal: true

module Planet
  Struct = Micro::Struct[:readonly].new(
    required: %i[name rotation_period orbital_period diameter climate gravity terrain surface_water
                 population id],
    optional: %i[residents films created edited]
  ) do
    def residents
      @residents ||= []
      @residents.map { |resident| Resident.new(name: resident.name, id: resident.id) }
    end

    def films
      @films ||= []
      @films.map { |film| Film.new(title: film.title, id: film.id) }
    end
  end
  Resident = Micro::Struct[:readonly].new(
    :name,
    :id
  )

  Film = Micro::Struct[:readonly].new(
    :title,
    :id
  )

  private_constant :Resident, :Film
end
