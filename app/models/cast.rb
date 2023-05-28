class Cast < ApplicationRecord
  self.table_name = 'film_people'

  belongs_to :film, class_name: 'Film'
  belongs_to :character, class_name: 'Character', foreign_key: 'people_id'
end
