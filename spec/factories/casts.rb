FactoryBot.define do
  factory :cast, class: 'Film::Person' do
    association :film
    association :person
  end
end
