class CreateTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :trees do |t|
      t.integer :plant_id, null: false
      t.integer :user_id, null: :false
      t.string :title, null: false
      t.string :body, null: false
      t.string :image_id
      t.boolean :ask_for_help, default: :false
      t.timestamps
    end
  end
end