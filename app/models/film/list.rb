class Film::List < Micro::Case
  attributes :search

  def call!
    films = if search.present?
              Film.ransack(title_cont: search).result(distinct: true)
            else
              Film.all
            end

    Success result: { films: }
  end
end
