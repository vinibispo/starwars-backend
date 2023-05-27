class Character::Find < Micro::Case
  attributes :id

  def call!
    character = Character.find_by(id:)

    return Failure(:not_found) unless character

    Success result: { character: }
  end
end
