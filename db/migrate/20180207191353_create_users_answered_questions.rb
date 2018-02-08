class CreateUsersAnsweredQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :users_answered_questions do |t|
      t.integer :user_id
      t.integer :trivium_id

      t.timestamps
    end
  end
end
