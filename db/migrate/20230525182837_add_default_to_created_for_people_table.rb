class AddDefaultToCreatedForPeopleTable < ActiveRecord::Migration[7.0]
  def change
    change_column_default :people, :created, from: nil, to: -> { "datetime('now')" }
  end
end
