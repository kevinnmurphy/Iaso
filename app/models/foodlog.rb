class Foodlog < ApplicationRecord
  # t.integer :quantity
  # t.belongs_to :foods, null: false, foreign_key: true
  # t.belongs_to :meals, null: false, foreign_key: true

  belongs_to :food
  belongs_to :meal

end
