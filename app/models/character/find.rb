module Character
  class Find < Micro::Case
    attributes :id

    def call!
      character = Record.find_by(id:)

      return Failure(:not_found) unless character

      Success result: { character: }
    end
  end
end
