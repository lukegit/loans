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

ActiveRecord::Schema.define(version: 20170325134710) do

  create_table "applies", force: :cascade do |t|
    t.integer  "profession",    limit: 4
    t.integer  "money_amount",  limit: 4
    t.integer  "time_limit",    limit: 4
    t.integer  "use",           limit: 4
    t.string   "name",          limit: 255
    t.string   "work_location", limit: 255
    t.string   "income",        limit: 255
    t.integer  "has_card",      limit: 4
    t.string   "phone",         limit: 255
    t.integer  "state",         limit: 4
    t.string   "reason",        limit: 255
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "banners", force: :cascade do |t|
    t.string   "img",         limit: 255
    t.string   "msg",         limit: 255
    t.string   "url",         limit: 255
    t.integer  "banner_type", limit: 4
    t.integer  "state",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "loan_lists", force: :cascade do |t|
    t.string   "platform_name",        limit: 255
    t.string   "url",                  limit: 255
    t.integer  "caree",                limit: 4
    t.string   "desc",                 limit: 255
    t.string   "tags",                 limit: 255
    t.string   "success_rate",         limit: 255
    t.string   "success_rate_display", limit: 255
    t.string   "tag_icon",             limit: 255
    t.integer  "apply_count",          limit: 4
    t.integer  "platform_type",        limit: 4
    t.string   "interest",             limit: 255
    t.integer  "sort_order",           limit: 4
    t.string   "amount_display",       limit: 255
    t.string   "interest_display",     limit: 255
    t.string   "term",                 limit: 255
    t.string   "icon",                 limit: 255
    t.string   "amount",               limit: 255
    t.string   "is_hot",               limit: 255
    t.string   "loan_type",            limit: 255
    t.integer  "state",                limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "telephone",       limit: 255
    t.string   "password_digest", limit: 255
    t.integer  "state",           limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
