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

ActiveRecord::Schema.define(version: 20140809144200) do

  create_table "ledger_accounts", force: true do |t|
    t.string   "name",                     null: false
    t.integer  "account_id",               null: false
    t.decimal  "balance",    default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ledger_entries", force: true do |t|
    t.integer  "account_id", null: false
    t.integer  "value_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ledger_transactions", force: true do |t|
    t.integer  "in_id",      null: false
    t.integer  "out_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quantity_ratios", force: true do |t|
    t.integer  "origin_id",                 null: false
    t.integer  "destiny_id",                null: false
    t.string   "formula",                   null: false
    t.boolean  "enable",     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quantity_types", force: true do |t|
    t.string "name", null: false
  end

  create_table "quantity_units", force: true do |t|
    t.string  "symbol",   null: false
    t.string  "name",     null: false
    t.string  "position", null: false
    t.integer "type_id",  null: false
  end

  create_table "quantity_values", force: true do |t|
    t.decimal "amount",  null: false
    t.integer "unit_id", null: false
  end

end
