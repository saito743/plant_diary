class CreateHelps < ActiveRecord::Migration[5.2]
  def change
    create_table :helps do |t|
      t.integer :tree_id, null: false
      t.boolean :is_active, default: false
      t.timestamps
    end
  end
end
