class Meal < ApplicationRecord
    # t.string :name

    belongs_to :user
    has_many :foodlogs
    has_many :foods, through: :foodlogs

    validates :name, presence: true

    scope :order_by_calories, -> { order(price: :desc)}
    scope :order_by_carbs, -> { order(carbs: :desc)}

    #view example
    # @meal.order_by_calories.order_by_carbs(15)
end