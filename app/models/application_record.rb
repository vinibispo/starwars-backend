class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  alias_attribute :created_at, :created
  alias_attribute :updated_at, :edited

  def self.required(*attrs) = attrs.each { |attr| validates attr, presence: true }

  def self.ransackable_attributes(_auth_object = nil)
    column_names + _ransackers.keys - %w[created edited created_at updated_at]
  end
end
