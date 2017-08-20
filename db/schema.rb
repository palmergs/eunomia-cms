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

ActiveRecord::Schema.define(version: 20151229015511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "content_items", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.integer "structure_item_id", null: false
    t.json "params", default: {}, null: false
    t.text "content", default: "", null: false
    t.integer "rel_order", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_content_items_on_parent_id"
    t.index ["rel_order"], name: "index_content_items_on_rel_order"
    t.index ["structure_item_id"], name: "index_content_items_on_structure_item_id"
  end

  create_table "inline_items", id: :serial, force: :cascade do |t|
    t.integer "structure_item_id", null: false
    t.string "ident", limit: 100, null: false
    t.string "name", null: false
    t.text "description", default: "", null: false
    t.string "delim_start", limit: 6, null: false
    t.string "delim_end", limit: 6, null: false
    t.text "inline_style", default: "", null: false
    t.text "key_style", default: "", null: false
    t.text "content_style", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ident"], name: "index_inline_items_on_ident"
    t.index ["structure_item_id"], name: "index_inline_items_on_structure_item_id"
  end

  create_table "inline_refs", id: :serial, force: :cascade do |t|
    t.integer "content_item_id", null: false
    t.integer "reference_item_id", null: false
    t.integer "inline_item_id", null: false
    t.integer "start_pos", null: false
    t.integer "end_pos", null: false
    t.string "display", limit: 100, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_item_id"], name: "index_inline_refs_on_content_item_id"
    t.index ["end_pos"], name: "index_inline_refs_on_end_pos"
    t.index ["inline_item_id"], name: "index_inline_refs_on_inline_item_id"
    t.index ["reference_item_id"], name: "index_inline_refs_on_reference_item_id"
    t.index ["start_pos"], name: "index_inline_refs_on_start_pos"
  end

  create_table "structure_items", id: :serial, force: :cascade do |t|
    t.string "type", limit: 30, null: false
    t.string "ident", limit: 100, null: false
    t.string "name", null: false
    t.text "description", default: "", null: false
    t.json "params", default: {}, null: false
    t.json "default_params", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ident"], name: "index_structure_items_on_ident"
    t.index ["type"], name: "index_structure_items_on_type"
  end

  create_table "structure_relations", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id", null: false
    t.boolean "optional", default: true, null: false
    t.integer "rel_order", default: 0, null: false
    t.index ["child_id"], name: "index_structure_relations_on_child_id"
    t.index ["parent_id"], name: "index_structure_relations_on_parent_id"
    t.index ["rel_order"], name: "index_structure_relations_on_rel_order"
  end

end
