class Character::Record < ApplicationRecord
  self.table_name = 'people'

  required :name, :birth_year, :eye_color, :gender, :hair_color, :height, :mass, :skin_color, :homeworld

  has_many :casts, class_name: 'Cast::Record', foreign_key: 'people_id'
  has_many :films, class_name: 'Film::Record', through: :casts

  belongs_to :planet, class_name: 'Planet::Record', foreign_key: 'homeworld'
end
