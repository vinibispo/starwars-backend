module Planet
  class List < Micro::Case
    attributes :search

    def call!
      planets = if search.present?
                  Record.ransack(name_cont: search).result(distinct: true)
                else
                  Record.all
                end

      Success result: { planets: }
    end
  end
end
