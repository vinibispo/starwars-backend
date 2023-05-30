class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest

      t.timestamp :created, default: -> { "datetime('now')" }
      t.timestamp :edited, default: -> { "datetime('now')" }
    end
  end
end
