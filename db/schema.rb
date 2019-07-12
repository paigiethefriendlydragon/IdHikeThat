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

ActiveRecord::Schema.define(version: 2019_07_11_025355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campsites", force: :cascade do |t|
    t.string "name"
    t.string "regulationsurl"
    t.string "weatheroverview"
    t.string "campsites"
    t.string "accessibility"
    t.string "directionsoverview"
    t.string "reservationsurl"
    t.string "directionsUrl"
    t.string "reservationssitesfirstcome"
    t.string "regulationsoverview"
    t.string "latLong"
    t.string "description"
    t.string "reservationssitesreservable"
    t.string "parkCode"
    t.string "amenities"
    t.string "reservationsdescription"
  end

  create_table "hikes", force: :cascade do |t|
    t.string "name"
    t.string "difficulty"
    t.string "summary"
    t.string "location"
    t.string "imgSqSmall"
    t.string "imgSmallMed"
    t.string "imgMedium"
    t.string "length"
    t.string "ascent"
    t.string "descent"
    t.string "low"
    t.string "latLong"
    t.string "conditionStatus"
    t.string "conditionDetails"
    t.datetime "conditionDate"
  end

  create_table "parks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "latLong"
    t.string "description"
    t.string "designation"
    t.string "directionsInfo"
    t.string "directionsUrl"
    t.string "fullName"
    t.string "weatherInfo"
    t.string "parkCode"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "profile_photo"
    t.string "username", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
