class Character::List < Micro::Case
  attributes :search

  def call!
    characters = if search.present?
                   Character.ransack(name_cont: search).result(distinct: true)
                 else
                   Character.all
                 end
    Success result: { characters: }
  end
end
