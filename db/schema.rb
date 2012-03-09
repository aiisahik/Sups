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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120309065102) do

  create_table "categories", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories_items", :force => true do |t|
    t.integer  "category_id"
    t.integer  "item_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categories_items", ["category_id", "item_id"], :name => "index_categories_items_on_category_id_and_item_id"

  create_table "categories_vendors", :force => true do |t|
    t.integer  "category_id"
    t.integer  "vendor_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categories_vendors", ["category_id", "vendor_id"], :name => "index_categories_vendors_on_category_id_and_vendor_id"

  create_table "collections", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "collections", ["user_id"], :name => "index_collections_on_user_id"

  create_table "items", :force => true do |t|
    t.string   "name",                :null => false
    t.string   "description"
    t.string   "note"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "attach"
  end

  create_table "users", :force => true do |t|
    t.string   "username",   :null => false
    t.string   "email",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
