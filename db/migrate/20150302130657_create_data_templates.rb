class CreateDataTemplates < ActiveRecord::Migration
  def change
    create_table :data_templates do |t|
      t.string :name
      t.string :ident
      t.text :description
      t.text :template

      t.timestamps null: false
    end
  end
end
