FactoryBot.define do
  factory :scenario, class: 'Film::Planet' do
    association :film
    association :planet
  end
end
