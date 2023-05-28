class Film::Record < ApplicationRecord
  self.table_name = 'films'

  required :title, :episode_id, :opening_crawl, :director, :producer, :release_date

  has_many :scenarios, class_name: 'Scenario::Record', foreign_key: 'film_id'
  has_many :planets, through: :scenarios

  has_many :casts, class_name: 'Cast::Record', foreign_key: 'film_id'
  has_many :characters, class_name: 'Character::Record', through: :casts, source: :character
end
