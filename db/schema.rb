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

ActiveRecord::Schema[8.1].define(version: 2026_07_22_134526) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "applicants", force: :cascade do |t|
    t.string "academy_of_application"
    t.string "address"
    t.string "application_status"
    t.string "city_of_residence"
    t.bigint "counselor_id", null: false
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.bigint "english_teacher_id", null: false
    t.string "first_name"
    t.bigint "interview_slot_id", null: false
    t.string "last_name"
    t.bigint "math_teacher_id", null: false
    t.bigint "recommendation_id", null: false
    t.boolean "recommendations_uploaded", default: false, null: false
    t.string "school_name"
    t.bigint "science_teacher_id", null: false
    t.bigint "test_slot_id", null: false
    t.bigint "transcript_id", null: false
    t.boolean "transcript_uploaded", default: false, null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["counselor_id"], name: "index_applicants_on_counselor_id"
    t.index ["english_teacher_id"], name: "index_applicants_on_english_teacher_id"
    t.index ["interview_slot_id"], name: "index_applicants_on_interview_slot_id"
    t.index ["math_teacher_id"], name: "index_applicants_on_math_teacher_id"
    t.index ["recommendation_id"], name: "index_applicants_on_recommendation_id"
    t.index ["science_teacher_id"], name: "index_applicants_on_science_teacher_id"
    t.index ["test_slot_id"], name: "index_applicants_on_test_slot_id"
    t.index ["transcript_id"], name: "index_applicants_on_transcript_id"
    t.index ["user_id"], name: "index_applicants_on_user_id"
  end

  create_table "counselors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "school_name"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_counselors_on_user_id"
  end

  create_table "interviewslots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "slot_academy"
    t.integer "slot_assigned"
    t.integer "slot_capacity"
    t.datetime "slot_datetime"
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "recommendation"
    t.bigint "teacher_id", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_recommendations_on_teacher_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "department"
    t.string "first_name"
    t.string "last_name"
    t.string "school_name"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "testslots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "slot_assigned"
    t.integer "slot_capacity"
    t.datetime "slot_datetime"
    t.string "slot_name"
    t.datetime "updated_at", null: false
  end

  create_table "transcripts", force: :cascade do |t|
    t.bigint "counselor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counselor_id"], name: "index_transcripts_on_counselor_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.string "role"
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "applicants", "counselors"
  add_foreign_key "applicants", "interviewslots", column: "interview_slot_id"
  add_foreign_key "applicants", "recommendations"
  add_foreign_key "applicants", "teachers", column: "english_teacher_id"
  add_foreign_key "applicants", "teachers", column: "math_teacher_id"
  add_foreign_key "applicants", "teachers", column: "science_teacher_id"
  add_foreign_key "applicants", "testslots", column: "test_slot_id"
  add_foreign_key "applicants", "transcripts"
  add_foreign_key "applicants", "users"
  add_foreign_key "counselors", "users"
  add_foreign_key "recommendations", "teachers"
  add_foreign_key "sessions", "users"
  add_foreign_key "teachers", "users"
  add_foreign_key "transcripts", "counselors"
end
