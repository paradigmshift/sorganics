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

ActiveRecord::Schema.define(version: 20160326035435) do

  create_table "batches", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "feed_types", force: :cascade do |t|
    t.string   "variety"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: :cascade do |t|
    t.datetime "date"
    t.integer  "quantity"
    t.string   "variety"
    t.integer  "feed_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pigs", force: :cascade do |t|
    t.string   "name"
    t.datetime "birthdate"
    t.float    "weight_at_beginning"
    t.float    "cost"
    t.string   "cause_of_death"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weights", force: :cascade do |t|
    t.datetime "date"
    t.float    "weight"
    t.integer  "pig_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
