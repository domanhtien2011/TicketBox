ActiveRecord::Schema.define(version: 20160327074316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "venue_id"
    t.string   "hero_image_url"
    t.text     "extended_html_description"
    t.integer  "category_id"
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
  end

  add_index "events", ["category_id"], name: "index_events_on_category_id", using: :btree
  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_types", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "price"
    t.string   "name"
    t.integer  "max_quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "ticket_id"
  end

  add_index "ticket_types", ["event_id"], name: "index_ticket_types_on_event_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "ticket_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "full_address"
    t.integer  "region_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "venues", ["region_id"], name: "index_venues_on_region_id", using: :btree

  add_foreign_key "events", "categories"
  add_foreign_key "events", "venues"
  add_foreign_key "ticket_types", "events"
  add_foreign_key "venues", "regions"
end
