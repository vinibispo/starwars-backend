module Film
  class List < Micro::Case
    attributes :search

    def call!
      films = if search.present?
                Record.ransack(title_cont: search).result(distinct: true)
              else
                Record.all
              end

      Success result: { films: }
    end
  end
end
