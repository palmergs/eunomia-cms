class CreateStructureRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :structure_relations do |t|
      t.integer :parent_id,     null: false, index: true
      t.integer :child_id,      null: false, index: true
      t.boolean :optional,      null: false, default: true
      t.integer :rel_order,     null: false, default: 0, index: true
    end
  end
end
