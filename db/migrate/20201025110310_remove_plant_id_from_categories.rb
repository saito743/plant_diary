class RemovePlantIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :plant_id, :integer
  end
end
