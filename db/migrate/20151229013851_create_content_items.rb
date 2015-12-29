class CreateContentItems < ActiveRecord::Migration[5.0]
  def change
    create_table :content_items do |t|
      t.integer :structure_item_id, null: false, index: true
      t.integer :parent_id,         null: false, index: true      
      t.json :params,               null: false, default: {}
      t.text :content,              null: false, default: ''
      t.integer :rel_order,         null: false, default: 0, index: true

      t.timestamps
    end
  end
end
