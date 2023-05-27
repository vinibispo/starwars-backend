class Film::Record < ApplicationRecord
  self.table_name = 'films'

  validates :title, presence: true
  validates :episode_id, presence: true
  validates :opening_crawl, presence: true
  validates :director, presence: true
  validates :producer, presence: true
  validates :release_date, presence: true

  has_many :scenarios, class_name: 'Scenario::Record', foreign_key: 'film_id'
  has_many :planets, through: :scenarios

  has_many :casts, class_name: 'Cast::Record', foreign_key: 'film_id'
  has_many :characters, class_name: 'Character::Record', through: :casts, source: :character
end
