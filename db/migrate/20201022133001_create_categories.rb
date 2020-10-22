class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :plant_id, null: false
      t.integer :name, null: false
      t.timestamps
    end
  end
end
