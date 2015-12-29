class CreateInlineRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :inline_refs do |t|
      t.integer :content_item_id,   null: false, index: true
      t.integer :reference_item_id, null: false, index: true
      t.integer :inline_item_id,    null: false, index: true
      t.integer :start_pos,         null: false, index: true
      t.integer :end_pos,           null: false, index: true
      t.string :display,            null: false, default: '', limit: 100

      t.timestamps
    end
  end
end
