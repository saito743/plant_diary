class AddNameToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :name, :integer
  end
end
