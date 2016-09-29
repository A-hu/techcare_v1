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

ActiveRecord::Schema.define(version: 20160929081125) do

  create_table "caregivers", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.text     "introduction"
    t.text     "experience"
    t.text     "skill"
    t.string   "licence_number"
    t.date     "licence_offdate"
    t.string   "training"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_caregivers_on_user_id", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.integer  "schedule_id",                  null: false
    t.integer  "requester_id",                 null: false
    t.string   "event_name"
    t.string   "time_zone"
    t.boolean  "push",         default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["requester_id"], name: "index_events_on_requester_id"
    t.index ["schedule_id"], name: "index_events_on_schedule_id"
  end

  create_table "requesters", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.string   "address"
    t.text     "condition_description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["user_id"], name: "index_requesters_on_user_id", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "caregiver_id",   null: false
    t.date     "scheduled_date", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["caregiver_id"], name: "index_schedules_on_caregiver_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: "",  null: false
    t.string   "last_name",              default: "",  null: false
    t.string   "nickname"
    t.string   "cell_phone_number",      default: "",  null: false
    t.string   "home_phone_number"
    t.string   "line_id"
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "gender",                 default: "F"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
