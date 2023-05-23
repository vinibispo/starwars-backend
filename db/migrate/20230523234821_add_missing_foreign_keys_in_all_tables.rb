class AddMissingForeignKeysInAllTables < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :people, :planets, column: :homeworld
    add_foreign_key :film_people, :people, column: :people_id
  end
end
