class Character < ApplicationRecord
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

  has_many :casts, class_name: 'Cast', foreign_key: 'people_id'
  has_many :films, through: :casts

  belongs_to :planet, foreign_key: 'homeworld'
end
