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

ActiveRecord::Schema.define(version: 20161004073047) do

  create_table "caregiver_requester_relationships", force: :cascade do |t|
    t.integer  "caregiver_id"
    t.integer  "requester_id"
    t.integer  "status",       default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["caregiver_id"], name: "index_caregiver_requester_relationships_on_caregiver_id"
    t.index ["requester_id"], name: "index_caregiver_requester_relationships_on_requester_id"
  end

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

  create_table "comment_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "comment_category_id"
    t.index ["comment_category_id"], name: "index_comments_on_comment_category_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "demand_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "demands", force: :cascade do |t|
    t.integer  "demand_category_id"
    t.string   "demand_name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["demand_category_id"], name: "index_demands_on_demand_category_id"
  end

  create_table "event_demandships", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "demand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["demand_id"], name: "index_event_demandships_on_demand_id"
    t.index ["event_id"], name: "index_event_demandships_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "schedule_id",                  null: false
    t.integer  "requester_id",                 null: false
    t.string   "event_name"
    t.boolean  "push",         default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["requester_id"], name: "index_events_on_requester_id"
    t.index ["schedule_id"], name: "index_events_on_schedule_id"
  end

  create_table "health_records", force: :cascade do |t|
    t.integer  "requester_id"
    t.integer  "systolic_record"
    t.integer  "diastolic_record"
    t.integer  "heart_rate"
    t.integer  "blood_sugar"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["requester_id"], name: "index_health_records_on_requester_id"
  end

  create_table "medications", force: :cascade do |t|
    t.integer  "requester_id"
    t.text     "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["requester_id"], name: "index_medications_on_requester_id"
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

  create_table "time_eventships", force: :cascade do |t|
    t.integer  "time_zone_id"
    t.integer  "event_id"
    t.string   "service",      default: "off"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["event_id"], name: "index_time_eventships_on_event_id"
    t.index ["time_zone_id"], name: "index_time_eventships_on_time_zone_id"
  end

  create_table "time_zones", force: :cascade do |t|
    t.string   "zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             default: ""
    t.string   "last_name",              default: ""
    t.string   "nickname"
    t.string   "cell_phone_number",      default: ""
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
    t.string   "authentication_token"
    t.integer  "age"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
