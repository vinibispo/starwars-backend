module Character
  class Create < Micro::Case
    attributes :input

    def call!
      character = Record.new(input)

      if character.save
        Success result: { character: }
      else
        Failure :invalid, result: { error: character.errors.full_messages }
      end
    end
  end
end
