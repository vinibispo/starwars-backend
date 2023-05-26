class Film::Planet < ApplicationRecord
  self.table_name = 'film_planet'
  belongs_to :film, class_name: 'Film'
  belongs_to :planet, class_name: '::Planet'
end
