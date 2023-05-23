class CreateFilms < ActiveRecord::Migration[7.0]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :episode_id
      t.string :opening_crawl
      t.string :director
      t.string :producer
      t.timestamp :release_date
      t.timestamp :created, default: -> { "datetime('now')" }
      t.timestamp :edited, default: -> { "datetime('now')" }
    end
  end
end
