class Food < ApplicationRecord
    # t.string "name"
    # t.integer "calories"
    # t.decimal "weight"

    has_many :meals
    has_many :users, through: :meals

    validates :name, presence: true
    validates :calories, presence: true
    # calories > 0
    validates :weight, presence: true
    # weight > 0


end