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

ActiveRecord::Schema.define(version: 20160726062254) do

  create_table "account_infos", force: :cascade do |t|
    t.string   "code",           limit: 255
    t.integer  "broker_id",      limit: 4
    t.integer  "stakeholder_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "account_infos", ["broker_id"], name: "index_account_infos_on_broker_id", using: :btree
  add_index "account_infos", ["stakeholder_id"], name: "index_account_infos_on_stakeholder_id", using: :btree

  create_table "brokers", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "business_types", force: :cascade do |t|
    t.string   "code",        limit: 255
    t.string   "name",        limit: 255
    t.string   "alias_names", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "markets", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "security_infos", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "trade_code", limit: 255
    t.string   "name",       limit: 255
    t.integer  "market_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "security_infos", ["market_id"], name: "index_security_infos_on_market_id", using: :btree

  create_table "security_price_histories", force: :cascade do |t|
    t.integer  "security_info_id", limit: 4,                                        null: false
    t.date     "trade_date",                                                        null: false
    t.decimal  "open",                       precision: 16, scale: 2, default: 0.0, null: false
    t.decimal  "close",                      precision: 16, scale: 2, default: 0.0, null: false
    t.decimal  "high",                       precision: 16, scale: 2, default: 0.0, null: false
    t.decimal  "low",                        precision: 16, scale: 2, default: 0.0, null: false
    t.decimal  "volume",                     precision: 16, scale: 2, default: 0.0, null: false
    t.decimal  "amount",                     precision: 16, scale: 2, default: 0.0, null: false
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
  end

  create_table "stakeholders", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "account_infos", "brokers"
  add_foreign_key "account_infos", "stakeholders"
  add_foreign_key "security_infos", "markets"
end
