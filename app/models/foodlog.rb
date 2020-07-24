class Foodlog < ApplicationRecord
  # t.integer :quantity
  # t.belongs_to :foods, null: false, foreign_key: true
  # t.belongs_to :meals, null: false, foreign_key: true

  belongs_to :food
  belongs_to :meal

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true  }

  scope :order_by_popular, -> { order() }
end
