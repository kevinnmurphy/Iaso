class Foodlog < ApplicationRecord
  # t.integer "quantity"
  # t.bigint "food_id", null: false
  # t.bigint "meal_id", null: false

  belongs_to :food
  belongs_to :meal

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true  }

  scope :order_by_popular, -> { order() }

  def log_macros(macro = :calories)
    self.quantity * self.food.send(macro)
  end

  def self.today 
    where("created_at >= ?", Time.now.beginning_of_day) 
  end

end