# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_23_231842) do
  create_table "film_people", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "people_id"
    t.index ["film_id"], name: "index_film_people_on_film_id"
  end

  create_table "film_planet", force: :cascade do |t|
    t.integer "film_id", null: false
    t.integer "planet_id", null: false
    t.index ["film_id"], name: "index_film_planet_on_film_id"
    t.index ["planet_id"], name: "index_film_planet_on_planet_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.integer "episode_id"
    t.string "opening_crawl"
    t.string "director"
    t.string "producer"
    t.datetime "release_date", precision: nil
    t.datetime "created", precision: nil, default: -> { "datetime('now')" }
    t.datetime "edited", precision: nil, default: -> { "datetime('now')" }
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "birth_year"
    t.string "eye_color"
    t.string "gender"
    t.string "hair_color"
    t.string "height"
    t.string "mass"
    t.string "skin_color"
    t.integer "homeworld"
    t.datetime "created", precision: nil, default: -> { "datetime('now')" }
    t.datetime "edited", precision: nil, default: -> { "datetime('now')" }
  end

  create_table "planets", force: :cascade do |t|
    t.string "name"
    t.string "diameter"
    t.string "rotation_period"
    t.string "orbital_period"
    t.string "gravity"
    t.string "population"
    t.string "climate"
    t.string "terrain"
    t.string "surface_water"
    t.datetime "created", precision: nil, default: -> { "datetime('now')" }
    t.datetime "edited", precision: nil, default: -> { "datetime('now')" }
  end

  add_foreign_key "film_people", "films"
  add_foreign_key "film_planet", "films"
  add_foreign_key "film_planet", "planets"
end
