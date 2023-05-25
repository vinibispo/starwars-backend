class Person < ApplicationRecord
  validates :name, presence: true
  validates :birth_year, presence: true
  validates :eye_color, presence: true
  validates :gender, presence: true
  validates :hair_color, presence: true
  validates :height, presence: true
  validates :mass, presence: true
  validates :skin_color, presence: true
  validates :homeworld, presence: true
end
