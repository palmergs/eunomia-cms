class CreateStructureItems < ActiveRecord::Migration[5.0]
  def change
    create_table :structure_items do |t|
      t.string :type,           null: false, index: true, limit: 30
      t.string :ident,          null: false, index: true, limit: 100
      t.string :name,           null: false
      t.text :description,      null: false, default: ''
      t.json :params,           null: false, default: {}
      t.json :default_params,   null: false, default: {}

      t.timestamps              null: false
    end
  end
end
