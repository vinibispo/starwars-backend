class Film::Planet < ApplicationRecord
  self.table_name = 'film_planet'
  belongs_to :film
  belongs_to :planet
end
