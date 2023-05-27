class Film < ApplicationRecord
  validates :title, presence: true
  validates :episode_id, presence: true
  validates :opening_crawl, presence: true
  validates :director, presence: true
  validates :producer, presence: true
  validates :release_date, presence: true

  has_many :scenarios, foreign_key: 'film_id'
  has_many :planets, through: :scenarios

  has_many :cast, class_name: 'Character', foreign_key: 'film_id'
  has_many :characters, class_name: '::Character', through: :cast, source: :character
end
