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

ActiveRecord::Schema.define(version: 20150423230838) do

  create_table "brand_makes", force: :cascade do |t|
    t.integer  "brand_id",         limit: 4
    t.string   "make_name",        limit: 255,   null: false
    t.text     "make_description", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "meta_keywords",    limit: 100
  end

  add_index "brand_makes", ["make_name"], name: "index_brand_makes_on_make_name", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "brand_name",        limit: 255,   null: false
    t.text     "brand_description", limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "meta_keywords",     limit: 100
  end

  add_index "brands", ["brand_name"], name: "index_brands_on_brand_name", using: :btree

  create_table "make_engine_types", force: :cascade do |t|
    t.integer  "brand_make_id",  limit: 4
    t.string   "make_type_name", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "meta_keywords",  limit: 100
  end

  create_table "pages", force: :cascade do |t|
    t.string   "page_name",        limit: 255
    t.string   "page_keywords",    limit: 255
    t.string   "page_title",       limit: 255
    t.string   "page_description", limit: 255
    t.string   "page_url",         limit: 255
    t.text     "page_content",     limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "pages", ["page_name"], name: "index_pages_on_page_name", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "service_name",        limit: 50,    null: false
    t.text     "service_description", limit: 65535, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "meta_keywords",       limit: 100
  end

  create_table "user_appointments", force: :cascade do |t|
    t.string   "first_name",     limit: 20,    null: false
    t.string   "last_name",      limit: 20,    null: false
    t.string   "email",          limit: 50,    null: false
    t.string   "address",        limit: 100,   null: false
    t.string   "phone_number",   limit: 255,   null: false
    t.integer  "brand_id",       limit: 4,     null: false
    t.integer  "brand_make_id",  limit: 4,     null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "care_operation", limit: 65535, null: false
  end

  create_table "user_comments", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.boolean  "is_published", limit: 1
    t.text     "comment",      limit: 65535, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "user_operations", force: :cascade do |t|
    t.integer  "user_id",               limit: 4
    t.integer  "user_proposal_form_id", limit: 4
    t.text     "op_status",             limit: 65535
    t.boolean  "op_is_closed",          limit: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "user_proposal_forms", force: :cascade do |t|
    t.string   "form_no",              limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "email",                limit: 255,   null: false
    t.string   "first_name",           limit: 255,   null: false
    t.string   "last_name",            limit: 255,   null: false
    t.integer  "brand_id",             limit: 4
    t.integer  "brand_make_id",        limit: 4
    t.string   "phone_number",         limit: 20,    null: false
    t.text     "care_operation",       limit: 65535
    t.string   "given_cost",           limit: 20
    t.boolean  "is_accepted",          limit: 1
    t.text     "proposal_description", limit: 65535
  end

  add_index "user_proposal_forms", ["form_no"], name: "index_user_proposal_forms_on_form_no", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 30
    t.string   "last_name",              limit: 30
    t.string   "address",                limit: 100
    t.boolean  "is_admin",               limit: 1
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255,              null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
