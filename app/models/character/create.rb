class Character::Create < Micro::Case
  attributes :input

  def call!
    character = Character.new(input)

    if character.save
      Success result: { character: }
    else
      Failure :invalid, result: { error: character.errors.full_messages }
    end
  end
end
