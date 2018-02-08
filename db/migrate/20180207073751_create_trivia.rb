class CreateTrivia < ActiveRecord::Migration[5.1]
  def change
    create_table :trivia do |t|
      t.text :question
      t.text :option_a
      t.text :option_b
      t.text :option_c
      t.text :option_d
      t.text :option_e
      t.string :right_answer
      t.integer :user_id

      t.timestamps
    end
  end
end
