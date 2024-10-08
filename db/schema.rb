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

ActiveRecord::Schema[7.1].define(version: 2024_09_24_121203) do
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "clubs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "uuid", null: false
    t.bigint "tennis_school_id", null: false
    t.string "name", null: false
    t.text "description"
    t.decimal "advance_payment_percentage", precision: 10, default: "0"
    t.decimal "min_advance_amount", precision: 10, default: "0"
    t.boolean "active", default: false
    t.text "information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tennis_school_id"], name: "index_clubs_on_tennis_school_id"
  end

  create_table "lesson_packages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "club_id", null: false
    t.string "name", null: false
    t.date "start_date"
    t.text "description", null: false
    t.decimal "costs", precision: 10
    t.boolean "open_for_registration", default: true
    t.date "register_by"
    t.date "register_up_to_and_including"
    t.integer "number_of_teaching_weeks", null: false
    t.integer "number_of_minutes_per_lesson", null: false
    t.integer "lessons_per_week"
    t.bigint "max_number_of_players"
    t.bigint "min_number_of_players"
    t.bigint "optimal_number_of_players"
    t.bigint "max_number_of_impediments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_lesson_packages_on_club_id"
  end

  create_table "notes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.bigint "status", null: false
    t.datetime "expected_completion_at"
    t.datetime "actual_completion_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tennis_schools", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "email"
    t.string "phone_number"
    t.boolean "active", default: false
    t.boolean "show_clubs", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clubs", "tennis_schools"
  add_foreign_key "lesson_packages", "clubs"
end
