# frozen_string_literal: true

FactoryBot.define do
  factory :character do
    name { Faker::Name.name }
    birth_year { Faker::Number.between(from: 1900, to: 2020) }
    eye_color { Faker::Color.color_name }
    gender { %w[male female n/a].sample }
    hair_color { Faker::Color.color_name }
    height { Faker::Number.between(from: 50, to: 250) }
    mass { Faker::Number.between(from: 50, to: 250) }
    skin_color { Faker::Color.color_name }
    homeworld { nil }
  end
end
