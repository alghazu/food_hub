class AddForkHistoryToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :fork_user, :string, array: true, default: '{}'
    add_column :recipes, :fork_recipe, :string, array: true, default: '{}'
  end
end
