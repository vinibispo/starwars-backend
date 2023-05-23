class CreateFilmPlanet < ActiveRecord::Migration[7.0]
  def change
    create_table :film_planet do |t|
      t.references :film, null: false, foreign_key: true
      t.references :planet, null: false, foreign_key: true
    end
  end
end
