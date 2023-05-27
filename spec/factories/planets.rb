# frozen_string_literal: true

FactoryBot.define do
  factory :planet, class: 'Planet::Record' do
    name { Faker::Space.planet }
    diameter { Faker::Space.distance_measurement }
    rotation_period { Faker::Space.distance_measurement }
    orbital_period { Faker::Space.distance_measurement }
    gravity { Faker::Space.distance_measurement }
    population { Faker::Space.distance_measurement }
    climate { 'arid' }
    terrain { 'desert' }
    surface_water { Faker::Space.distance_measurement }
  end
end
