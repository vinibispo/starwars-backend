class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  alias_attribute :created_at, :created
  alias_attribute :updated_at, :edited
end
