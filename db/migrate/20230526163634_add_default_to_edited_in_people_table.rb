class AddDefaultToEditedInPeopleTable < ActiveRecord::Migration[7.1]
  def change
    change_column_default :people, :edited, from: nil, to: -> { "datetime('now')" }
  end
end
