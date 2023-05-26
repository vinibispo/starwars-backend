class Character::Update < Micro::Case
  attributes :id, :input

  def call!
    character = Character.find_by(id:)

    return Failure(:not_found) unless character

    character.update(input)

    return Success result: { character: } if character.valid?

    Failure :invalid, result: { error: character.errors.full_messages }
  end
end
