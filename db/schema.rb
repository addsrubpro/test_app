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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110226094856) do

  create_table "accounts", :force => true do |t|
    t.integer  "party_id"
    t.integer  "accounttype_id"
    t.integer  "account_number"
    t.decimal  "charge_rate",    :precision => 3, :scale => 3
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.integer  "party_id"
    t.string   "street"
    t.string   "city"
    t.integer  "country_id"
    t.date     "valid_since"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", :force => true do |t|
    t.integer  "applicationstatus_id"
    t.date     "status_date"
    t.integer  "payment_account"
    t.string   "name"
    t.string   "street"
    t.integer  "country_id"
    t.integer  "account_number"
    t.integer  "accounttype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clearingouts", :force => true do |t|
    t.date     "clearing_date"
    t.integer  "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emoneyoutstandings", :force => true do |t|
    t.decimal  "amount"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", :force => true do |t|
    t.integer  "payment_account"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partyrelationships", :force => true do |t|
    t.integer  "principal_id"
    t.integer  "possession_id"
    t.decimal  "interest",      :precision => 3, :scale => 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.integer  "party_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "account_id"
    t.integer  "transactiontype_id"
    t.decimal  "amount"
    t.date     "date"
    t.string   "sign"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "useraccountrights", :force => true do |t|
    t.integer  "useraccount_id"
    t.integer  "right_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "useraccounts", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

end
