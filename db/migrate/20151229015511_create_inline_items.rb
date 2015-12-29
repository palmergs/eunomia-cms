class CreateInlineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :inline_items do |t|
      t.integer :structure_item_id, null: false, index: true
      t.string :ident,              null: false, index: true, limit: 100
      t.string :name,               null: false
      t.text :description,          null: false, default: ''
      t.string :delim_start,        null: false, limit: 6
      t.string :delim_end,          null: false, limit: 6
      t.text :inline_style,         null: false, default: ''
      t.text :key_style,            null: false, default: ''
      t.text :content_style,        null: false, default: ''

      t.timestamps
    end
  end
end
