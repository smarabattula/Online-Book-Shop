# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_13_062713) do
  create_table "books", force: :cascade do |t|
    t.string "Name"
    t.string "Author"
    t.string "Publisher"
    t.decimal "Price"
    t.integer "Stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "Rating"
    t.string "Review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "users_id", null: false
    t.integer "books_id", null: false
    t.index ["books_id"], name: "index_reviews_on_books_id"
    t.index ["users_id"], name: "index_reviews_on_users_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.string "transaction_number"
    t.index ["book_id"], name: "index_transactions_on_book_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "credit_card_number"
    t.string "phone_number"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "reviews", "books", column: "books_id"
  add_foreign_key "reviews", "users", column: "users_id"
  add_foreign_key "transactions", "books"
  add_foreign_key "transactions", "users"
end
