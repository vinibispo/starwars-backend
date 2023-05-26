FactoryBot.define do
  factory :cast, class: 'Film::Character' do
    association :film
    association :character
  end
end
