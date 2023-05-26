class Planet::List < Micro::Case
  attributes :search

  def call!
    planets = if search.present?
                Planet.ransack(name_cont: search).result(distinct: true)
              else
                Planet.all
              end

    Success result: { planets: }
  end
end
