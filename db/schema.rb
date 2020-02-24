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

ActiveRecord::Schema.define(version: 2020_02_24_223513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "design_categories", force: :cascade do |t|
    t.bigint "design_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_design_categories_on_category_id"
    t.index ["design_id"], name: "index_design_categories_on_design_id"
  end

  create_table "design_tags", force: :cascade do |t|
    t.bigint "design_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["design_id"], name: "index_design_tags_on_design_id"
    t.index ["tag_id"], name: "index_design_tags_on_tag_id"
  end

  create_table "designs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "file_type"
    t.boolean "layers", default: false
    t.boolean "indexed_colors", default: false
    t.string "pattern"
    t.integer "price"
    t.boolean "sold", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_designs_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "design_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["design_id"], name: "index_purchases_on_design_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone_number"
    t.string "website"
    t.string "company_name"
    t.boolean "company", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "design_categories", "categories"
  add_foreign_key "design_categories", "designs"
  add_foreign_key "design_tags", "designs"
  add_foreign_key "design_tags", "tags"
  add_foreign_key "designs", "users"
  add_foreign_key "purchases", "designs"
  add_foreign_key "purchases", "users"
end
