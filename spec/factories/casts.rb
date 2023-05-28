FactoryBot.define do
  factory :cast, class: 'Cast' do
    association :film
    association :character
  end
end
