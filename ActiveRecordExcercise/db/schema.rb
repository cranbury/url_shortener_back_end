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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131106155835) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.integer  "prerequisite_id"
    t.integer  "students_id"
    t.string   "instructor"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "courses", ["prerequisite_id"], :name => "index_courses_on_prerequisite_id"
  add_index "courses", ["students_id"], :name => "index_courses_on_students_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["course_id"], :name => "index_users_on_course_id"

end
