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

ActiveRecord::Schema.define(version: 20140626040821) do

  create_table "admins", force: true do |t|
    t.string   "email"
    t.string   "password_digest",        limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id"

  create_table "infractions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_of_infraction"
    t.integer  "cost"
  end

  create_table "infractions_tickets", id: false, force: true do |t|
    t.integer "ticket_id",     null: false
    t.integer "infraction_id", null: false
  end

  create_table "pictures", force: true do |t|
    t.string   "file_name"
    t.string   "format"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["ticket_id"], name: "index_pictures_on_ticket_id"

  create_table "tickets", force: true do |t|
    t.string   "vehicle_plate"
    t.string   "vehicle"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "license_code"
    t.datetime "date"
    t.integer  "latitude"
    t.integer  "longitude"
    t.string   "rut"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "email"
    t.integer  "user_id"
    t.string   "location"
    t.string   "description"
  end

  create_table "users", force: true do |t|
    t.string   "password",          limit: 100
    t.string   "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "precint"
    t.integer  "courthouse_number"
    t.string   "courthouse_city"
    t.string   "plaque"
    t.string   "password_digest"
  end

end
