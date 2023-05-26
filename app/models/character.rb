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

  has_many :cast, class_name: 'Film::Character', foreign_key: 'people_id'
  has_many :films, through: :cast

  belongs_to :planet, foreign_key: 'homeworld'
end
