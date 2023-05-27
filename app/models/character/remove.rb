module Character
  class Remove < Micro::Case
    attributes :id

    def call!
      character = Record.find_by(id:)

      return Failure(:not_found) unless character

      character.destroy
      Success(:removed)
    end
  end
end
