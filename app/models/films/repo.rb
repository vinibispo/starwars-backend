module Films::Repo
  class List < Micro::Case
    attributes :search

    def call!
      films = if search.present?
                Film.ransack(title_cont: search).result(distinct: true)
              else
                Film.all
              end

      Success result: { films: }
    end
  end

  class Create < Micro::Case
    attributes :input

    def call!
      film = Film.new(input)

      film.save
      return Success result: { film: } if film.valid?

      Failure :invalid, result: { error: film.errors.full_messages }
    end
  end

  class Find < Micro::Case
    attributes :id

    def call!
      film = Film.find_by(id:)

      return Success result: { film: } if film

      Failure :not_found
    end
  end

  class Update < Micro::Case
    attributes :id, :input

    def call!
      film = Film.find_by(id:)

      return Failure(:not_found) unless film

      film.update(input)

      return Success result: { film: } if film.valid?

      Failure(:invalid, result: { error: film.errors.full_messages })
    end
  end

  class Remove < Micro::Case
    attributes :id

    def call!
      film = Film.find_by(id:)

      return Failure(:not_found) unless film

      film.destroy
      Success(:ok)
    end
  end
end
