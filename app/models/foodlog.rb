class Foodlog < ApplicationRecord
  # t.integer "quantity"
  # t.bigint "food_id", null: false
  # t.bigint "meal_id", null: false

  belongs_to :food
  belongs_to :meal

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true  }

  scope :order_by_popular, -> { order() }

  def calculate_macros(macro = :calories)
    self.quantity * self.food.send(macro)
  end
  
  def serving_calories
    self.quantity * self.food.calories
  end

  def serving_carbs
    self.quantity * self.food.carbs
  end

  def serving_fats
    self.quantity * self.food.fats
  end

  def serving_proteins
    self.quantity * self.food.proteins
  end

# Foodlog.create(quantity: 2, meal: Meal.second, food: Food.third)
# Foodlog.create(quantity: 3, meal: Meal.find(8), food: Food.second)
end