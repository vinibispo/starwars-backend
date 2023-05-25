class Planet < ApplicationRecord
  validates :name, presence: true
  validates :diameter, presence: true
  validates :rotation_period, presence: true
  validates :orbital_period, presence: true
  validates :gravity, presence: true
  validates :population, presence: true
  validates :climate, presence: true
  validates :terrain, presence: true
  validates :surface_water, presence: true

  has_many :residents, class_name: 'Person', foreign_key: 'homeworld'
  has_many :film_planets, class_name: 'Film::Planet'
  has_many :films, through: :film_planets
end
