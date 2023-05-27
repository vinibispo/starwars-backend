class Cast::Record < ApplicationRecord
  self.table_name = 'film_people'

  belongs_to :film, class_name: 'Film::Record'
  belongs_to :character, class_name: 'Character::Record', foreign_key: 'people_id'
end
