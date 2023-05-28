module Characters::Repo
  class List < Micro::Case
    attributes :search

    def call!
      characters = if search.present?
                     Character.ransack(name_cont: search).result(distinct: true)
                   else
                     Character.all
                   end
      Success result: { characters: characters.includes(:planet, :films) }
    end
  end

  class Create < Micro::Case
    attributes :input

    def call!
      character = Character.includes(:planet).new(input)

      if character.save
        Success result: { character: }
      else
        Failure :invalid, result: { error: character.errors.full_messages }
      end
    end
  end

  class Find < Micro::Case
    attributes :id

    def call!
      character = Character.includes(:planet, :films).find_by(id:)

      return Failure(:not_found) unless character

      Success result: { character: }
    end
  end

  class Update < Micro::Case
    attributes :id, :input

    def call!
      character = Character.includes(:planet, :films).find_by(id:)

      return Failure(:not_found) unless character

      character.update(input)

      return Success result: { character: } if character.valid?

      Failure :invalid, result: { error: character.errors.full_messages }
    end
  end

  class Remove < Micro::Case
    attributes :id

    def call!
      character = Character.find_by(id:)

      return Failure(:not_found) unless character

      character.destroy
      Success(:removed)
    end
  end
end
