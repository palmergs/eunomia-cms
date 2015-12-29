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

ActiveRecord::Schema.define(version: 20151229013234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "structure_items", force: :cascade do |t|
    t.string   "type",           limit: 30,               null: false
    t.string   "ident",          limit: 100,              null: false
    t.string   "name",                                    null: false
    t.text     "description",                default: "", null: false
    t.json     "params",                     default: {}, null: false
    t.json     "default_params",             default: {}, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["ident"], name: "index_structure_items_on_ident", using: :btree
    t.index ["type"], name: "index_structure_items_on_type", using: :btree
  end

  create_table "structure_relations", force: :cascade do |t|
    t.integer "parent_id",                null: false
    t.integer "child_id",                 null: false
    t.boolean "optional",  default: true, null: false
    t.integer "rel_order",                null: false
    t.index ["child_id"], name: "index_structure_relations_on_child_id", using: :btree
    t.index ["parent_id"], name: "index_structure_relations_on_parent_id", using: :btree
    t.index ["rel_order"], name: "index_structure_relations_on_rel_order", using: :btree
  end

end
