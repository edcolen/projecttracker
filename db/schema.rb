# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_20_225755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "card_taggings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "card_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_taggings_on_card_id"
    t.index ["tag_id"], name: "index_card_taggings_on_tag_id"
    t.index ["user_id"], name: "index_card_taggings_on_user_id"
  end

  create_table "card_teamings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "card_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_teamings_on_card_id"
    t.index ["member_id"], name: "index_card_teamings_on_member_id"
    t.index ["user_id"], name: "index_card_teamings_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "section_id"
    t.bigint "leader_id"
    t.bigint "color_id"
    t.string "title", null: false
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "priority"
    t.string "status", default: "new"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["color_id"], name: "index_cards_on_color_id"
    t.index ["leader_id"], name: "index_cards_on_leader_id"
    t.index ["section_id"], name: "index_cards_on_section_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "collaborations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "project_id"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_collaborations_on_member_id"
    t.index ["project_id"], name: "index_collaborations_on_project_id"
    t.index ["user_id"], name: "index_collaborations_on_user_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "hexcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comment_taggings", force: :cascade do |t|
    t.bigint "comment_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_comment_taggings_on_comment_id"
    t.index ["tag_id"], name: "index_comment_taggings_on_tag_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "card_id"
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_comments_on_card_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "notification_action", null: false
    t.string "notification_target", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "privileges", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "admin_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_privileges_on_admin_id"
    t.index ["project_id"], name: "index_privileges_on_project_id"
    t.index ["user_id"], name: "index_privileges_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title", null: false
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_responses_on_comment_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "section_taggings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "section_id"
    t.bigint "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["section_id"], name: "index_section_taggings_on_section_id"
    t.index ["tag_id"], name: "index_section_taggings_on_tag_id"
    t.index ["user_id"], name: "index_section_taggings_on_user_id"
  end

  create_table "section_teamings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "member_id"
    t.bigint "section_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_section_teamings_on_member_id"
    t.index ["section_id"], name: "index_section_teamings_on_section_id"
    t.index ["user_id"], name: "index_section_teamings_on_user_id"
  end

  create_table "sections", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.bigint "leader_id"
    t.bigint "color_id"
    t.string "title", null: false
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["color_id"], name: "index_sections_on_color_id"
    t.index ["leader_id"], name: "index_sections_on_leader_id"
    t.index ["project_id"], name: "index_sections_on_project_id"
    t.index ["user_id"], name: "index_sections_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "card_taggings", "cards"
  add_foreign_key "card_taggings", "tags"
  add_foreign_key "card_taggings", "users"
  add_foreign_key "card_teamings", "cards"
  add_foreign_key "card_teamings", "users"
  add_foreign_key "card_teamings", "users", column: "member_id"
  add_foreign_key "cards", "colors"
  add_foreign_key "cards", "sections"
  add_foreign_key "cards", "users"
  add_foreign_key "collaborations", "projects"
  add_foreign_key "collaborations", "users"
  add_foreign_key "collaborations", "users", column: "member_id"
  add_foreign_key "comment_taggings", "comments"
  add_foreign_key "comment_taggings", "tags"
  add_foreign_key "comments", "cards"
  add_foreign_key "comments", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "privileges", "projects"
  add_foreign_key "privileges", "users"
  add_foreign_key "privileges", "users", column: "admin_id"
  add_foreign_key "projects", "users"
  add_foreign_key "responses", "comments"
  add_foreign_key "responses", "users"
  add_foreign_key "section_taggings", "sections"
  add_foreign_key "section_taggings", "tags"
  add_foreign_key "section_taggings", "users"
  add_foreign_key "section_teamings", "sections"
  add_foreign_key "section_teamings", "users"
  add_foreign_key "section_teamings", "users", column: "member_id"
  add_foreign_key "sections", "colors"
  add_foreign_key "sections", "projects"
  add_foreign_key "sections", "users"
  add_foreign_key "sections", "users", column: "leader_id"
end
