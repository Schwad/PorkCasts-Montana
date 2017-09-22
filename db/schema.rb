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

ActiveRecord::Schema.define(version: 20170922182751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_query_tasks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checks", force: :cascade do |t|
    t.float    "amount"
    t.datetime "payment_date"
    t.string   "department"
    t.string   "payee"
    t.string   "payment_category"
    t.integer  "popularity"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "query_id"
    t.boolean  "tweeted",          default: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.float    "amount"
    t.integer  "fiscal_year"
    t.datetime "billing_date"
    t.string   "department"
    t.string   "merchant"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "query_id"
    t.boolean  "tweeted",      default: false
  end

  create_table "daily_rake_logs", force: :cascade do |t|
    t.integer  "todays_work_time"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "gov_checks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "properties"
  end

  create_table "queries", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "opt_out_email", default: false
    t.boolean  "version_new",   default: false
  end

  create_table "queries_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "query_id"
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_queries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "query_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
