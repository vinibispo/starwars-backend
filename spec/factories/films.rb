FactoryBot.define do
  factory :film, class: 'Film' do
    title { Faker::Movie.title }
    episode_id { Faker::Number.between(from: 1, to: 10) }
    opening_crawl { Faker::Lorem.paragraph }
    director { Faker::Name.name }
    producer { Faker::Name.name }
    release_date { Faker::Date.between(from: '1977-01-01', to: '2020-12-31') }
  end
end
