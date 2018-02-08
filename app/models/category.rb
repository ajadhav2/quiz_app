class Category < ApplicationRecord
  has_many :triviums
  has_many :users_category_scores

end
