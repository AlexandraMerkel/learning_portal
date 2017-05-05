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

ActiveRecord::Schema.define(version: 20170505141205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.string   "community_name",       null: false
    t.integer  "community_visibility", null: false
    t.integer  "archive",              null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["community_name"], name: "index_communities_on_community_name", unique: true, using: :btree
  end

  create_table "community_contents", force: :cascade do |t|
    t.integer  "view_type",          null: false
    t.text     "content_body",       null: false
    t.integer  "content_visibility", null: false
    t.datetime "show"
    t.integer  "community_tab_id",   null: false
    t.integer  "creator_id",         null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["community_tab_id"], name: "index_community_contents_on_community_tab_id", using: :btree
    t.index ["creator_id"], name: "index_community_contents_on_creator_id", using: :btree
  end

  create_table "community_disciplines", force: :cascade do |t|
    t.integer  "discipline_id", null: false
    t.integer  "community_id",  null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["community_id"], name: "index_community_disciplines_on_community_id", using: :btree
    t.index ["discipline_id", "community_id"], name: "index_community_disciplines_on_discipline_id_and_community_id", unique: true, using: :btree
    t.index ["discipline_id"], name: "index_community_disciplines_on_discipline_id", using: :btree
  end

  create_table "community_news", force: :cascade do |t|
    t.text     "news_body"
    t.integer  "user_id"
    t.integer  "community_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["community_id"], name: "index_community_news_on_community_id", using: :btree
    t.index ["user_id"], name: "index_community_news_on_user_id", using: :btree
  end

  create_table "community_newses_users", id: false, force: :cascade do |t|
    t.integer "community_news_id", null: false
    t.integer "user_id",           null: false
  end

  create_table "community_sections", force: :cascade do |t|
    t.string   "section_name",     null: false
    t.integer  "section_type",     null: false
    t.integer  "section_position", null: false
    t.integer  "community_id",     null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["community_id"], name: "index_community_sections_on_community_id", using: :btree
    t.index ["section_name", "community_id"], name: "index_community_sections_on_section_name_and_community_id", unique: true, using: :btree
    t.index ["section_type", "community_id"], name: "index_community_sections_on_section_type_and_community_id", unique: true, using: :btree
  end

  create_table "community_tabs", force: :cascade do |t|
    t.integer  "community_section_id", null: false
    t.string   "tab_name",             null: false
    t.integer  "tab_position",         null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["community_section_id"], name: "index_community_tabs_on_community_section_id", using: :btree
    t.index ["tab_name", "community_section_id"], name: "index_community_tabs_on_tab_name_and_community_section_id", unique: true, using: :btree
  end

  create_table "community_users", force: :cascade do |t|
    t.integer  "link_type",    null: false
    t.integer  "user_id",      null: false
    t.integer  "community_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["community_id"], name: "index_community_users_on_community_id", using: :btree
    t.index ["user_id", "community_id"], name: "index_community_users_on_user_id_and_community_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_community_users_on_user_id", using: :btree
  end

  create_table "discipline_sections", force: :cascade do |t|
    t.integer  "discipline_type",      null: false
    t.string   "section_name",         null: false
    t.integer  "section_type",         null: false
    t.integer  "weight",               null: false
    t.integer  "min_score",            null: false
    t.integer  "max_score",            null: false
    t.integer  "require_type",         null: false
    t.float    "attenuation_constant", null: false
    t.date     "optimal_time",         null: false
    t.date     "limit_time",           null: false
    t.integer  "discipline_id",        null: false
    t.integer  "community_id",         null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["community_id"], name: "index_discipline_sections_on_community_id", using: :btree
    t.index ["discipline_id"], name: "index_discipline_sections_on_discipline_id", using: :btree
    t.index ["section_name", "discipline_id", "community_id"], name: "discipline_section_in_community", unique: true, using: :btree
  end

  create_table "disciplines", force: :cascade do |t|
    t.string   "discipline_name",                   null: false
    t.integer  "discipline_type",      default: [],              array: true
    t.integer  "discipline_end",                    null: false
    t.integer  "term_id",                           null: false
    t.integer  "ranking_algorithm_id",              null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["discipline_name", "discipline_type", "discipline_end"], name: "discipline_name_type_end", unique: true, using: :btree
    t.index ["ranking_algorithm_id"], name: "index_disciplines_on_ranking_algorithm_id", using: :btree
    t.index ["term_id"], name: "index_disciplines_on_term_id", using: :btree
  end

  create_table "disciplines_institutions", id: false, force: :cascade do |t|
    t.integer "institution_id", null: false
    t.integer "discipline_id",  null: false
    t.index ["institution_id", "discipline_id"], name: "institution_discipline", unique: true, using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group_name",   null: false
    t.date     "group_start",  null: false
    t.date     "archive_time", null: false
    t.integer  "term_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["group_name"], name: "index_groups_on_group_name", unique: true, using: :btree
    t.index ["term_id"], name: "index_groups_on_term_id", using: :btree
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id",  null: false
    t.index ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id", unique: true, using: :btree
  end

  create_table "institution_users", force: :cascade do |t|
    t.string   "rank",           null: false
    t.integer  "user_id",        null: false
    t.integer  "institution_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["institution_id"], name: "index_institution_users_on_institution_id", using: :btree
    t.index ["user_id", "institution_id"], name: "index_institution_users_on_user_id_and_institution_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_institution_users_on_user_id", using: :btree
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "institution_name",       null: false
    t.string   "short_institution_name", null: false
    t.string   "address",                null: false
    t.string   "phone_number",           null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["institution_name"], name: "index_institutions_on_institution_name", unique: true, using: :btree
    t.index ["short_institution_name"], name: "index_institutions_on_short_institution_name", unique: true, using: :btree
  end

  create_table "marks", force: :cascade do |t|
    t.integer  "mark_value",            null: false
    t.date     "report",                null: false
    t.integer  "discipline_section_id", null: false
    t.integer  "student_id",            null: false
    t.integer  "teacher_id",            null: false
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
    t.index ["message_list_id", "user_id"], name: "index_message_lists_users_on_message_list_id_and_user_id", unique: true, using: :btree
  end

  create_table "message_users", force: :cascade do |t|
    t.integer  "viewing",    null: false
    t.integer  "message_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_message_users_on_message_id", using: :btree
    t.index ["user_id", "message_id"], name: "index_message_users_on_user_id_and_message_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_message_users_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "message_content",      null: false
    t.datetime "send_time",            null: false
    t.string   "message_file_name"
    t.string   "message_content_type"
    t.integer  "message_file_size"
    t.datetime "message_updated_at"
    t.integer  "message_list_id",      null: false
    t.integer  "sender_id",            null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["message_list_id"], name: "index_messages_on_message_list_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
  end

  create_table "notices", force: :cascade do |t|
    t.integer  "notice_type",          null: false
    t.integer  "user_id",              null: false
    t.integer  "community_section_id", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["community_section_id"], name: "index_notices_on_community_section_id", using: :btree
    t.index ["user_id", "community_section_id"], name: "index_notices_on_user_id_and_community_section_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_notices_on_user_id", using: :btree
  end

  create_table "ranking_algorithms", force: :cascade do |t|
    t.string   "algorithm_name", null: false
    t.text     "template",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["algorithm_name"], name: "index_ranking_algorithms_on_algorithm_name", unique: true, using: :btree
  end

  create_table "role_users", force: :cascade do |t|
    t.json     "info"
    t.integer  "user_id",                         null: false
    t.integer  "role_id",                         null: false
    t.boolean  "activation_role", default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["role_id"], name: "index_role_users_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_role_users_on_user_id_and_role_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_role_users_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role_name",     null: false
    t.string   "full_name",     null: false
    t.string   "role_name_eng", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["full_name"], name: "index_roles_on_full_name", unique: true, using: :btree
    t.index ["role_name"], name: "index_roles_on_role_name", unique: true, using: :btree
    t.index ["role_name_eng"], name: "index_roles_on_role_name_eng", unique: true, using: :btree
  end

  create_table "study_files", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.string   "study_file_name",    null: false
    t.string   "study_content_type", null: false
    t.integer  "study_file_size",    null: false
    t.datetime "study_updated_at",   null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["user_id"], name: "index_study_files_on_user_id", using: :btree
  end

  create_table "terms", force: :cascade do |t|
    t.string   "term_name",                  null: false
    t.boolean  "actual",     default: false
    t.date     "term_start",                 null: false
    t.date     "term_end",                   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["term_end"], name: "index_terms_on_term_end", unique: true, using: :btree
    t.index ["term_name"], name: "index_terms_on_term_name", unique: true, using: :btree
    t.index ["term_start"], name: "index_terms_on_term_start", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "first_name",                      null: false
    t.string   "second_name"
    t.string   "last_name",                       null: false
    t.date     "birthday"
    t.text     "user_description"
    t.string   "sex",                             null: false
    t.index ["activation_token"], name: "index_users_on_activation_token", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  end

  add_foreign_key "community_contents", "community_tabs"
  add_foreign_key "community_contents", "users", column: "creator_id"
  add_foreign_key "community_disciplines", "communities"
  add_foreign_key "community_disciplines", "disciplines"
  add_foreign_key "community_news", "communities"
  add_foreign_key "community_news", "users"
  add_foreign_key "community_sections", "communities"
  add_foreign_key "community_tabs", "community_sections"
  add_foreign_key "community_users", "communities"
  add_foreign_key "community_users", "users"
  add_foreign_key "discipline_sections", "communities"
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
