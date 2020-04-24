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

ActiveRecord::Schema.define(version: 20200423085044) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'grade_levels', force: :cascade do |t|
    t.integer 'level'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'grade_levels_subjects', force: :cascade do |t|
    t.bigint 'grade_level_id'
    t.bigint 'subject_id'
    t.index ['grade_level_id'], name: 'index_grade_levels_subjects_on_grade_level_id'
    t.index ['subject_id'], name: 'index_grade_levels_subjects_on_subject_id'
  end

  create_table 'grade_levels_teachers', force: :cascade do |t|
    t.bigint 'teacher_id'
    t.bigint 'grade_level_id'
    t.index ['grade_level_id'], name: 'index_grade_levels_teachers_on_grade_level_id'
    t.index ['teacher_id'], name: 'index_grade_levels_teachers_on_teacher_id'
  end

  create_table 'grades', force: :cascade do |t|
    t.string 'letter'
    t.bigint 'grade_level_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['grade_level_id'], name: 'index_grades_on_grade_level_id'
  end

  create_table 'parents', force: :cascade do |t|
    t.string 'parent_style'
    t.bigint 'user_id'
    t.bigint 'student_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['student_id'], name: 'index_parents_on_student_id'
    t.index ['user_id'], name: 'index_parents_on_user_id'
  end

  create_table 'parents_students', force: :cascade do |t|
    t.bigint 'parent_id'
    t.bigint 'student_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['parent_id'], name: 'index_parents_students_on_parent_id'
    t.index ['student_id'], name: 'index_parents_students_on_student_id'
  end

  create_table 'students', force: :cascade do |t|
    t.string 'code'
    t.bigint 'user_id'
    t.bigint 'grade_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['grade_id'], name: 'index_students_on_grade_id'
    t.index ['user_id'], name: 'index_students_on_user_id'
  end

  create_table 'subjects', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'subjects_teachers', force: :cascade do |t|
    t.bigint 'teacher_id'
    t.bigint 'subject_id'
    t.index ['subject_id'], name: 'index_subjects_teachers_on_subject_id'
    t.index ['teacher_id'], name: 'index_subjects_teachers_on_teacher_id'
  end

  create_table 'teachers', force: :cascade do |t|
    t.bigint 'user_id'
    t.string 'snils'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_teachers_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'middle_name'
    t.date 'dob'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'sex', default: 0
    t.string 'email'
  end

  add_foreign_key 'grade_levels_subjects', 'grade_levels'
  add_foreign_key 'grade_levels_subjects', 'subjects'
  add_foreign_key 'grade_levels_teachers', 'grade_levels'
  add_foreign_key 'grade_levels_teachers', 'teachers'
  add_foreign_key 'grades', 'grade_levels'
  add_foreign_key 'parents', 'students'
  add_foreign_key 'parents', 'users'
  add_foreign_key 'parents_students', 'parents'
  add_foreign_key 'parents_students', 'students'
  add_foreign_key 'students', 'grades'
  add_foreign_key 'students', 'users'
  add_foreign_key 'subjects_teachers', 'subjects'
  add_foreign_key 'subjects_teachers', 'teachers'
  add_foreign_key 'teachers', 'users'
end
