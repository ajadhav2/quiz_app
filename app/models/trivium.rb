class Trivium < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates_presence_of :question, :option_a, :option_b, :option_c, :option_d, :option_e,:category_id, :right_answer
end
