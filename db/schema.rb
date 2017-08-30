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

ActiveRecord::Schema.define(version: 20170830081348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "email_responses", force: :cascade do |t|
    t.string "email"
    t.text "extra_info"
    t.integer "response_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "short_description"
    t.string "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "filter_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_file_name"
    t.string "video_content_type"
    t.integer "video_file_size"
    t.datetime "video_updated_at"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "KRW", null: false
    t.bigint "profile_id"
    t.bigint "location_id"
    t.integer "max_seats", default: 0
    t.index ["location_id"], name: "index_events_on_location_id"
    t.index ["profile_id"], name: "index_events_on_profile_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "media_file_name"
    t.string "media_content_type"
    t.integer "media_file_size"
    t.datetime "media_updated_at"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tags"
    t.string "video_file_name"
    t.string "video_content_type"
    t.integer "video_file_size"
    t.datetime "video_updated_at"
    t.json "video_meta"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "slug"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "street_address1"
    t.string "street_address2"
    t.string "city", default: "Seoul"
    t.string "country", default: "South Korea"
    t.string "neighborhood"
    t.string "telephone"
    t.string "website"
    t.decimal "marker_x", default: "0.0"
    t.decimal "marker_y", default: "0.0"
    t.integer "marker_number", default: 0
    t.string "marker_color", default: "#8f1e23"
    t.decimal "marker_height", default: "13.72"
    t.decimal "marker_width", default: "13.72"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.bigint "order_id"
    t.integer "unit_price_cents", default: 0, null: false
    t.string "unit_price_currency", default: "KRW", null: false
    t.integer "quantity"
    t.integer "total_price_cents", default: 0, null: false
    t.string "total_price_currency", default: "KRW", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_order_items_on_event_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["user_id"], name: "index_order_items_on_user_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
    t.boolean "default", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ordinality"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "subtotal_cents", default: 0, null: false
    t.string "subtotal_currency", default: "KRW", null: false
    t.integer "tax_cents", default: 0, null: false
    t.string "tax_currency", default: "KRW", null: false
    t.integer "shipping_cents", default: 0, null: false
    t.string "shipping_currency", default: "KRW", null: false
    t.integer "total_cents", default: 0, null: false
    t.string "total_currency", default: "KRW", null: false
    t.bigint "order_status_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payer"
    t.string "full_name"
    t.string "description"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "KRW", null: false
    t.json "attributes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "description"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tags"
    t.boolean "is_active", default: true
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.integer "ordinality", default: 0
  end

  create_table "translations", force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.text "value"
    t.text "interpolations"
    t.boolean "is_proc", default: false
    t.index ["key", "locale"], name: "index_translations_on_key_and_locale", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.string "name"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "locale", default: "en"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_items", "events"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "users"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "users"
end
