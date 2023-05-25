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

ActiveRecord::Schema[7.0].define(version: 2023_05_25_065601) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.boolean "correct"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "character_answers", force: :cascade do |t|
    t.integer "time"
    t.bigint "answer_id", null: false
    t.bigint "question_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text"
    t.index ["answer_id"], name: "index_character_answers_on_answer_id"
    t.index ["character_id"], name: "index_character_answers_on_character_id"
    t.index ["question_id"], name: "index_character_answers_on_question_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "max_health", default: 100
    t.integer "current_health"
    t.integer "max_mana", default: 100
    t.integer "current_mana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language"
    t.integer "level"
    t.bigint "user_id"
    t.string "icon_name"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "maps", force: :cascade do |t|
    t.boolean "completed"
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_maps_on_character_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.bigint "map_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_monsters_on_map_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "type"
    t.bigint "monster_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text"
    t.string "ai_question"
    t.index ["monster_id"], name: "index_questions_on_monster_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.integer "current_character_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "character_answers", "answers"
  add_foreign_key "character_answers", "characters"
  add_foreign_key "character_answers", "questions"
  add_foreign_key "maps", "characters"
  add_foreign_key "monsters", "maps"
  add_foreign_key "questions", "monsters"
end
