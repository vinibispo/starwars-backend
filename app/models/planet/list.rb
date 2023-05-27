module Planet
  class List < Micro::Case
    attributes :search

    def call!
      records = if search.present?
                  Record.ransack(name_cont: search).result(distinct: true)
                else
                  Record.all
                end
      planets = records.includes(:residents, :films)

      Success result: { planets: }
    end
  end
end
