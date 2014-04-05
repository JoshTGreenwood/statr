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

ActiveRecord::Schema.define(version: 20140330194926) do

  create_table "games", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.string   "opponent_name"
    t.date     "date_played"
  end

  create_table "games_players", force: true do |t|
    t.integer "game_id"
    t.integer "player_id"
  end

  add_index "games_players", ["game_id"], name: "index_games_players_on_game_id"
  add_index "games_players", ["player_id"], name: "index_games_players_on_player_id"

  create_table "players", force: true do |t|
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "jersey_number"
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "stats", force: true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "free_throw_attempts"
    t.integer  "free_throws"
    t.integer  "field_goal_attempts"
    t.integer  "field_goals"
    t.integer  "three_pointer_attempts"
    t.integer  "three_pointers"
    t.integer  "offensive_rebounds"
    t.integer  "defensive_rebounds"
    t.integer  "turnovers"
    t.integer  "personal_fouls"
    t.integer  "steals"
    t.integer  "blocks"
    t.integer  "assists"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "teams_teams", force: true do |t|
    t.integer "team_id"
  end

  add_index "teams_teams", ["team_id"], name: "index_teams_teams_on_team_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
