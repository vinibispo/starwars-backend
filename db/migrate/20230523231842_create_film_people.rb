class CreateFilmPeople < ActiveRecord::Migration[7.0]
  def change
    create_table :film_people do |t|
      t.references :film, null: false, foreign_key: true
      t.integer :people_id, foreign_key: { to_table: :people }
    end
  end
end
