class Planet::Record < ApplicationRecord
  self.table_name = 'planets'

  required :name, :diameter, :rotation_period, :orbital_period, :gravity, :population, :climate, :terrain,
           :surface_water

  has_many :residents, class_name: 'Character::Record', foreign_key: 'homeworld'
  has_many :scenarios, class_name: 'Scenario::Record', foreign_key: 'planet_id'
  has_many :films, class_name: 'Film::Record', through: :scenarios
end
