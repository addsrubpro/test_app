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

ActiveRecord::Schema.define(:version => 20110306112019) do

  create_table "accounts", :force => true do |t|
    t.integer  "party_id"
    t.integer  "accounttype_id"
    t.integer  "account_number"
    t.decimal  "charge_rate",    :precision => 3, :scale => 3
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounttypes", :force => true do |t|
    t.string   "description"
    t.decimal  "default_charge_rate", :precision => 2, :scale => 4
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
    t.string   "housenumber"
    t.string   "postal_supplement"
    t.string   "zipcode"
  end

  add_index "addresses", ["party_id"], :name => "index_addresses_on_party_id"

  create_table "clearingouts", :force => true do |t|
    t.date     "clearing_date"
    t.integer  "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emoneyouts", :force => true do |t|
    t.date     "clearing_date"
    t.integer  "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emoneyouts", ["clearing_date"], :name => "index_emoneyouts_on_clearing_date"
  add_index "emoneyouts", ["transaction_id"], :name => "index_emoneyouts_on_transaction_id"

  create_table "emoneyoutstandings", :force => true do |t|
    t.decimal  "amount"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", :force => true do |t|
    t.string   "payment_iban", :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parties", ["payment_iban"], :name => "index_parties_on_payment_iban"

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
    t.integer  "title_id"
    t.string   "degree"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "telephone"
    t.date     "birth_date"
    t.string   "birth_place"
  end

  add_index "people", ["email"], :name => "index_people_on_email"
  add_index "people", ["party_id"], :name => "index_people_on_party_id"

  create_table "requests", :force => true do |t|
    t.integer  "requeststatus_id"
    t.date     "requeststatus_date"
    t.string   "payment_iban"
    t.integer  "title_id"
    t.string   "degree"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "telephone"
    t.date     "birth_date"
    t.string   "birth_place"
    t.string   "street"
    t.string   "housenumber"
    t.string   "postal_supplement"
    t.string   "zipcode"
    t.string   "city"
    t.integer  "country_id"
    t.integer  "accounttype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["requeststatus_id"], :name => "index_requests_on_requeststatus_id"

  create_table "requeststatuses", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titles", :force => true do |t|
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
