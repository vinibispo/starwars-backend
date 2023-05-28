FactoryBot.define do
  factory :scenario, class: 'Scenario' do
    association :film
    association :planet
  end
end
