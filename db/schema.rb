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

ActiveRecord::Schema.define(version: 20160329175615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["question_id"], name: "index_comments_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["answer_id"], name: "index_votes_on_answer_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "comments", "questions"
  add_foreign_key "votes", "answers"
end
