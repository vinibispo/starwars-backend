module Planets::Repo
  class List < Micro::Case
    attributes :search

    def call!
      query = if search.present?
                Planet.ransack(name_cont: search).result(distinct: true)
              else
                Planet.all
              end

      planets = query.includes(:residents, :films)

      Success result: { planets: }
    end
  end

  class Add < Micro::Case
    attributes :input

    def call!
      planet = Planet.new(input)
      return Success result: { planet: } if planet.save

      Failure :invalid, result: { error: planet.errors.full_messages }
    end
  end

  class Find < Micro::Case
    attributes :id

    def call!
      planet = Planet.includes(:residents).find_by(id:)

      return Success result: { planet: } if planet

      Failure :not_found
    end
  end

  class Update < Micro::Case
    attribute :id
    attribute :input

    def call!
      planet = Planet.includes(:residents, :films).find_by(id:)
      return Failure(:not_found) unless planet

      planet.update(input)
      return Success result: { planet: } if planet.valid?

      Failure(:invalid, result: { error: planet.errors.full_messages })
    end
  end

  class Remove < Micro::Case
    attribute :id

    def call!
      planet = Planet.find_by(id:)

      return Failure(:not_found) unless planet

      planet.destroy
      Success()
    end
  end
end
