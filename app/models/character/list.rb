module Character
  class List < Micro::Case
    attributes :search

    def call!
      characters = if search.present?
                     Record.ransack(name_cont: search).result(distinct: true)
                   else
                     Record.all
                   end
      Success result: { characters: characters.includes(:planet, :films) }
    end
  end
end
