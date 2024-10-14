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

ActiveRecord::Schema[8.0].define(version: 2024_10_09_131809) do
  create_table "boards", force: :cascade do |t|
    t.integer "round_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_boards_on_player_id"
    t.index ["round_id", "player_id"], name: "index_boards_on_round_id_and_player_id", unique: true
    t.index ["round_id"], name: "index_boards_on_round_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "ended_at"
    t.datetime "started_at"
    t.integer "round_time_limit", null: false
    t.string "invite_code", null: false
    t.integer "num_rounds", null: false
    t.integer "num_letters", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invite_code"], name: "index_games_on_invite_code", unique: true
  end

  create_table "guesses", force: :cascade do |t|
    t.integer "board_id", null: false
    t.string "word", null: false
    t.string "correct_letters", null: false
    t.string "correct_positions", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_guesses_on_board_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar_url"
    t.string "session_token"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_token"], name: "index_players_on_session_token", unique: true
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "game_id", null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string "word", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "boards", "players"
  add_foreign_key "boards", "rounds"
  add_foreign_key "guesses", "boards"
  add_foreign_key "players", "users"
  add_foreign_key "rounds", "games"
  add_foreign_key "sessions", "users"
end
