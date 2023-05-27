class Planet::Record < ApplicationRecord
  self.table_name = 'planets'

  validates :name, presence: true
  validates :diameter, presence: true
  validates :rotation_period, presence: true
  validates :orbital_period, presence: true
  validates :gravity, presence: true
  validates :population, presence: true
  validates :climate, presence: true
  validates :terrain, presence: true
  validates :surface_water, presence: true

  has_many :residents, class_name: 'Character::Record', foreign_key: 'homeworld'
  has_many :scenarios, class_name: 'Scenario::Record', foreign_key: 'planet_id'
  has_many :films, class_name: 'Film::Record', through: :scenarios
end
