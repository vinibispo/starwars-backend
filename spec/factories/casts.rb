FactoryBot.define do
  factory :cast, class: 'Cast::Record' do
    association :film
    association :character
  end
end
