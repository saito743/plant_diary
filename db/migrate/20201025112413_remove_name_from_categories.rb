class RemoveNameFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :name, :stringr
  end
end
