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

ActiveRecord::Schema.define(version: 20161129151323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.string   "community_name"
    t.integer  "community_visibility"
    t.integer  "archive"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "communities_disciplines", id: false, force: :cascade do |t|
    t.integer "community_id",  null: false
    t.integer "discipline_id", null: false
  end

  create_table "community_contents", force: :cascade do |t|
    t.integer  "view_type"
    t.text     "content_body"
    t.integer  "content_visibility"
    t.datetime "show"
    t.integer  "community_tab_id"
    t.integer  "creator_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["community_tab_id"], name: "index_community_contents_on_community_tab_id", using: :btree
    t.index ["creator_id"], name: "index_community_contents_on_creator_id", using: :btree
  end

  create_table "community_sections", force: :cascade do |t|
    t.string   "section_name"
    t.integer  "section_type"
    t.integer  "section_position"
    t.integer  "community_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["community_id"], name: "index_community_sections_on_community_id", using: :btree
  end

  create_table "community_tabs", force: :cascade do |t|
    t.integer  "community_section_id"
    t.string   "tab_name"
    t.integer  "tab_position"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["community_section_id"], name: "index_community_tabs_on_community_section_id", using: :btree
  end

  create_table "community_users", force: :cascade do |t|
    t.integer  "link_type"
    t.integer  "user_id"
    t.integer  "community_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["community_id"], name: "index_community_users_on_community_id", using: :btree
    t.index ["user_id"], name: "index_community_users_on_user_id", using: :btree
  end

  create_table "discipline_sections", force: :cascade do |t|
    t.string   "section_name"
    t.integer  "section_type"
    t.integer  "weight"
    t.integer  "min_score"
    t.integer  "max_score"
    t.integer  "require_type"
    t.float    "attenuation_constant"
    t.date     "optimal_time"
    t.date     "limit_time"
    t.integer  "discipline_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["discipline_id"], name: "index_discipline_sections_on_discipline_id", using: :btree
  end

  create_table "disciplines", force: :cascade do |t|
    t.string   "discipline_name"
    t.integer  "discipline_type"
    t.integer  "discipline_end"
    t.integer  "term_id"
    t.integer  "ranking_algorithm_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["ranking_algorithm_id"], name: "index_disciplines_on_ranking_algorithm_id", using: :btree
    t.index ["term_id"], name: "index_disciplines_on_term_id", using: :btree
  end

  create_table "disciplines_institutions", id: false, force: :cascade do |t|
    t.integer "institution_id", null: false
    t.integer "discipline_id",  null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group_name"
    t.date     "group_start"
    t.date     "archive_time"
    t.integer  "term_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["term_id"], name: "index_groups_on_term_id", using: :btree
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id",  null: false
  end

  create_table "institution_users", force: :cascade do |t|
    t.string   "rank"
    t.integer  "user_id"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["institution_id"], name: "index_institution_users_on_institution_id", using: :btree
    t.index ["user_id"], name: "index_institution_users_on_user_id", using: :btree
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "institution_name"
    t.string   "short_instituton_name"
    t.string   "address"
    t.string   "phone_number"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "marks", force: :cascade do |t|
    t.integer  "mark_value"
    t.date     "report"
    t.integer  "discipline_section_id"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["discipline_section_id"], name: "index_marks_on_discipline_section_id", using: :btree
    t.index ["student_id"], name: "index_marks_on_student_id", using: :btree
    t.index ["teacher_id"], name: "index_marks_on_teacher_id", using: :btree
  end

  create_table "message_lists", force: :cascade do |t|
    t.string   "header"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_lists_users", id: false, force: :cascade do |t|
    t.integer "message_list_id", null: false
    t.integer "user_id",         null: false
  end

  create_table "message_users", force: :cascade do |t|
    t.integer  "viewing"
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_users_on_message_id", using: :btree
    t.index ["user_id"], name: "index_message_users_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "message_content"
    t.datetime "send"
    t.string   "message_file_name"
    t.string   "message_content_type"
    t.integer  "message_file_size"
    t.datetime "message_updated_at"
    t.integer  "message_list_id"
    t.integer  "sender_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["message_list_id"], name: "index_messages_on_message_list_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
  end

  create_table "notices", force: :cascade do |t|
    t.integer  "notice_type"
    t.integer  "user_id"
    t.integer  "community_section_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["community_section_id"], name: "index_notices_on_community_section_id", using: :btree
    t.index ["user_id"], name: "index_notices_on_user_id", using: :btree
  end

  create_table "ranking_algorithms", force: :cascade do |t|
    t.string   "algorithm_name"
    t.text     "template"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "role_users", force: :cascade do |t|
    t.json     "info"
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_users_on_role_id", using: :btree
    t.index ["user_id"], name: "index_role_users_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role_name"
    t.string   "full_name"
    t.string   "role_name_eng"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "study_files", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "study_file_name"
    t.string   "study_content_type"
    t.integer  "study_file_size"
    t.datetime "study_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_study_files_on_user_id", using: :btree
  end

  create_table "terms", force: :cascade do |t|
    t.string   "term_name"
    t.boolean  "actual"
    t.date     "term_start"
    t.date     "term_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.date     "birthday"
    t.text     "user_description"
    t.string   "sex"
    t.index ["activation_token"], name: "index_users_on_activation_token", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  end

  add_foreign_key "community_contents", "community_tabs"
  add_foreign_key "community_contents", "users", column: "creator_id"
  add_foreign_key "community_sections", "communities"
  add_foreign_key "community_tabs", "community_sections"
  add_foreign_key "community_users", "communities"
  add_foreign_key "community_users", "users"
  add_foreign_key "discipline_sections", "disciplines"
  add_foreign_key "disciplines", "ranking_algorithms"
  add_foreign_key "disciplines", "terms"
  add_foreign_key "groups", "terms"
  add_foreign_key "institution_users", "institutions"
  add_foreign_key "institution_users", "users"
  add_foreign_key "marks", "discipline_sections"
  add_foreign_key "marks", "users", column: "student_id"
  add_foreign_key "marks", "users", column: "teacher_id"
  add_foreign_key "message_users", "messages"
  add_foreign_key "message_users", "users"
  add_foreign_key "messages", "message_lists"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "notices", "community_sections"
  add_foreign_key "notices", "users"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
  add_foreign_key "study_files", "users"
end
