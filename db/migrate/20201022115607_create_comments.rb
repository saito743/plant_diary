class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :plant_id, null: false
      t.text :body, null: false
      t.string :comment_image_id
      t.timestamps
    end
  end
end
