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

ActiveRecord::Schema.define(version: 2022_10_14_085819) do

  create_table "admins", force: :cascade do |t|
    t.string "phone", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phone"], name: "index_admins_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "doctors", force: :cascade do |t|
    t.integer "specialty_id", null: false
    t.string "phone", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phone"], name: "index_doctors_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
    t.index ["specialty_id"], name: "index_doctors_on_specialty_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "phone", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phone"], name: "index_patients_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "receptions", force: :cascade do |t|
    t.datetime "time"
    t.integer "doctor_id", null: false
    t.integer "patient_id", null: false
    t.boolean "open", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_receptions_on_doctor_id"
    t.index ["patient_id"], name: "index_receptions_on_patient_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer "reception_id", null: false
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reception_id"], name: "index_recommendations_on_reception_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_specialties_on_name", unique: true
  end

  add_foreign_key "doctors", "specialties"
  add_foreign_key "receptions", "doctors"
  add_foreign_key "receptions", "patients"
  add_foreign_key "recommendations", "receptions"
end
