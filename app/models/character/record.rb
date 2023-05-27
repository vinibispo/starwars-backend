class Character::Record < ApplicationRecord
  self.table_name = 'people'

  validates :name, presence: true
  validates :birth_year, presence: true
  validates :eye_color, presence: true
  validates :gender, presence: true
  validates :hair_color, presence: true
  validates :height, presence: true
  validates :mass, presence: true
  validates :skin_color, presence: true
  validates :homeworld, presence: true

  has_many :casts, class_name: 'Cast::Record', foreign_key: 'people_id'
  has_many :films, class_name: 'Film::Record', through: :casts

  belongs_to :planet, class_name: 'Planet::Record', foreign_key: 'homeworld'
end
