class Film::Person < ApplicationRecord
  belongs_to :film
  belongs_to :person, foreign_key: 'people_id', class_name: '::Person'
end
