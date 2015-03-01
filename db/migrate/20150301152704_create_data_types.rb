class CreateDataTypes < ActiveRecord::Migration
  def change
    create_table :data_types do |t|
      t.string :name
      t.string :ident
      t.string :editor
      t.text :default_value
      t.text :default_params

      t.timestamps null: false
    end
  end
end
