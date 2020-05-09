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

ActiveRecord::Schema.define(version: 2020_05_01_181945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "password_digest", null: false
    t.string "role"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "author_type"
    t.bigint "author_id"
    t.string "title", null: false
    t.text "body", null: false
    t.boolean "published"
    t.datetime "published_at"
    t.string "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_articles_on_author_type_and_author_id"
  end

  create_table "course_professions", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "profession_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id", "profession_id"], name: "index_course_professions_on_course_id_and_profession_id", unique: true
    t.index ["course_id"], name: "index_course_professions_on_course_id"
    t.index ["profession_id"], name: "index_course_professions_on_profession_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "teacher_id"
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "professions", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_professions_on_title", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_reviews_on_course_id"
    t.index ["student_id", "course_id"], name: "index_reviews_on_student_id_and_course_id", unique: true
    t.index ["student_id"], name: "index_reviews_on_student_id"
  end

  create_table "student_courses", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.boolean "completed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_student_courses_on_course_id"
    t.index ["student_id", "course_id"], name: "index_student_courses_on_student_id_and_course_id", unique: true
    t.index ["student_id"], name: "index_student_courses_on_student_id"
  end

  create_table "student_homeworks", force: :cascade do |t|
    t.string "state", null: false
    t.integer "raiting", null: false
    t.text "student_comment"
    t.text "teacher_comment"
    t.datetime "date_begin", null: false
    t.datetime "date_end", null: false
    t.string "link_homework", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_student_homeworks_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email"
    t.string "phone_number"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["phone_number"], name: "index_students_on_phone_number", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.text "description"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "course_professions", "courses"
  add_foreign_key "course_professions", "professions"
  add_foreign_key "courses", "teachers"
  add_foreign_key "reviews", "courses"
  add_foreign_key "reviews", "students"
  add_foreign_key "student_courses", "courses"
  add_foreign_key "student_courses", "students"
  add_foreign_key "student_homeworks", "students"
end
