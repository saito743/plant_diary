class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.text :body, null: false
      t.string :image_id, null: false
      t.string :plante
      t.string :difficulty, null: false
      t.timestamps
    end
  end
end
