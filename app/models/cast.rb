class Cast < ApplicationRecord
  self.table_name = 'film_people'

  belongs_to :film
  belongs_to :character, foreign_key: 'people_id', class_name: '::Character'
end
