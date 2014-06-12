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

ActiveRecord::Schema.define(version: 20140612001000) do

  create_table "assigned_tasks", force: true do |t|
    t.integer  "tasks_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assigned_tasks", ["tasks_id"], name: "index_assigned_tasks_on_tasks_id", using: :btree

  create_table "editors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "websites_id"
    t.integer  "number"
    t.integer  "reward"
    t.string   "description"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["websites_id"], name: "index_tasks_on_websites_id", using: :btree

  create_table "writers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
