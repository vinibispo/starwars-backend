FactoryBot.define do
  factory :scenario, class: 'Scenario::Record' do
    association :film
    association :planet
  end
end
