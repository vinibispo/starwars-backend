class Film < ApplicationRecord
  validates :title, presence: true
  validates :episode_id, presence: true
  validates :opening_crawl, presence: true
  validates :director, presence: true
  validates :producer, presence: true
  validates :release_date, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    column_names - %w[created edited]
  end
end
