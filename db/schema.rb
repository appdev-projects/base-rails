# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_05_044058) do

  create_table "assessment_questions", force: :cascade do |t|
    t.string "name"
    t.string "question"
    t.string "spiritual_type"
    t.string "number"
    t.string "assessment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "spiritual_type"
    t.string "title"
    t.string "short_description"
    t.integer "lessons_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lesson_events", force: :cascade do |t|
    t.integer "seeker_id"
    t.integer "lesson_id"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "course_id"
    t.integer "practice_id"
    t.integer "day", default: 0
    t.string "title"
    t.string "description"
    t.string "teaching_link"
    t.string "audio_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "spiritual_type"
  end

  create_table "practices", force: :cascade do |t|
    t.string "name"
    t.string "body_mind"
    t.string "spoken_silent"
    t.string "extemp_ritual"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seekers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "full_name"
    t.float "personal_score", default: 0.0
    t.float "communal_score", default: 0.0
    t.float "environmental_score", default: 0.0
    t.float "transcendental_score", default: 0.0
    t.string "spiritual_type"
    t.integer "active_course_id", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_seekers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_seekers_on_reset_password_token", unique: true
  end

end
