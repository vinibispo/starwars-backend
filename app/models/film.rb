class Film < ApplicationRecord
  def self.ransackable_attributes(_auth_object = nil)
    column_names - %w[created edited]
  end
end
