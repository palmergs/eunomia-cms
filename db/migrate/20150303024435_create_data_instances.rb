class CreateDataInstances < ActiveRecord::Migration
  def change
    create_table :data_instances do |t|
      t.integer :data_template_id
      t.string :ident
      t.text :values
      t.text :params

      t.timestamps null: false
    end
  end
end
