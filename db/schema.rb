# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130819225732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_versions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "min_players"
    t.integer  "max_players"
  end

  create_table "games", force: true do |t|
    t.integer  "number"
    t.integer  "game_version_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  add_index "games", ["game_version_id"], name: "index_games_on_game_version_id", using: :btree
  add_index "games", ["number"], name: "index_games_on_number", unique: true, using: :btree

  create_table "houses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "game_id"
    t.integer  "house_id"
    t.integer  "player_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comment"
  end

  add_index "results", ["game_id", "house_id"], name: "index_results_on_game_id_and_house_id", unique: true, using: :btree
  add_index "results", ["game_id", "player_id"], name: "index_results_on_game_id_and_player_id", unique: true, using: :btree
  add_index "results", ["game_id"], name: "index_results_on_game_id", using: :btree
  add_index "results", ["house_id"], name: "index_results_on_house_id", using: :btree
  add_index "results", ["player_id"], name: "index_results_on_player_id", using: :btree

end
