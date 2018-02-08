class CreateUsersCategoryScores < ActiveRecord::Migration[5.1]
  def change
    create_table :users_category_scores do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :score

      t.timestamps
    end
  end
end
