class Character::Remove < Micro::Case
  attributes :id

  def call!
    character = Character.find_by(id:)

    return Failure(:not_found) unless character

    character.destroy
    Success(:removed)
  end
end
