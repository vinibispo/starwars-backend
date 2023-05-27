class Scenario::Record < ApplicationRecord
  self.table_name = 'film_planet'

  belongs_to :film, class_name: 'Film::Record'
  belongs_to :planet, class_name: 'Planet::Record'
end
