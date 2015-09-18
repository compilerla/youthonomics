# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150918163448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "active_steps", force: :cascade do |t|
    t.integer "initiated_flow_id", null: false
    t.integer "step_id",           null: false
    t.text    "note"
  end

  add_index "active_steps", ["initiated_flow_id", "step_id"], name: "index_active_steps_on_initiated_flow_id_and_step_id", unique: true, using: :btree

  create_table "activities", force: :cascade do |t|
    t.string   "activity_type", null: false
    t.integer  "user_id",       null: false
    t.integer  "subject_id",    null: false
    t.string   "subject_type",  null: false
    t.integer  "object_id"
    t.string   "object_type"
    t.hstore   "extra"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["activity_type"], name: "index_activities_on_activity_type", using: :btree
  add_index "activities", ["object_id", "object_type"], name: "index_activities_on_object_id_and_object_type", using: :btree
  add_index "activities", ["subject_id", "subject_type"], name: "index_activities_on_subject_id_and_subject_type", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "chat_messages", force: :cascade do |t|
    t.integer  "user_id",           null: false
    t.integer  "initiated_flow_id", null: false
    t.text     "content",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chat_messages", ["initiated_flow_id"], name: "index_chat_messages_on_initiated_flow_id", using: :btree
  add_index "chat_messages", ["user_id"], name: "index_chat_messages_on_user_id", using: :btree

  create_table "collected_data", force: :cascade do |t|
    t.integer  "initiated_flow_id", null: false
    t.integer  "step_datum_id",     null: false
    t.text     "content",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collected_data", ["content"], name: "index_collected_data_on_content", using: :btree
  add_index "collected_data", ["initiated_flow_id"], name: "index_collected_data_on_initiated_flow_id", using: :btree
  add_index "collected_data", ["step_datum_id"], name: "index_collected_data_on_step_datum_id", using: :btree

  create_table "comfy_cms_blocks", force: :cascade do |t|
    t.string   "identifier",     null: false
    t.text     "content"
    t.integer  "blockable_id"
    t.string   "blockable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_blocks", ["blockable_id", "blockable_type"], name: "index_comfy_cms_blocks_on_blockable_id_and_blockable_type", using: :btree
  add_index "comfy_cms_blocks", ["identifier"], name: "index_comfy_cms_blocks_on_identifier", using: :btree

  create_table "comfy_cms_categories", force: :cascade do |t|
    t.integer "site_id",          null: false
    t.string  "label",            null: false
    t.string  "categorized_type", null: false
  end

  add_index "comfy_cms_categories", ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_cat_type_and_label", unique: true, using: :btree

  create_table "comfy_cms_categorizations", force: :cascade do |t|
    t.integer "category_id",      null: false
    t.string  "categorized_type", null: false
    t.integer "categorized_id",   null: false
  end

  add_index "comfy_cms_categorizations", ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true, using: :btree

  create_table "comfy_cms_files", force: :cascade do |t|
    t.integer  "site_id",                                    null: false
    t.integer  "block_id"
    t.string   "label",                                      null: false
    t.string   "file_file_name",                             null: false
    t.string   "file_content_type",                          null: false
    t.integer  "file_file_size",                             null: false
    t.string   "description",       limit: 2048
    t.integer  "position",                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_files", ["site_id", "block_id"], name: "index_comfy_cms_files_on_site_id_and_block_id", using: :btree
  add_index "comfy_cms_files", ["site_id", "file_file_name"], name: "index_comfy_cms_files_on_site_id_and_file_file_name", using: :btree
  add_index "comfy_cms_files", ["site_id", "label"], name: "index_comfy_cms_files_on_site_id_and_label", using: :btree
  add_index "comfy_cms_files", ["site_id", "position"], name: "index_comfy_cms_files_on_site_id_and_position", using: :btree

  create_table "comfy_cms_layouts", force: :cascade do |t|
    t.integer  "site_id",                    null: false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.text     "css"
    t.text     "js"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_layouts", ["parent_id", "position"], name: "index_comfy_cms_layouts_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_layouts", ["site_id", "identifier"], name: "index_comfy_cms_layouts_on_site_id_and_identifier", unique: true, using: :btree

  create_table "comfy_cms_pages", force: :cascade do |t|
    t.integer  "site_id",                        null: false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                          null: false
    t.string   "slug"
    t.string   "full_path",                      null: false
    t.text     "content_cache"
    t.integer  "position",       default: 0,     null: false
    t.integer  "children_count", default: 0,     null: false
    t.boolean  "is_published",   default: true,  null: false
    t.boolean  "is_shared",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_pages", ["parent_id", "position"], name: "index_comfy_cms_pages_on_parent_id_and_position", using: :btree
  add_index "comfy_cms_pages", ["site_id", "full_path"], name: "index_comfy_cms_pages_on_site_id_and_full_path", using: :btree

  create_table "comfy_cms_revisions", force: :cascade do |t|
    t.string   "record_type", null: false
    t.integer  "record_id",   null: false
    t.text     "data"
    t.datetime "created_at"
  end

  add_index "comfy_cms_revisions", ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at", using: :btree

  create_table "comfy_cms_sites", force: :cascade do |t|
    t.string  "label",                       null: false
    t.string  "identifier",                  null: false
    t.string  "hostname",                    null: false
    t.string  "path"
    t.string  "locale",      default: "en",  null: false
    t.boolean "is_mirrored", default: false, null: false
  end

  add_index "comfy_cms_sites", ["hostname"], name: "index_comfy_cms_sites_on_hostname", using: :btree
  add_index "comfy_cms_sites", ["is_mirrored"], name: "index_comfy_cms_sites_on_is_mirrored", using: :btree

  create_table "comfy_cms_snippets", force: :cascade do |t|
    t.integer  "site_id",                    null: false
    t.string   "label",                      null: false
    t.string   "identifier",                 null: false
    t.text     "content"
    t.integer  "position",   default: 0,     null: false
    t.boolean  "is_shared",  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comfy_cms_snippets", ["site_id", "identifier"], name: "index_comfy_cms_snippets_on_site_id_and_identifier", unique: true, using: :btree
  add_index "comfy_cms_snippets", ["site_id", "position"], name: "index_comfy_cms_snippets_on_site_id_and_position", using: :btree

  create_table "flow_templates", force: :cascade do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.integer  "parent_id"
  end

  add_index "flow_templates", ["creator_id"], name: "index_flow_templates_on_creator_id", using: :btree
  add_index "flow_templates", ["parent_id"], name: "index_flow_templates_on_parent_id", using: :btree

  create_table "initiated_flows", force: :cascade do |t|
    t.string   "description",                                        null: false
    t.integer  "flow_template_id",                                   null: false
    t.integer  "current_step_id",                                    null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.datetime "finished_at"
    t.datetime "current_step_since", default: '2015-05-07 17:14:02', null: false
    t.integer  "initiator_id",                                       null: false
  end

  add_index "initiated_flows", ["current_step_id"], name: "index_initiated_flows_on_current_step_id", using: :btree
  add_index "initiated_flows", ["flow_template_id"], name: "index_initiated_flows_on_flow_template_id", using: :btree

  create_table "invitations", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.integer  "invited_by_id"
    t.string   "code"
    t.datetime "claimed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["invited_by_id"], name: "index_invitations_on_invited_by_id", using: :btree
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id", using: :btree

  create_table "person_attachments", force: :cascade do |t|
    t.integer "user_id",                null: false
    t.string  "person_attachable_type", null: false
    t.integer "person_attachable_id",   null: false
  end

  add_index "person_attachments", ["person_attachable_type", "person_attachable_id", "user_id"], name: "unique_attachments", unique: true, using: :btree
  add_index "person_attachments", ["person_attachable_type", "person_attachable_id"], name: "attachable", using: :btree
  add_index "person_attachments", ["user_id"], name: "index_person_attachments_on_user_id", using: :btree

  create_table "step_approvals", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "approval_status", null: false
    t.integer  "active_step_id",  null: false
  end

  add_index "step_approvals", ["active_step_id"], name: "index_step_approvals_on_active_step_id", using: :btree

  create_table "step_data", force: :cascade do |t|
    t.integer  "step_id",                   null: false
    t.string   "name",                      null: false
    t.string   "data_type",                 null: false
    t.boolean  "required",   default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "step_data", ["step_id"], name: "index_step_data_on_step_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.integer  "flow_template_id", null: false
    t.integer  "creator_id",       null: false
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "position",         null: false
    t.integer  "time"
    t.string   "time_unit"
    t.string   "type"
    t.text     "description"
  end

  add_index "steps", ["creator_id"], name: "index_steps_on_creator_id", using: :btree
  add_index "steps", ["flow_template_id"], name: "index_steps_on_flow_template_id", using: :btree

  create_table "tentative_assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "active_step_id", null: false
  end

  add_index "tentative_assignments", ["active_step_id"], name: "index_tentative_assignments_on_active_step_id", using: :btree
  add_index "tentative_assignments", ["user_id"], name: "index_tentative_assignments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name",                                   null: false
    t.string   "username",                               null: false
    t.boolean  "pseudo",                 default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
