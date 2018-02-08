class AddCategoryIdToTrivium < ActiveRecord::Migration[5.1]
  def change
    add_column :trivia, :category_id, :integer
  end
end
